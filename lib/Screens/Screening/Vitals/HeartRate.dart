import 'package:allolab/Screens/Screening/SelfScreening.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

Wrap HeartRate() {
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.start,
    children: [
      Text("At rest"),
      Row(
        children: [
          GetBuilder<ConsultationScreening>(builder:(c) => 
                  NumberPicker(
                    value: c.healthData["heartRateBW"],
                                        // value: 40,
                    minValue: 30,
                    itemHeight: 32,
                    maxValue: 150,
                    onChanged: (value) {
                      // c.heartRateBWChange(value);
                      c.updateVitals("heartRateBW", value);
                    },
                  )),
          Flexible(child: Text("BPM"))
        ],
      ),
      Text("After walk"),
      Row(
        children: [
          GetBuilder<ConsultationScreening>(builder:(c) => 
                  NumberPicker(
                    value: c.healthData["heartRateAW"],
                                        // value: 50,
                    minValue: 30,
                    maxValue: 150,
                    itemHeight: 32,
                    onChanged: (value) {
                      // c.heartRateAWChange(value);
                      c.updateVitals("heartRateAW", value);
                    },
                  )),
          Flexible(child: Text("BPM"))
        ],
      ),
    ],
  );
}
