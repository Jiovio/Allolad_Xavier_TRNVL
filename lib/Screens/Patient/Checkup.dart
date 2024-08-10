import 'package:allolab/Config/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkup extends StatelessWidget {
  const Checkup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: Text(
          "CheckUp".tr,
          style: TextStyle(color: Black),
        )),

        body: Column(
          children: [
                        Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                         "14-07-24",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.calendar_today_outlined,
                            ),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime.now(),
                              ).then((selectedDate) {
                                final localization =
                                    MaterialLocalizations.of(context);

                                if (localization
                                        .formatShortDate(selectedDate!) ==
                                    localization
                                        .formatShortDate(DateTime.now())) {
                                //   controller.HealthDate("Today".tr);
                                //   controller.getMyCheckUp(
                                //       DateFormat('yyyy-MM-dd')
                                //           .format(selectedDate),
                                //       patientDetails.id);
                                // } else {
                                //   controller.getMyCheckUp(
                                //       DateFormat('yyyy-MM-dd')
                                //           .format(selectedDate),
                                //       patientDetails.id);
                                //   controller.HealthDate(localization
                                //       .formatShortDate(selectedDate));
                                }
                              });
                            }),
                      ],
                    ),
            
            // controller.caseHistory.length == 0
            false
                  ? Expanded(child: Center(child: Text("No CheckUp found".tr)))
                  : Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) => Card(
                          elevation: 2,
                          shape: Border(
                              left: BorderSide(color: PrimaryColor, width: 4)),
                          child: InkWell(
                              highlightColor: accentColor.withOpacity(0.1),
                              splashColor: accentColor.withOpacity(0.8),
                              onTap: () {},
                              // controller.getCaseReport(
                              //     controller.caseHistory[index].date,
                              //     controller.caseHistory[index].time,
                              //     patientDetails.id),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, left: 10, right: 20, bottom: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Checkup Time".tr,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text("9 AM",
                                      // controller.caseHistory[index].time,
                                        style: TextStyle(
                                            color: Get.isDarkMode
                                                ? Colors.grey
                                                : PrimaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              )),
                        ),
                      ),
                    ),
            
          
        ],),

    );
  }
}