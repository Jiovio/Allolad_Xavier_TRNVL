

import 'dart:io';


import 'package:allolab/API/Requests/PatientAPI.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Config/OurFirebase.dart';
import 'package:allolab/utils/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io' as Io;
import 'dart:convert' as convert;

class Editprofilecontroller extends GetxController {

  RxBool loading = true.obs;

  int? id;


  void setPatientData (int id) async {

      var d = await Patientapi.getUserById(id);

  fromJson(d);
  print("*********************");

  print(d);

  loading.value = false;
  update();


  }




    String? profile_pic;


  Future getImageFromCamera() async {

     profile_pic = await Imageutils.getImageFromCamera("/profilepics",phoneNumber.text);
     setUpdateData("profile_pic",profile_pic);
    update();
  }

    Future<void> getImageFromGallery() async {
     profile_pic = await Imageutils.getImageFromGallery("/profilepics",phoneNumber.text);
     setUpdateData("profile_pic",profile_pic);
    update();
  }












// 

  String? imageurl;


  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextEditingController lmpDate = TextEditingController();
  TextEditingController edDate = TextEditingController();
  TextEditingController alternatePhone = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController partnerName = TextEditingController();
  TextEditingController partnerPhone = TextEditingController();
  TextEditingController doorNo = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController otherInformation = TextEditingController();
  TextEditingController numberOfChildren = TextEditingController();
  TextEditingController averageLengthOfCycles = TextEditingController();
  TextEditingController partnerPhoneVerified = TextEditingController();
  TextEditingController deliveryDate = TextEditingController();
  String created = "";


  String? pregnancyStatus ;

  TextEditingController area = TextEditingController();
  // String area = "";



  
  String gender = "Female";
  String bloodGroup = "A+";




    fromJson(Map<String, dynamic> data) {
      id = data["id"];
    name.text = data['name'] ?? '';
    age.text = data['age']?.toString() ?? '';
    email.text = data['email'] ?? '';
    pincode.text = data['pincode']?.toString() ?? '';
    lmpDate.text = data['lmp_date'] ?? '';
    edDate.text = data['ed_date'] ?? '';
    alternatePhone.text = data['alternate_phone']?.toString() ?? '';
    phoneNumber.text = data['phone_number']?.toString() ?? '';
    partnerName.text = data['partner_name'] ?? '';
    partnerPhone.text = data['partner_phone']?.toString() ?? '';
    doorNo.text = data['door_no'] ?? '';
    streetName.text = data['street_name'] ?? '';
    pregnancyStatus = data['pregnancy_status'] ?? '';
    otherInformation.text = data['other_information'] ?? '';
    numberOfChildren.text = data['number_of_children']?.toString() ?? '';
    averageLengthOfCycles.text = data['average_length_of_cycles']?.toString() ?? '';
    partnerPhoneVerified.text = data['partner_phone_verified']?.toString() ?? '';
    deliveryDate.text = data['delivery_date'] ?? '';

    // Non-editable fields
    gender = data['gender'] ?? 'Female';
    bloodGroup = data['blood_group'] ?? 'A+';
    created = data["created_at"]??"";

    area.text = data["area"]??"";

    profile_pic = data["profile_pic"];

  }

  Map<String, dynamic> updateData = {

  };


  void setUpdateData(String key, dynamic value) {
      updateData[key] = value;
  }

  Future<void> updateProfile() async{


    if(updateData.isEmpty){

      Get.snackbar("No Data to Update", "Update the Fields"
      ,snackPosition: SnackPosition.BOTTOM);


    }else{

    print(updateData);

   var req =  await Patientapi.updateUser(updateData,id);

   if(req){

    Get.back();

    Get.snackbar("Updated Successfully !", "User Details are updated successfully"
      ,snackPosition: SnackPosition.BOTTOM);

      
    
   }else{

        Get.snackbar("Failed to Update", "Please Try Again"
      ,snackPosition: SnackPosition.BOTTOM);

   }


    }





  }



}