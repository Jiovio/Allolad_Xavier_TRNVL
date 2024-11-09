import 'dart:convert';
import 'dart:io';
import 'dart:math';



import 'package:allolab/API/Local.dart';
import 'package:allolab/API/Requests/Userapi.dart';
import 'package:allolab/Controller/User/UserController.dart';
import 'package:allolab/Models/messages.dart';
import 'package:allolab/Screens/Call/CallView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
class OurFirebase {

  static final db = FirebaseFirestore.instance;

  static final storage = FirebaseStorage.instance;

  static final storageRef = FirebaseStorage.instance.ref();

 static final FirebaseDatabase database = FirebaseDatabase.instance;

  static final ai = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash',
  generationConfig: GenerationConfig(
    responseMimeType: "application/json"
  ),
  );

    static final textai = FirebaseVertexAI.instance.generativeModel(model: 'gemini-1.5-flash',
  );


  static Future<String> uploadImageToFirebase(String appName , String path,String filename,File image,[String? phone]) async {



  final spaceRef = OurFirebase.storageRef.child("/$appName/$phone/$path/$filename");

  print(spaceRef.bucket);

  try {
    await spaceRef.putFile(image);
    String path =  await spaceRef.getDownloadURL();
     return path;
    } catch (e) {
      return "Error";
    }
  }

    static Future<String> uploadAudioToStorage(String path,File audio) async {

    var d = await Userapi.getUser();

    String phone = d["phone_number"];
    String date = DateTime.now().toString();


  final spaceRef = OurFirebase.storageRef.child("/Allobaby/$phone/$path/$date.aac ");

  print(spaceRef.bucket);

  try {
    await spaceRef.putFile(audio);
    String path =  await spaceRef.getDownloadURL();
     return path;
    } catch (e) {
      return "Error";
    }
  }


      static Future<void>  createCall(String p2, String p1,String type) async {
      Usercontroller controller = Get.put(Usercontroller());
      final token = await Userapi.getCallToken(p1);
      if(token==null){
        Get.snackbar("Call Failed", "Error Making Call");
        return;
      }
      try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("calls/$p2");
     await  ref.set({
      "call":true, 
      "callerName":controller.name.text,
      "p1":p1,
      "p2":p2,
      "token":token,
      "type":type
      });
      Get.to(Callview(channel: p1,token: token,path: p2,));
      } catch (e) {
        print(e);
      }
    }


   static Future<String> askVertexAi(File img , String promp) async{

      final prompt = TextPart(promp);
final image = await img.readAsBytes();
final imagePart = DataPart('image/jpeg', image);

    final response = await ai.generateContent([
      Content.multi([prompt,imagePart])
    ]);
        // print(response.text);
        return response.text??"";
    }

    static Future<bool>  cutCall(String path) async {
      try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("calls/$path");
     await  ref.set({
      "call":false
      });

      return true;
      
      } catch (e) {
        print(e);

        return false;
      }
    }


    static Future<bool> createDataWithName(String collection,String docName,dynamic data) 
    async {
    db
    .collection(collection)
    .doc(docName)
    .set(data)
    .onError((e, _) {
      print("Error writing document: $e");
      return false;
      });
      return true;
    }

    static void createUser (phone,data) {

      createDataWithName("AllobabyUsers",phone, data);

    }


static Future<List<Map<String, dynamic>>> getReports() async {

    var d = await Userapi.getUser();
    String phone = d["phone_number"];


    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("reports")
        .where("phone", isEqualTo: phone)
        .get();


    List<Map<String, dynamic>> reports = querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    return reports;
  }


  static Future<Map<String, dynamic>> getAIAppointments() async {
    try {
      var d = await Userapi.getUser();
      print(d);
      var status = d["pregnancy_status"];
      var lmp_date = d["lmp_date"];
      var ed_date = d["ed_date"];
      
      String date = DateTime.now().toString();


      String temp = """
      This is my lmp date $lmp_date my status is $status current date is $date. 
      check whether iam pregnant 
      and generate dates for my whole pregnancy of upcoming regular checkup appointment till the ed date 
      if not pregnant return dates as {} 
""";
      
      String prompt = """
pregnant women with LMP Date of $lmp_date. my details are $d 
calculate the EDD date and monthly ANC appointment date every month one ANC and weekly pregnancy information for 40 weeks starting from next month date and tell my the current pregnancy week and

      in the schema {
        is_pregnant:bool,
        summary : text
        dates :{
          [month year]: [String of dates]
        }
      }
      """;
      
      var res = await ai.generateContent([Content.text(prompt)]);
      
      if (res.text != null) {
        Map<String, dynamic> data = json.decode(res.text as String);
        print("******************************");
        print(data);
        return data;
      } else {
        throw Exception('No response from AI');
      }
    } catch (e) {
      print("Error in getAIAppointments: $e");
      throw e;
    }
  }

           static Future<String> audioAI(File aud , String promp) async{

      final prompt = TextPart(promp);
final audio = await aud.readAsBytes();
final imagePart = DataPart('audio/aac', audio);

    final response = await ai.generateContent([
      Content.multi([prompt,imagePart])
    ]);
        // print(response.text);
        return response.text??"";
    }

    static Future<void>  addUser() async {

      try {
         DatabaseReference ref = FirebaseDatabase.instance.ref("users/P1");
      await ref.set({"name":"Astro"});
      } catch (e) {

        print(e);
        
      }


    }

    static Future<void>  addMessages(Messages msg,String to, dynamic details) async {

      try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/$to");
      DatabaseReference newMessRef = ref.push();

      print(msg.toMap());

      await newMessRef.set({...msg.toMap(),...details});
      } catch (e) {

        print(e);
        
      }
    }

    


    static Future<dynamic> getCurrentMessages() async{
      final userid = Local.getUserID();
      DatabaseReference ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child("users/D$userid").get();
      print(userid);
      print(snapshot);
      if(snapshot.exists){
        print(snapshot.value);  
      }
      return snapshot.value;
    }




}