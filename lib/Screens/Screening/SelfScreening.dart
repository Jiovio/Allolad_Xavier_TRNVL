import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Screening/SymptomsScreen.dart';
import 'package:allolab/Screens/Screening/Vitals/Vitals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelfScreening extends StatelessWidget {
  const SelfScreening({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text("Self Screening".tr),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        // controller: serviceController.pageController,
        onPageChanged: (index) {
          // serviceController.pagechanged(index);
        },
        children: [
          SymptomsScreen(),
          VitalsScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 6.0, left: 20, right: 20, bottom: 10),
        color: Get.isDarkMode ? darkGrey2 : White,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Visibility(
                      // visible: pageController.pageChanged == 0 ? false : true,
                      visible:  true,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                          // backgroundColor: PrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: TextStyle(color: White),
                        ),
                        onPressed: () {
                          // pageController.pageController.animateToPage(
                          //     pageController.pageChanged - 1,
                          //     duration: Duration(milliseconds: 300),
                          //     curve: Curves.easeInOut);
                        },
                        child: Text("BACK".tr),
                      ),
                    ),
                    1 == 1
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                          // backgroundColor: PrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: TextStyle(color: White),
                        ),
                        onPressed: () {
                          // if (from == "appointment") {
                          //   serviceController.addCheckupDetailsToAppointment(
                          //       appointmentId, patientId);
                          //   serviceController.addCheckupDetails(patientId);
                          // } else {
                          //   serviceController.addCheckupDetails(patientId);
                          // }
                        },
                        child: Text("SAVE".tr),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                          // backgroundColor: PrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: TextStyle(color: White),
                        ),
                        onPressed: () {
                          // pageController.pageController.animateToPage(
                          //     pageController.pageChanged + 1,
                          //     duration: Duration(milliseconds: 300),
                          //     curve: Curves.easeInOut);
                        },
                        child: Text("NEXT".tr),
                      ),
          ],
        ),
      ),
    );
  }
}