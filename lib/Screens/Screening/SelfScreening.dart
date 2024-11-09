import 'dart:convert';

import 'package:allolab/API/Requests/Userapi.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/GlobalPatientController.dart';
import 'package:allolab/Screens/Screening/SymptomsScreen.dart';
import 'package:allolab/Screens/Screening/Vitals/Vitals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelfScreening extends StatefulWidget {
  int id;
   SelfScreening({super.key , required this.id}){
    Get.lazyPut<ConsultationScreening>(() => ConsultationScreening());
   }

  @override
  State<SelfScreening> createState() => _SelfScreeningState();
}

class _SelfScreeningState extends State<SelfScreening> {
   
   
   
  PageController pageController = PageController();
  ConsultationScreening cont = Get.put(ConsultationScreening());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: Text("Self Screening".tr),
      ),
      body: PageView(
        physics:const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          cont.currPage = index;
          cont.update();
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


                GetBuilder<ConsultationScreening>(

                  builder: (controller) =>  Visibility(
                        visible:  controller.currPage!=0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding:const EdgeInsets.fromLTRB(24, 8, 24, 8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            textStyle:const TextStyle(color: White),
                          ),
                          onPressed: () {
                          pageController.previousPage(duration: Durations.long1, curve:Curves.linear);
                          },
                          child: Text("BACK".tr),
                        ),
                      ),
                ),



                ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                          // backgroundColor: PrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          textStyle: TextStyle(color: White),
                        ),
                        onPressed: () async {
                          await cont.addData(widget.id);
                          pageController.nextPage(duration: Durations.medium1, curve:Curves.bounceIn);
                        },
                        child: Text("SAVE".tr),
                      )


                    // GetBuilder<ConsultationScreening>(


                    //   builder: (controller) => 
                    //   controller.currPage
                    //   ? ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                    //       // backgroundColor: PrimaryColor,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20)),
                    //       textStyle: TextStyle(color: White),
                    //     ),
                    //     onPressed: () {
                    //       pageController.nextPage(duration: Durations.medium1, curve:Curves.bounceIn);
                    //     },
                    //     child: Text("SAVE".tr),
                    //   )
                    // : ElevatedButton(
                    //     style: ElevatedButton.styleFrom(
                    //       padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                    //       // backgroundColor: PrimaryColor,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(20)),
                    //       textStyle: TextStyle(color: White),
                    //     ),
                    //     onPressed: () {

                    //     },
                    //     child: Text("NEXT".tr),
                    //   ),

                    // )
                    
          ],
        ),
      ),
    );
  }
}


class ConsultationScreening extends GetxController {


    int currPage = 0;

    // @override
    // void onInit() {
    

    // super.onInit();
    // }


    
    Future<void> addData(int? id) async {
      if(currPage==0){
        await addSymptomID(id);
      }else{
        await addVitalsID(id);
      }
    }


    Future<void> addSymptomID(id) async {

      if(id!=null){
        final req = await Userapi.addCheckup(id,healthData,null);
      }else{
        final req = await Userapi.addCheckup(null,healthData,null);
      }
    }

    Future<void> addVitalsID(id) async {
    
    if(id!=null){
    final req = await Userapi.addCheckup(id,null,symptomsMap);
    }else{
    final req = await Userapi.addCheckup(null,null,symptomsMap);
    }
    }

    List symptomsSelected = [];
    List symptomsSelectedItems = [];
    
      Map<String,dynamic> symptomsMap = {
        'Normal' : false,
        'Body pain' : false,
        'Burning Stomach' : false,
        'Cold cough' : false,
        'Dizziness' : false,
        'Headache' : false,
        'Vomiting' : false,
        'Other' : false
      };

      TextEditingController symptomDesc = TextEditingController();

      void symptomSelect(String symptom) async {

      if(symptom =="Normal"){
      symptomsMap = {
        'Normal' : true,
        'Body pain' : false,
        'Burning Stomach' : false,
        'Cold cough' : false,
        'Dizziness' : false,
        'Headache' : false,
        'Vomiting' : false,
        'Other' : false
      };
      }else{
            if (symptomsMap.containsKey(symptom)) {
          symptomsMap[symptom] = !symptomsMap[symptom]!; 
          symptomsMap["Normal"] = false; 

          // symptomsMap[symptom] = true; 
          // createChatTable();
      }
      }

      update(); 


  }

  RxBool iBloodGlucoseValue = true.obs;

   Map<String, dynamic> healthData = {
    'bloodPressureH': 120,
    'bloodPressureL': 90,
    'bloodSaturationBW': 99.0,
    'bloodSaturationAW': 99.0,
    'temperature': 30.0,
    'heartRateBW': 72,
    'heartRateAW': 72,
    'bloodGlucoseBF': 150.0,
    'bloodGlucoseAF': 150.0,
    'bmiHeight': 150,
    'bmiWeight': 50.0,
    'respiratoryRate': 18,
    'hrv': 98,
    'hB': 10.0,
    'temperatureMetric':'C'
  }.obs;

  void updateVitals(String key, dynamic value){

    if(healthData.containsKey(key)){
      healthData[key] = value;
      update();
    }
  }


}