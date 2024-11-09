import 'package:allolab/Screens/Screening/SelfScreening.dart';
import 'package:flutter/cupertino.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:get/get.dart';

Wrap BloodSaturation() {
  return Wrap(
    crossAxisAlignment: WrapCrossAlignment.start,
    children: [
      Text("At rest"),
      Row(
        children: [
          GetBuilder<ConsultationScreening>(
            builder:(c) => 
              DecimalNumberPicker(
                    value: c.healthData["bloodSaturationBW"],
                                        // value: 50,
                    minValue: 40,
                    itemHeight: 32,
                    maxValue: 100,
                    decimalPlaces: 1,
                    onChanged: (value) {
                      // c.bloodSaturationBWChange(value);
                      c.updateVitals("bloodSaturationBW", value);
                    },
          )),
          Flexible(child: Text("%"))
        ],
      ),
      Text("After Walk"),
      Row(
        children: [
                    GetBuilder<ConsultationScreening>(
            builder:(c) => 
          DecimalNumberPicker(
                    value: c.healthData["bloodSaturationAW"],
                                        // value: 55,
                    minValue: 40,
                    maxValue: 100,
                    itemHeight: 32,
                    decimalPlaces: 1,
                    onChanged: (value) {
                      // c.bloodSaturationAWChange(value);
                      c.updateVitals("bloodSaturationAW", value);
                    },
                  )),
          Flexible(child: Text("%"))
        ],
      ),
    ],
  );
}
