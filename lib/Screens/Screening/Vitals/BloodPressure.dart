
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

Row BloodPressure() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      NumberPicker(
                // value: c.bloodPressureH,
                                value: 95,
                minValue: 40,
                maxValue: 140,
                onChanged: (value) {
                  // c.bloodPressureHChange(value);
                },
              ),
      Text("/"),
      NumberPicker(
                // value: c.bloodPressureL,
                                value: 96,
                minValue: 70,
                maxValue: 220,
                onChanged: (value) {
                  // c.bloodPressureLChange(value);
                },
              ),
    ],
  );
}
