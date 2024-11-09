import 'package:allolab/API/authAPI.dart';
import 'package:allolab/Screens/Patient/PatientDetails.dart';
import 'package:allolab/db/dbHelper.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Patientscontroller extends GetxController {


  TextEditingController phone = TextEditingController();


  bool patientFound = false;

  var patient;


  void findPatient(String val) async {

    if(val.length<10){
      patientFound = false;
      update();
      return;
    }

    try {
    var req = await getRequest("/hw/findpatientbyphone/${phone.text}");
    patient = req;
    print(req);
    patientFound = true;
    update();
    } catch (e) {
      Get.snackbar("Patient Not Found",
      "There is no patient matching the phone number entered"
      ,snackPosition: SnackPosition.BOTTOM);
      print("error _______________________");
      patientFound = false;
      update();
    }
  }


  void navigateToPatient(data) async {
    print(patient);
    addPatientToHistory(patient);
  Get.to(()=>PatientDetails(id: data["id"],name: data["name"],data: data, phone: data["phone_number"],),arguments: data);

  }


  Future<List<dynamic>> getReports(id) async {

      List<dynamic> d = await getRequest("/report?user_id=$id") ;

      print(d);


      return d;
  }


}