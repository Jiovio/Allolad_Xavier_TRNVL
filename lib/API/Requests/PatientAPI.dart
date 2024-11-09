
import 'package:allolab/API/authAPI.dart';

class Patientapi {


  static Future<bool> updateUser(data,id) async {

    var req = await putRequest("/hw/updatepatient",{...data, "id": id});

    return req;
  }


   static Future<dynamic> getUserById(id) async {
      try {
      var d = await getRequest("/hw/findpatientbyid/$id");
      if(d!=null){
        print(d);
        return d;
      }else{
        return false;
      }
        
      } catch (e) {
        return false;
      }
  }
}