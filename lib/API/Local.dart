import 'dart:convert';

import 'package:localstorage/localstorage.dart';

class Local {


  static getUserID() {

    final id = localStorage.getItem("user");

    if(id!=null){

      return json.decode(id)["id"];
    }

    
    return null;
  }
}