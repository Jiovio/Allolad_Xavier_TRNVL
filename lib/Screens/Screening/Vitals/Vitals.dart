
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Screening/Vitals/BMI.dart';
import 'package:allolab/Screens/Screening/Vitals/BloodGlucose.dart';
import 'package:allolab/Screens/Screening/Vitals/BloodPressure.dart';
import 'package:allolab/Screens/Screening/Vitals/BloodSaturation.dart';
import 'package:allolab/Screens/Screening/Vitals/HeartRate.dart';
import 'package:allolab/Screens/Screening/Vitals/HeartRateVariability.dart';
import 'package:allolab/Screens/Screening/Vitals/RespiratoryRate.dart';
import 'package:allolab/Screens/Screening/Vitals/Temperature.dart';
import 'package:flutter/material.dart';

class VitalsScreen extends StatelessWidget {
  const VitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {

        List<vitals> vitalsList = [
      vitals(
          title: 'Blood Pressure',
          image: 'assets/Vitals/blood-pressure-gauge.png',
          // value: GetBuilder<ServiceController>(
          //     builder: (controller) => Text(
          //         controller.bloodPressureH.toString() +
          //             "/" +
          //             controller.bloodPressureL.toString() +
          //             "mmHg")),
          vitalsWidget: BloodPressure()),
      vitals(
          title: 'Temperature',
          image: 'assets/Vitals/thermometer.png',
          // value: GetBuilder<ServiceController>(
          //     builder: (controller) => Text(
          //         "${controller.celsius.toString()} °C - ${controller.temperature.toString()} °F")),
          vitalsWidget: Temperature()),
      vitals(
          title: 'Blood Saturation',
          image: 'assets/Vitals/blood.png',
          // value: GetBuilder<ServiceController>(
          //     builder: (controller) => Text(
          //         "${controller.bloodSaturationBW.toString()}" +
          //             " / " +
          //             "${controller.bloodSaturationAW.toString()} %")),
          vitalsWidget: BloodSaturation()),
      vitals(
          title: 'Heart Rate',
          image: 'assets/Vitals/cardiogram.png',
          // value: GetBuilder<ServiceController>(
          //     builder: (controller) => Text(
          //         "${controller.heartRateBW.toString()} bpm" +
          //             " / " +
          //             "${controller.heartRateAW.toString()} bpm")),
          vitalsWidget: HeartRate()),
      vitals(
          title: 'Blood Glucose',
          image: 'assets/Vitals/glucose-meter.png',
          // value: GetBuilder<ServiceController>(
          //     builder: (controller) => Text(
          //         "${controller.bloodGlucoseBF.toString()} f " +
          //             " / " +
          //             "${controller.bloodGlucoseAF.toString()} pp")),
          vitalsWidget: BloodGlucose()),
      vitals(
          title: 'BMI',
          image: 'assets/Vitals/bmi.png',
          // value: GetBuilder<ServiceController>(
          //     builder: (controller) => Text(
          //         "${controller.bmiValue} (${controller.bmiHeight.toString()} H" +
          //             " - " +
          //             "${controller.bmiWeight.toString()} W)")),
          vitalsWidget: BMI()),
      vitals(
          title: 'Respiratory Rate',
          image: 'assets/Vitals/peak-flow-meter.png',
          // value: GetBuilder<ServiceController>(
          //     builder: (controller) =>
          //         Text(controller.respiratoryRate.toString())),
          vitalsWidget: RespiratoryRate()),
      vitals(
          title: 'HRV',
          image: 'assets/Vitals/computer.png',
          // value: GetBuilder<ServiceController>(
          //     builder: (controller) => Text("${controller.hrv.toString()} ms")),
          vitalsWidget: HeartRateVariability())
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vitals",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10.0,
              children: List.generate(
                  vitalsList.length,
                  (index) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(8.0),
                          highlightColor: accentColor.withOpacity(0.1),
                          splashColor: accentColor.withOpacity(0.8),
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(vitalsList[index].title),
                                    content: vitalsList[index].vitalsWidget,
                                  )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                vitalsList[index].image,
                                scale: 6,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                vitalsList[index].title,
                                style: TextStyle(
                                    color: PrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              // vitalsList[index].value,
                            ],
                          )))),
            ),
          ],
        ),
      ),
    );
}
}

class vitals {
  String title;
  String image;
  // Widget value;
  Widget vitalsWidget;
  vitals(
      {required this.title,
      required this.image,
      required this.vitalsWidget,
      // required this.value
      });
}