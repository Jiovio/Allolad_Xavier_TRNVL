

import 'package:get/get.dart';

class Globalpatientcontroller extends GetxController {


  int? id;
  String? phone ;


  void setUser(int uid,String phones){
    id = uid;
    phone = phones;

    print(id);
  }



}