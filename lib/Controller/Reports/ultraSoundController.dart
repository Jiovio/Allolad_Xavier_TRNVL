
import 'package:allolab/Config/Color.dart';
import 'package:allolab/db/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:io' as Io;
import 'dart:convert' as convert;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class Ultrasoundcontroller extends GetxController {

int hemoGlobinValue = 12;


String fetalPresentation = "";
String fetalMovement = "";
String Placenta = "";

TextEditingController desc = TextEditingController();
String alphaminePresent = "";
String sugarPresent = "";


int heartRate = 60;
  late File image;

  final picker = ImagePicker();

  var fileImage64;

  Future getImageFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 20);
    if (pickedFile != null) {
      final bytes = await Io.File(pickedFile.path).readAsBytes();
      fileImage64 = convert.base64Encode(bytes);
      image = File(pickedFile.path);
      Fluttertoast.showToast(
          msg: "Report Updated Successfully", backgroundColor: PrimaryColor);
    } else {
      print('No image selected.');
    }
    update();
  }

    Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );
    if (pickedFile != null) {
      final bytes = await Io.File(pickedFile.path).readAsBytes();
      fileImage64 = convert.base64Encode(bytes);
      image = File(pickedFile.path);
      Fluttertoast.showToast(
          msg: "Report Updated Successfully", backgroundColor: PrimaryColor);
    } else {
      print('No image selected.');
    }
    update();
  }

      void submit (){
    Map<String,dynamic> reportData = {
      "fetalPresentation":fetalPresentation,
      "fetalMovement":fetalMovement,
      "placenta":Placenta,
      "heartRate":heartRate
    };

    Map<String,dynamic> data = {
      "reportType":"Ultrasound",
      "details":json.encode(reportData),
      "reportFile":fileImage64,

    };

    addReports(data);

    // showToast("Please Enter All Details",'Fields are empty. please enter all fields.');
  }


}