import 'dart:convert';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Awareness/Awareness.dart';
import 'package:allolab/Screens/Patient/Appointment.dart';
import 'package:allolab/Screens/Patient/Checkup.dart';
import 'package:allolab/Screens/Patient/MyAppointmetScreen.dart';
import 'package:allolab/Screens/Patient/Report.dart';
import 'package:allolab/Screens/Screening/SelfScreening.dart';
import 'package:allolab/Screens/Profile/UpdateProfile.dart';
import 'package:allolab/Screens/labReports/LabReports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Patient Details"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
              Container(
              color: PrimaryColor,
              padding: EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      splashColor: PrimaryColor,
                                      onTap: () => 
                                      Get.to(()=>UpdateProfile(),transition: Transition.leftToRight),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: 100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                                  CircleAvatar(
                                                  backgroundColor:
                                                      Colors.transparent,


                                                  child: false
                                                  // controller .fileImage64 !=null
                                                      ? 
                                                      Image.memory(
                                                          base64Decode("hi"
                                                              // controller.fileImage64
                                                                  ),
                                                          fit: BoxFit.contain,
                                                        )
                                                      : CachedNetworkImage(
                                                          imageUrl: true
                                                          // patientDetails
                                                          //         .photo!
                                                          //         .isEmpty
                                                              ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                                                              : "test",
                                                              // patientDetails.photo!,
                                                          fit: BoxFit.contain,
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          52),
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          placeholder:
                                                              (context, url) =>
                                                                  Container(),
                                                        ),
                                                  radius: 52,
                                                ),
                                              
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Text(
                                                "Patient Name".tr,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "Dev Patil",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                               
                                                               Expanded(
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      splashColor: PrimaryColor,
                                      onTap: () => 
                                      Get.to(()=>UpdateProfile(),transition: Transition.leftToRight),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: 100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [


                                                //   CircleAvatar(
                                                //   backgroundColor:
                                                //       Colors.transparent,


                                                //   child: false
                                                //   // controller .fileImage64 !=null
                                                //       ? 
                                                //       Image.memory(
                                                //           base64Decode("hi"
                                                //               // controller.fileImage64
                                                //                   ),
                                                //           fit: BoxFit.contain,
                                                //         )
                                                //       : CachedNetworkImage(
                                                //           imageUrl: true
                                                //           // patientDetails
                                                //           //         .photo!
                                                //           //         .isEmpty
                                                //               ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                                                //               : "test",
                                                //               // patientDetails.photo!,
                                                //           fit: BoxFit.contain,
                                                //           imageBuilder: (context,
                                                //                   imageProvider) =>
                                                //               Container(
                                                //             decoration:
                                                //                 BoxDecoration(
                                                //               borderRadius:
                                                //                   BorderRadius
                                                //                       .circular(
                                                //                           52),
                                                //               image:
                                                //                   DecorationImage(
                                                //                 image:
                                                //                     imageProvider,
                                                //                 fit: BoxFit
                                                //                     .cover,
                                                //               ),
                                                //             ),
                                                //           ),
                                                //           placeholder:
                                                //               (context, url) =>
                                                //                   Container(),
                                                //         ),
                                                //   radius: 52,
                                                // ),
                                              
                                                CircleAvatar(
                                                  backgroundColor: Colors.transparent,
                                                  radius: 52,
                                                  child: Image.asset(
                                                    "assets/PatientId.png",
                                                    width: 72,
                                                    height: 100,
                                                  ),
                                                ),
                                              
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Text(
                                                "Patient ID".tr,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  "XYZAB12-24",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                               
                               
                                // Expanded(
                                //   child: Card(
                                //       shape: RoundedRectangleBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(12)),
                                //       child: InkWell(
                                //         borderRadius: BorderRadius.circular(12),
                                //         splashColor: PrimaryColor,
                                //         onTap: () {
                                //           Get.to(
                                //               () => Checkup(),
                                //               transition:
                                //                   Transition.rightToLeft);
                                //         },
                                //         child: Padding(
                                //           padding: const EdgeInsets.all(20.0),
                                //           child: Container(
                                //               height: MediaQuery.of(context)
                                //                       .size
                                //                       .height /
                                //                   4,
                                //               width: 100,
                                //               child: Column(
                                //                 mainAxisAlignment:
                                //                     MainAxisAlignment
                                //                         .spaceEvenly,
                                //                 children: [
                                //                   Image.asset(
                                //                     "assets/PatientId.png",
                                //                     width: 72,
                                //                     height: 72,
                                //                   ),
                                //                   Text(
                                //                     "Mobile No:".tr,
                                //                     style:
                                //                         TextStyle(fontSize: 16),
                                //                   ),
                                //                   FittedBox(
                                //                     child: Text(
                                //                       "9876789067",
                                //                       style: TextStyle(
                                //                           fontSize: 18,
                                //                           fontWeight:
                                //                               FontWeight.w500),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     height: 14,
                                //                   ),
                                //                   Text(
                                //                     "Checkup Details".tr,
                                //                     style: TextStyle(
                                //                         fontSize: 18,
                                //                         fontWeight:
                                //                             FontWeight.w500),
                                //                     textAlign: TextAlign.center,
                                //                   )
                                //                 ],
                                //               )),
                                //         ),
                                //       )),
                                // )
                              
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            
        
                    Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                children: [
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12)),
                  //   margin: EdgeInsets.only(top: 8, bottom: 8),
                  //   child: InkWell(
                  //     borderRadius: BorderRadius.circular(12),
                  //     splashColor: PrimaryColor,
                  //     onTap: () {
                  //       Get.to(
                  //           // () => Appointment(
                  //           //       patientDetails: patientDetails,
                  //           //     ),
                  //           ()=>Appointment(),
                  //           transition: Transition.rightToLeft);
                  //     },
                  //     // Get.to(
                  //     // () => Appointment(patientDetails: patientDetails),
                  //     // transition: Transition.rightToLeft),
                  //     child: Padding(
                  //         padding: const EdgeInsets.all(20.0),
                  //         child: Row(
                  //           children: [
                  //             Image.asset(
                  //               "assets/appointments.png",
                  //               scale: 4,
                  //             ),
                  //             SizedBox(
                  //               width: 18,
                  //             ),
                  //             Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   "Appointment".tr,
                  //                   style: TextStyle(
                  //                       fontWeight: FontWeight.w500,
                  //                       fontSize: 22),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 4,
                  //                 ),
                  //                 Container(
                  //                   width:
                  //                       MediaQuery.of(context).size.width * .6,
                  //                   child: Text(
                  //                     "Book an Appointment".tr,
                  //                     style: TextStyle(fontSize: 18),
                  //                   ),
                  //                 )
                  //               ],
                  //             )
                  //           ],
                  //         )),
                  //   ),
                  // ),
                  
                                    Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: PrimaryColor,
                      onTap: () {
                        Get.to(
                            // () => Appointment(
                            //       patientDetails: patientDetails,
                            //     ),
                            ()=>LabReports(),
                            transition: Transition.rightToLeft);
                      },
                      // Get.to(
                      // () => Appointment(patientDetails: patientDetails),
                      // transition: Transition.rightToLeft),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/appointments.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lab Reports".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    child: Text(
                                      "View Lab Reports".tr,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: PrimaryColor,
                      onTap: () {
                        Get.to(
                            // () => MyAppointmentScreen(
                            //       patientDetails: patientDetails,
                            //     ),
                            ()=>MyAppointmentScreen(),
                            transition: Transition.rightToLeft);
                      },

                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/FeedBack.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    child: Text(
                                      "View Appointment".tr,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 22),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .6,
                                    child: Text(
                                      "Completed and Upcoming".tr,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: PrimaryColor,
                      onTap: () {
                        Get.to(
                            () => SelfScreening(),
                            transition: Transition.rightToLeft);
                
                        // Get.to(
                        //     () => SelfScreening(
                        //           from: "home",
                        //           patientId: patientDetails.id,
                        //         ),
                        //     transition: Transition.rightToLeft);
                      },
                      // onTap: () => consultationController
                      //             .filterConsultationList.length ==
                      //         0
                      //     ? showSnackBar("No Appointment Booked", "error")
                      //     : Get.to(
                      //         () => Consultation(
                      //             consultation: consultationController
                      //                 .filterConsultationList.last),
                      //         transition: Transition.rightToLeft),
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/examination.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Screening".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Go to Screening".tr,
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: PrimaryColor,
                      onTap: () {
                        // Get.to(() => Report(patientId: patientDetails.id),
                        //     transition: Transition.rightToLeft);
                        Get.to(()=>Report(),transition: Transition.leftToRight);
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/medical_report.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Reports".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Report Details".tr,
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(top: 8, bottom: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: PrimaryColor,
                      onTap: () {

                        Get.to(()=>Awareness());

                      },
                      // Get.to(
                      //     () => Awareness(
                      //           patientId: patientDetails.id,
                      //         ),
                      //     transition: Transition.rightToLeft),

                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/Education.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Education".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Knowledge Transfer".tr,
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            )
          
        
        ],) 
        ),

    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 30);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldRecipe
    throw UnimplementedError();
  }
}