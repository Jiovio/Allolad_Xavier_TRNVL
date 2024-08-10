import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Screening/SelfScreening.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Consultation extends StatelessWidget {
  const Consultation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "View Appointment",
          style: TextStyle(color: Black),
        ),

        
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.only(bottom: 8),
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Andrew",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Text(
                        "Date : 28-04-2024",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Time : 9:00 AM",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Status : APPROVED",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Diagnosis Desc : STOMACH PAIN",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                    ],
                  )),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              margin: EdgeInsets.only(bottom: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                splashColor: PrimaryColor,
                onTap: () async {
                  Get.to(SelfScreening(),
                  transition: Transition.rightToLeft);
                },
                //   Get.to(
                //       () => SelfScreening(
                //             from: "appointment",
                //             appointmentId: appointment.appointmentId,
                //             patientId: appointment.patientId,
                //           ),
                //       transition: Transition.rightToLeft);
                // },

                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/symptoms.png",
                          scale: 4,
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Checkup".tr,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .6,
                              child: Text(
                                "Add Symptoms and Vitals".tr,
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            ),
            // appointment.appointmentStatus != "ACCEPTED"
            //     ? SizedBox()
            //     : 
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.only(bottom: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      splashColor: PrimaryColor,
                      onTap: () async {
                        // if (await Permissions
                        //     .cameraAndMicrophonePermissionsGranted()) {
                        //   DocumentSnapshot healthWorkerDocumentSnapshot =
                        //       await fireStore
                        //           .collection("agent")
                        //           .doc(hospitalDocument)
                        //           .collection("healthWorker")
                        //           .doc(data.read("token"))
                        //           .get();
                        //   DocumentSnapshot doctorDocumentSnapshot =
                        //       await fireStore
                        //           .collection("agent")
                        //           .doc(hospitalDocument)
                        //           .collection("doctor")
                        //           .doc(appointment.doctorId)
                        //           .get();
                        //   Users users = Users.fromMap(
                        //       healthWorkerDocumentSnapshot.data()
                        //           as Map<String, dynamic>);
                        //   Users searchedUser = Users.fromMap(
                        //       doctorDocumentSnapshot.data()
                        //           as Map<String, dynamic>);
                        //   CallUtils.dial(
                        //     patientId:appointment.patientId,
                        //     from: users,
                        //     to: searchedUser,
                        //     callType: "video",
                        //   );
                        // } else {}
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
                                "assets/doctor.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Connect with Doctor".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Video Consultation".tr,
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}