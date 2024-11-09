import 'dart:convert';

import 'package:allolab/API/authAPI.dart';
import 'package:allolab/Controller/GlobalPatientController.dart';
import 'package:get/get.dart';

class Userapi {

 static Future<dynamic> getUser() async {
    var req = await postRequest("/hw/check",{});

    print(req);

    return req;
  }

    static Future<String?> getCallToken(String cname) async {
    try {
    final req = await getRequest("/ws/generateToken?cname=$cname");
    return req["token"]; 
    } catch (e) {
        return null;
    }
  }




  static Future<void> addCheckup(appointmentId,vitals ,symptoms) async {

    Globalpatientcontroller gp = Get.put(Globalpatientcontroller());

    Map<String, dynamic> data = {
      "userId":gp.id
    };
    if(appointmentId!=null){
      data["appointmentId"] = appointmentId;
    }
    if(vitals!=null){
      data["vitals"] = vitals;
    }
    if(symptoms!=null){
      data["symptoms"] = symptoms;
    }

    print(data);

    var req = await postRequest("/user/addcheckup",data);
    return req;

  }

  static Future<bool> updateProfile(data) async {

    final req = await putRequest("/hw/updatehealthworker", data);

    return req;


  }



  



  
  
}