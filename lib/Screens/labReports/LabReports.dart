import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/labReports/Scan/HemoglobinScan.dart';
import 'package:allolab/Screens/labReports/Tests/FetalMonitoring.dart';
import 'package:allolab/Screens/labReports/Tests/Glucose.dart';
import 'package:allolab/Screens/labReports/Tests/Hemoglobin.dart';
import 'package:allolab/Screens/labReports/Tests/UltraSound.dart';
import 'package:allolab/Screens/labReports/Tests/Urine.dart';
import 'package:allolab/db/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sqflite/sqflite.dart';

class LabReports extends StatelessWidget {
   LabReports({super.key});

  List<LabreportOptions> ls = [
  LabreportOptions("Hemoglobin Test",Hemoglobin(),"hemoglobin.png"),
  LabreportOptions("Urine Test",Urine(),"urinetest.png"),
  LabreportOptions("Glucose Test",Glucose(),"glucose.png"),
  LabreportOptions("Fetal Monitoring",Fetalmonitoring(),"fetalmon.png"),
  LabreportOptions("UltraSound Test",Ultrasound(),"ultrasound.png"),

  
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:() async {

        Database db = await Sqlite.db();
      List<Map<String,dynamic>> d = await  db.query("my_table");

      print(d);

        
      },),
      appBar: AppBar(
        title: Text("Lab Reports"),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          width: double.infinity,
          child: Column(children: [
            Image.asset(
              "assets/reportsicon.png",
              // scale: 1,
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Let's begin the test",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
        
        
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: ls.length,
              shrinkWrap: true,
              itemBuilder:(context, index) {
                String title = ls[index].x;
                Widget sc = ls[index].screen;
                String img = ls[index].img;
        
        
        
                return Column(
                  children: [
                    Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Black)),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        highlightColor: accentColor.withOpacity(0.1),
                        splashColor: accentColor.withOpacity(0.8),
                        onTap: () =>
                        Get.to(() => sc ,
                            transition: Transition.rightToLeft),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: ListTile(
                            leading: Image.asset(
                              "assets/labReports/$img",
                              scale: 12,
                            ),
                            title: Text(
                              title,
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing:
                                Icon(Icons.arrow_forward_ios_rounded, color: Black),
                          ),
                        ))),
                        SizedBox(
              height: 20,
            ),
                  ],
                );
           
              }),    
          ]),
        ),
      ),
    );
  }
}

class LabreportOptions {

  LabreportOptions(this.x, this.screen,this.img);
  String x; 
  Widget screen;
  String img;
}