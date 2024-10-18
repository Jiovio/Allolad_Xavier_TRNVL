
import 'dart:convert';

import 'package:allolab/API/Requests/Userapi.dart';
import 'package:allolab/utils/backgroundservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:workmanager/workmanager.dart';

class Usercontroller extends GetxController{

    void scheduleBackgroundTask() {
  Workmanager().registerOneOffTask(
    "1",
    "listenForDataTask", 
  );
}

  RxBool loading = true.obs;

 Future<void> initScreen() async {
  var req = await Userapi.getUser();

  print(req);
  
  fromJson(req);

  loading.value = false;

  // scheduleBackgroundTask();

  Backgroundservice.listenForData();
  update();

 }



    @override
  void onInit() {
    super.onInit();
    initScreen();
  }



  String locale = "English";

   TextEditingController  name = TextEditingController();

String gender = "Male";
   TextEditingController  age = TextEditingController();

String yearOfExperience = "";
TextEditingController title  = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController pincode = TextEditingController();


void fromJson(dynamic data) {
  name.text = data["name"];
  gender = data["gender"];
  age.text = data["age"].toString(); // Convert age to string if it's not already
  yearOfExperience = data["year_of_experience"].toString();
  title.text = data["title"];
  address.text = data["address"];
  pincode.text = data["pincode"].toString(); // Convert pincode to string if necessary
}



}