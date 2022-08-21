import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/modules/pages/home_page.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

void main() {
  ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Colors.amber,
      secondary: Colors.red,
    ),
  );

  ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: HexColor('#b0c40f'),
      secondary: HexColor('#39b54a'),
    ),
  );

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.cupertino,
    locale: const Locale('pt', 'BR'),
    getPages: [
      GetPage(name: '/', page: () => HomePage()),
    ],
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: ThemeMode.dark,
  ));
}
