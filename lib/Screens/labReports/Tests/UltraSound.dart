
import 'package:allolab/Components/form.dart';
import 'package:allolab/Components/textfield.dart';
import 'package:allolab/Config/Color.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';

class Ultrasound extends StatelessWidget {
  const Ultrasound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ultra Sound "),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

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
                                      child:const Center(
                                        child: 
                                        // controller.fileImage64 == null
                                        //     ? Text(
                                        //         "NO IMAGE",
                                        //         style: TextStyle(
                                        //             fontSize: 18, color: White),
                                        //       )
                                        //     : Image.memory(base64Decode(
                                        //         controller.fileImage64)),

                                              Text(
                                                "NO IMAGE",
                                                style: TextStyle(
                                                    fontSize: 18, color: White),
                                              )
                                                
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
                              const Center(
                                child: Text(
                                "Click Add Image Button",
                                style: TextStyle(fontSize: 18),
                              ))

                      ),
              ),

                        const SizedBox(
                height: 10.0,
              ),


                          Row(
                            children: [
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
                                        onPressed: () => {},
                                            // reportController.getImageFromCamera(),
                                        backgroundColor: Colors.amberAccent,
                                        child: Image.asset(
                                          'assets/camera.png',
                                          scale: 16,
                                        )),
                                    FloatingActionButton(
                                        elevation: 0,
                                        focusColor: Colors.greenAccent,
                                        tooltip: "Gallery",
                                        onPressed: () => {},
                                            // reportController.getImageFromGallery(),
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


                                       TextButton.icon(onPressed: (){
                                          
                                         }, 
                                         icon: Icon(Icons.account_tree_sharp),
                                         label: Text("Automatic"),) 
                            ],
                          ),

                          dropDown("Fetal Movement ", ["Present","Absent"]),


                                SizedBox(
                height: 20.0,
              ),

                          dropDown("Fetal Presentation", ["Cephalic", "Breech","Shoulder","Compound"]),

                                                     SizedBox(
                height: 20.0,
              ),

                          dropDown("Placenta", 
                          ["Posterior","Anterior","Fundal","Lateral","Low-lying"]),

                           SizedBox(
                height: 20.0,
              ),


                                        ListTile(
                            leading: Image.asset("assets/labReports/heart.png"),
                            title: Text("Heart Rate : 60 BPM"),
                            subtitle: Text("Tap to Change "),
                            shape: OutlineInputBorder(borderSide: BorderSide(
                              color: Colors.grey
                            )),

                            onTap: () {
                              showDialog(context: context, builder:(context) {
                                return AlertDialog(
                                  title: Text("Heart Rate "),

                                  content: Row(
                                    children: [
                                      NumberPicker(
                                                      
                                            value: 40,
                                                          minValue: 30,
                                                          itemHeight: 32,
                                                          maxValue: 150,
                                                          onChanged: (value) {
                                                          
                                                          },
                                                        ),

                                                        SizedBox(width: 10,),

                                                        Text("BPM",
                                                        style: TextStyle(fontSize: 14),)
                                    ],
                                  ),);
                              },);
                            },
                          ),




                                           SizedBox(
                height: 10.0,
              ),

              //               TextFormField(
              //   // controller: reportController.reportDesc,
              //   decoration: InputDecoration(
              //       labelText: "Write Description",
              //       border: OutlineInputBorder()),
              //   keyboardType: TextInputType.text,
              //   maxLines: 5,
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return 'Please enter Description';
              //     }
              //     return null;
              //   },
              // ),

              const SizedBox(
                height: 20.0,
              ),

              TFField(label: "Description",mLines: 5,),

               const SizedBox(
                height: 20.0,
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(300, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () => {},
                  child: Text("ADD REPORT"))






            ],
          ),
          )
        ),

    );
  }



}