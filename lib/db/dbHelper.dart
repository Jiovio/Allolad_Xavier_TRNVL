

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
      "age": patient["age"],
      "data": json.encode(patient)
};

int aid = await db.insert("patients",data );

print(aid);


}

Future<List<Map<String, dynamic>>> getLocalPatients() async {
  Database db = await Sqlite.db();
  var d = await db.query("patients");
  return d;
}

createChatTable() async{
  Database db = await Sqlite.db();
  await db.execute('''
    DROP TABLE chats;
''');
  await db.execute('''
    DROP TABLE chatlist;
''');

await db.execute('''
CREATE TABLE chats (
  id TEXT NOT NULL,
  senderId TEXT NOT NULL,
  receiverId TEXT NOT NULL,
  type TEXT,
  message TEXT,
  timestamp TIMESTAMP NOT NULL,
  photoUrl TEXT,
  fileUrl TEXT,
  fileSize TEXT,
  fileName TEXT,
  fid TEXT
);
''');

  await db.execute('''
    CREATE TABLE chatlist (
      name TEXT,
      fid TEXT,
      id TEXT,
      type TEXT,
      lastMessage TEXT,
      recent TIMESTAMP
    );
  ''');
}


Future<bool> insertChatData( String name, String fid, String id, String type, String lastMessage, String recent) async {
  try {
    Database db = await Sqlite.db();


    // Prepare data to insert
    Map<String, dynamic> chatData = {
      'name': name,
      'fid': fid,
      'id': id,
      'type': type,
      'lastMessage': lastMessage,
      'recent': DateTime.parse(recent).toIso8601String(), // store the timestamp in ISO 8601 format
    };
    
    // Insert the data into the chatlist table
    await db.insert(
      'chatlist',
      chatData,
      conflictAlgorithm: ConflictAlgorithm.replace, // if there's a conflict, replace the existing row
    );
    return true; // Insertion was successful
  } catch (e) {
    print("Error inserting chat data: $e");
    return false; // Insertion failed
  }
}


Future<bool> insertChatMessage({
  required String id,
  required String senderId,
  required String receiverId,
  String? type,
  String? message,
  required String timestamp,
  String? photoUrl,
  String? fileUrl,
  String? fileSize,
  String? fileName,
  String? fid

}) async {

  Database db = await Sqlite.db();

  
  try {
    // Prepare the data to be inserted
    Map<String, dynamic> chatMessageData = {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'type': type,
      'message': message,
      'timestamp': DateTime.parse(timestamp).toIso8601String(), // store timestamp in ISO 8601 format
      'photoUrl': photoUrl,
      'fileUrl': fileUrl,
      'fileSize': fileSize,
      'fileName': fileName,
      "fid" : fid
    };

    // Insert the data into the chats table
    await db.insert(
      'chats',
      chatMessageData,
      conflictAlgorithm: ConflictAlgorithm.replace, // Replace if id already exists
    );
    return true; // Insertion was successful
  } catch (e) {
    print("Error inserting chat message: $e");
    return false; // Insertion failed
  }
}

Stream<List<Map<String, dynamic>>> getChatListStream(String type) async* {
  while (true) {
    Database db = await Sqlite.db();
    final data = await db.query("chatlist", where: "type=?", whereArgs: [type]);
    yield data;
    await Future.delayed(Duration(seconds: 5)); // Adjust the delay as needed
  }
}



Future<dynamic> getChatList(String type) async {
Database db = await Sqlite.db();

final data = await db.query("chatlist",
where: "type=?",
whereArgs: [type]);

return data;

}

Future<bool> checkWhetherChatExists(String fid) async {

Database db = await Sqlite.db();


  final data = await db.query("chatlist",
where: "id=?",
whereArgs: [fid]);

return data.isNotEmpty;

}


Future<bool> checkWhetherChatMessageExists(String fid) async {

Database db = await Sqlite.db();


  final data = await db.query("chats",
where: "fid=?",
whereArgs: [fid]);

return data.isNotEmpty;

}


Future<void> updateRecentMessage(String id , String message, String timestamp) async {

Database db = await Sqlite.db();

  await db.update("chatlist",
  where: "id = ?",
  whereArgs: ["id"],
  {
    "lastMessage": message,
    "recent": DateTime.parse(timestamp).toIso8601String()
  }
  );

}