import 'dart:convert';

import 'package:allolab/API/authAPI.dart';
import 'package:allolab/Screens/Main/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class Authcontroller extends GetxController{


  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  

Future<void> login () async {
  String uname = username.text;
  String pass = password.text;

  print(uname);
  print(pass);


  try {
    var req = await postRequest("/hw/login", {"email":uname, "password":pass});

    print(req);

    localStorage.setItem("user", json.encode(req));

    Get.offAll(()=>MainScreen(),transition: Transition.cupertino);
  } catch (e) {

    Get.snackbar("Invalid", "Please Try Again",snackPosition: SnackPosition.BOTTOM);
    
  }




}


}