import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Screening/SelfScreening.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

Wrap Temperature() {
  return Wrap(
    children: [
      GetBuilder<ConsultationScreening>(builder:(c) => 
         Wrap(children: [
          Row(
            children: [
              Text("°C"),
              ValueBuilder<bool?>(
                initialValue:c.healthData["temperatureMetric"]=='C' ? false : true,
                // initialValue: false,

                builder: (isChecked, updateFn) => Switch(
                  activeColor: PrimaryColor,
                  value: isChecked!,
                  onChanged: (newValue) {
                    // c.iValue.value = !c.iValue.value.obs();
                    if(newValue){
                      c.updateVitals("temperatureMetric", 'F');
                      c.updateVitals("temperature", 96.0);

              
                    }else {
                      c.updateVitals("temperatureMetric", 'C');
                      c.updateVitals("temperature", 30.0);

}
                    // c.update();
                    print(newValue);
                    updateFn(newValue);
                  },
                ),
              ),
              Text("F"),
            ],
          ),
          DecimalNumberPicker(
            value: c.healthData["temperature"] ,
            // value: 30,

            minValue: c.healthData["temperatureMetric"]=='C' ? 20 : 68,
            maxValue: c.healthData["temperatureMetric"]=='C' ? 44 : 110,
            decimalPlaces: 1,
            onChanged: (value) {
              c.updateVitals("temperature", value);
              // c.iValue.value
              //     ? c.celsiusChange(value)
              //     : c.temperatureChange(value);
            },
          ),
        ]
      )),
    ],
  );
}
