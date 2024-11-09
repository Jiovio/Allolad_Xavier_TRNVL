
import 'package:allolab/API/Requests/ReportApi.dart';
import 'package:allolab/Components/snackBar.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Config/OurFirebase.dart';
import 'package:allolab/Controller/GlobalPatientController.dart';
import 'package:allolab/db/dbHelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:io' as Io;
import 'dart:convert' as convert;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:math';
class Hemoglobincontroller extends GetxController {


int hemoGlobinValue = 12;

TextEditingController desc = TextEditingController();

String url = "";

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

      askAI(image);

      
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
      askAI(image);

      Fluttertoast.showToast(
          msg: "Report Updated Successfully", backgroundColor: PrimaryColor);
    } else {
      print('No image selected.');
    }
    update();
  }

  Future<void> submit () async {



    // return;

    Map<String,dynamic> reportData = {
      "hemoglobinValue":hemoGlobinValue,
    };

        Globalpatientcontroller gp = Get.put(Globalpatientcontroller());

    String phone = gp.phone ?? "";
        var random = Random();
  int randomInt = random.nextInt(1000000);

String  url = await OurFirebase.uploadImageToFirebase("Allobaby","reports","l$phone $randomInt.jpg", image,phone);
    Map<String,dynamic> data = {
      "reportType":"Hemoglobin",
      "details":json.encode(reportData),
      "reportFile":fileImage64,
      "imageurl":url,
      "description":desc.text,
      "phone":phone
    };

    // print("________________________________________________________________________");

    addReports(data);

    data["created"] = DateTime.now().toString();

    data.remove("reportFile");

    OurFirebase.createDataWithName("reports","$phone $randomInt",data);

    data.remove("created");

    // print(data);
    
    await Reportapi().addReports(data,gp.id as int);

    showToast("Success","Report Added Successfully");

    Get.back();

    // showToast("Please Enter All Details",'Fields are empty. please enter all fields.');
  }

  
  Future<void> askAI(File img) async {

      String prompt = """This is a health report. 
      give me hemoglobin value and the general summary in the schema 
      {hemoglobinValue:int,
      summary:string}""";
      dynamic res = json.decode(await OurFirebase.askVertexAi(image, prompt));
      desc.text = res["summary"]??"";
      // 
      hemoGlobinValue = res["hemoglobinValue"]??12;

      // 
      update();
  }


  Future<void> uploadImage(File image) async {

  final spaceRef = OurFirebase.storageRef.child("/space.jpg");

  print(spaceRef.bucket);

  try {

 var upl =  await spaceRef.putFile(image);
 print(await spaceRef.getDownloadURL());

  print("Uploaded");
    } catch (e) {

    }

  }





}