
import 'dart:convert';

import 'package:allolab/Components/textfield.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/Reports/glucoseController.dart';
import 'package:allolab/Screens/Screening/Vitals/BloodGlucose.dart';
import 'package:allolab/Screens/labReports/Widgets/selectorWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Glucose extends StatelessWidget {
  const Glucose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Glucose Report"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: 
          GetBuilder<Glucosecontroller>(
            init: Glucosecontroller(),
            builder:(controller) => 
          Column(

            children: [

              GestureDetector(
                onTap: () => showDialog(
                            context: context,
                            builder: (context) => Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              color: Black,
                              child: Material(
                                color: Colors.transparent,
                                child: Stack(
                                  children: [
                                    InteractiveViewer(
                                      child: Center(
                                        child: 
                                        controller.fileImage64 == null
                                            ? Text(
                                                "NO IMAGE",
                                                style: TextStyle(
                                                    fontSize: 18, color: White),
                                              )
                                            : Image.memory(base64Decode(
                                                controller.fileImage64)),


                                                
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: IconButton(
                                          icon:const Icon(
                                            Icons.arrow_back,
                                            color: White,
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: 
                            controller.fileImage64 == null
                            ? Center(
                                child: Text(
                                "Click Add Image Button",
                                style: TextStyle(fontSize: 18),
                              ))
                            : Image.memory(
                                base64Decode(controller.fileImage64)),

                      ),
              ),

                        const SizedBox(
                height: 10.0,
              ),


                          TextButton.icon(
                  onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                            height: MediaQuery.of(context).size.height / 5,
                            color: White,
                            padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Choose photo from :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                FloatingActionButton(
                                    elevation: 0,
                                    tooltip: "Camera",
                                    onPressed: () => 
                                        controller.getImageFromCamera(),
                                    backgroundColor: Colors.amberAccent,
                                    child: Image.asset(
                                      'assets/camera.png',
                                      scale: 16,
                                    )),
                                FloatingActionButton(
                                    elevation: 0,
                                    focusColor: Colors.greenAccent,
                                    tooltip: "Gallery",
                                    onPressed: () => 
                                        controller.getImageFromGallery(),
                                    backgroundColor: Colors.indigoAccent,
                                    child: Image.asset(
                                      'assets/gallery.png',
                                      scale: 16,
                                    )),
                              ],
                            ),
                          )),
                  icon: Icon(Icons.add_a_photo),
                  label: Text("Upload Report")),

                                SizedBox(
                height: 10.0,
              ),

                          // searchBox("Report of ?",["Mother", "Child"]),





                                           SizedBox(
                height: 10.0,
              ),




                          ListTile(
                            leading: Image.asset("assets/labReports/hemoglobin.png"),
                            title: Text("Blood Glucose Value : ${controller.glucoseValue.toString()}"),
                            subtitle: Text("Tap to Change "),
                            shape: OutlineInputBorder(borderSide: BorderSide(
                              color: Colors.grey
                            )),

                            onTap: () {
                              showDialog(context: context, builder:(context) {
                                return AlertDialog(
                                  title: Text("Blood Glucose Value"),

                                  content: glucoseSelector());
                              },);
                            },
                          ),

              const SizedBox(
                height: 20.0,
              ),

                            TFField(label: "Description",mLines: 5,txtController: controller.desc,),

               const SizedBox(
                height: 20.0,
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: controller.submit,
                  child: Text("ADD REPORT"))






            ],
          ),
          )
          
          )
        ),

    );
  }



}