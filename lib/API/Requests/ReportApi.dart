import 'dart:convert';


import 'package:allolab/API/authAPI.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class Reportapi {


  Future<void> addReports(data,id) async {

    try {
    




    data["id"] = id;
    // return;
    data.remove("created");
    print(data);
    data["details"] = json.decode(data["details"]);
    var d = await postRequest("/report/create", data);
    print(d);
      

    } catch (e) {
      print(e);
      throw e;
    }


  }

}