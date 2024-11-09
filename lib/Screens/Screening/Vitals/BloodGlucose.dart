

import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Screening/SelfScreening.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

Wrap BloodGlucose() {
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.start,
    children: [
      Column(
        children: [
          GetBuilder<ConsultationScreening>(
            builder:(c) => 
             Column(
              children: [
                Row(
                  children: [
                    Text("mg/dL"),
                    ValueBuilder<bool?>(
                      initialValue: c.iBloodGlucoseValue.value ? true : false,

                      builder: (isChecked, updateFn) => Switch(
                        activeColor: PrimaryColor,
                        value: isChecked!,
                        onChanged: (newValue) {
                          c.iBloodGlucoseValue = newValue.obs;
                          c.update();
                          updateFn(newValue);
                        },
                      ),
                    ),
                    Text("mmol/L"),
                  ],
                ),
                Text("Fasting"),
                Row(
                  children: [
                    DecimalNumberPicker(
                      // value: 50,
                      value: c.healthData["bloodGlucoseBF"],

                      minValue: 20,
                      maxValue: 700,
                      decimalPlaces: 1,
                      onChanged: (value) {
                        c.updateVitals("bloodGlucoseBF", value);
                      },
                    ),
                    Flexible(
                        // child: Text(c.iBloodGlucoseValue.value ? "mg/dl" : ""))
                        child: Text("mg/dl"))

                  ],
                ),
                Text("pp"),
                Row(
                  children: [
                    DecimalNumberPicker(
                      value: c.healthData["bloodGlucoseAF"],
                      // value: 30,

                      minValue: 20,
                      maxValue: 700,
                      decimalPlaces: 1,
                      onChanged: (value) {
                        c.updateVitals("bloodGlucoseAF", value);

                      },
                    ),
                    Flexible(
                        child: Text("mg/dl"))
                        // child: Text(c.iBloodGlucoseValue.value ? "mg/dl" : ""))

                  ],
                )
              ],
             ))
          ,
        ],
      ),
    ],
  );
}
