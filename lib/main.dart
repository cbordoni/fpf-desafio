import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fpf_flutter/modules/home_page.dart';

void main() => runApp(GetMaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: "/",
  defaultTransition: Transition.native,
  locale: const Locale('pt', 'BR'),
  getPages: [
    GetPage(name: "/", page: () => const HomePage())
  ],
));