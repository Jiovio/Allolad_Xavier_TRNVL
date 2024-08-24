import 'package:allolab/Screens/Main/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController{


  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  

void login () {
  String uname = username.text;
  String pass = password.text;

  print(uname);
  print(pass);


  Get.offAll(()=>MainScreen(),transition: Transition.cupertino);


}


}