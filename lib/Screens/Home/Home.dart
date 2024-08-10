import 'package:allolab/Components/AppBar.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Patient/PatientDetails.dart';
import 'package:allolab/Screens/Patient/StartScreening.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool emptyUser = false;

    return Scaffold(

      appBar: customAppBar(
          title: "AlloLab".tr,
          Context: context,
          Color: PrimaryColor,
          elevation: 0),

      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          false
                              ? Text(
                                  "Welcome".tr,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )
                              : Row(
                                  children: [
                                    Text(
                                      "Welcome".tr,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " Lala Patil",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              false
                                  ? CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 64,
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: NetworkImage("https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjg2OC1zYXNpLTA2LmpwZw.jpg"),
                                      radius: 64,
                                    ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: PrimaryColor),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 14,
                                            color: White,
                                          )),

                                          SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Worker ID".tr,
                                              style: TextStyle(
                                                  color: Black.withOpacity(0.6),
                                                  fontSize: 14)),

                        
                                                  
                              
                                          Text(
                                              false
                                                  ? ""
                                                  : "R3nD)m",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                              color: PrimaryColor),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 14,
                                            color: White,
                                          )),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Last Synced",
                                              style: TextStyle(
                                                  color: Black.withOpacity(0.6),
                                                  fontSize: 14)),
                                          Text("20-05-2021",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 20.0, bottom: 4),
                          child: Text(
                            true
                                ? "Re-visit Patient".tr
                                : "Recently Added Patient".tr,
                            style: TextStyle(
                              color: PrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (true) {
                              return ListTile(
                                title: Text(
                                  "Sopna",
                                ),
                                subtitle: Row(
                                  children: [
                                    Text("Mobile No:".tr),
                                    Text(
                                        "1234567890"),
                                  ],
                                ),



                                trailing: SizedBox(
                                  width: 70,
                                  child: Row(
                                    children: [
                                      Text(
                                        "2 Days",
                                          // "in ${DateTime.parse("20-07-2024").difference(DateTime.now()).inDays} days"
                                      ),
                                      Icon(
                                        Icons.arrow_right_outlined,
                                        color: PrimaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {

                                  
                                  Get.to(
                                      () => PatientDetails(),
                                      transition: Transition.rightToLeft);

                                  // Get.to(
                                  //     () => PeopleDetails(
                                  //         patientDetails: controller
                                  //             .reVisitPeopleList[index]),
                                  //     transition: Transition.rightToLeft);
                                },
                              );
                            
                            } else {
                              return ListTile(
                                title: Text(
                                  "Madhavan",
                                ),
                                subtitle: Row(
                                  children: [
                                    Text("Mobile No:".tr),
                                    Text(
                                        " 8754389567"),
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.arrow_right_outlined,
                                  color: PrimaryColor,
                                ),
                                onTap: () {
                                  // Get.to(
                                  //     () => PeopleDetails(
                                  //         patientDetails:
                                  //             controller.peopleList[index]),
                                  //     transition: Transition.rightToLeft);
                                },
                              );
                            }
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: 1,
                          // true
                          //     ? 1
                          //     : controller.peopleList.length >= 5
                          //         ? 5
                          //         : controller.peopleList.length,
                        ),
                      



                      ],
                    ),
          ],
        ),
      ),
      
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width, 92),

            backgroundColor: Black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)))),
        onPressed: () {
          Get.to(() => StartScreening(), transition: Transition.rightToLeft);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Start Screening".tr,
              style: TextStyle(fontSize: 20,color: White),
            ),
            Icon(
              Icons.add_circle_outline,
              size: 30,
              color: White,
            )
          ],
        ),
      ),
      
    );
  }
}