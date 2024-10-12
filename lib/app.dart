import 'package:allolab/API/apiroutes.dart';
import 'package:allolab/Config/Theme.dart';
import 'package:allolab/Controller/global/InternetController.dart';
import 'package:allolab/Screens/Main/MainScreen.dart';
import 'package:allolab/Screens/Signin/SigninView.dart';
import 'package:allolab/intl/Translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyApp extends StatelessWidget {
   const  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Allolab',
          // initialBinding: Binding(),
          // debugShowCheckedModeBanner: false,
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
          theme: Themes().lightTheme,
          home:Apiroutes.checkUser() ?MainScreen():Signinview(),
        ),
    );
  }
}