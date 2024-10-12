import 'package:allolab/API/authAPI.dart';
import 'package:localstorage/localstorage.dart';

class Userapi {

 static Future<dynamic> getUser() async {
    var req = await postRequest("/hw/check",{});

    print(req);

    return req;
  }




  
  
}