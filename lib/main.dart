import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/modules/pages/home_page.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    defaultTransition: Transition.cupertino,
    locale: const Locale('pt', 'BR'),
    getPages: [
      GetPage(name: "/", page: () => HomePage()),
    ],
  ));
}
