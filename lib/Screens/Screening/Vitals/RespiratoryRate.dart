// import 'package:Allobaby/Screens/Service/Controller/ServiceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

Widget RespiratoryRate() {
  return 
  // GetBuilder<ServiceController>(
  //     builder: (c) => 
      NumberPicker(
            value: 30,
            // value: c.respiratoryRate,

            minValue: 5,
            maxValue: 40,
            onChanged: (value) {
              // c.respiratoryRateChange(value);
            },
          );
          // );
}
