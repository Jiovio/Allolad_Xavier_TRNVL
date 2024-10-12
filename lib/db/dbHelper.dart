

import 'dart:convert';

import 'package:allolab/API/apiroutes.dart';
import 'package:allolab/db/sqlite.dart';
import 'package:allolab/temp/ReportListPage.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';


String hashId(dynamic id){
  DateTime currentd = new DateTime.now();
  var bytes = utf8.encode(currentd.toString()+id.toString());
   var digest = sha1.convert(bytes);
   
   return digest.toString();
}

Map<String,dynamic> addToDb (String type, dynamic details, dynamic image) {

  return {
      "reportType":type,
      "details":json.encode(details),
      "image":image,

    };

}


void addReports(Map<String, Object?> data) async {

  Database db = await Sqlite.db();


  await db.insert("reports",{...data,"reportId":hashId(1)} );


  Get.snackbar("Report Added Successfully", "The Report has been added Successully");

}

// Future<List<Map<String, Object?>>> 
getReports() async {
  Database db = await Sqlite.db();
  var d = await db.query("reports");
  // print(d);
  // print("Hii");
  Get.to(ReportListPage(),arguments: d);
  // return d;
}

void addPatientToHistory(patient) async {
Database db = await Sqlite.db();


List<Map<String, Object?>> d = await db.query("patients",where: "uid = ?",whereArgs: [patient["id"]]);


if(d.isNotEmpty){
  return;
}

var hid = Apiroutes.getHealthWorkerID();

print(patient);

var data = {
  "hid":hid,
      "uid": patient["id"],
      "name": patient["name"],
      "gender": patient["gender"],
      "phone": patient["phone_number"],
      "age": patient["age:"],
};

int aid = await db.insert("patients",data );

print(aid);


}

Future<List<Map<String, dynamic>>> getLocalPatients() async {
  Database db = await Sqlite.db();
  var d = await db.query("patients");
  return d;
}