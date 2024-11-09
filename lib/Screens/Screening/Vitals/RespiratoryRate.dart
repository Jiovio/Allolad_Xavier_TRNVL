import 'package:allolab/Screens/Screening/SelfScreening.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

Widget RespiratoryRate() {
  return 
  GetBuilder<ConsultationScreening>(
      builder: (c) => 
      NumberPicker(
            // value: 30,
            value: c.healthData["respiratoryRate"],

            minValue: 5,
            maxValue: 40,
            onChanged: (value) {
              // c.respiratoryRateChange(value);
              c.updateVitals("respiratoryRate", value);
            },
          ));
       
}
