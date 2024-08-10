import 'package:allolab/Config/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
          title: Text(
        "Report".tr,
        style: TextStyle(color: Black),
      )),

      body: Column(
        children: [
                    Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 20),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: 20, right: 40, top: 14, bottom: 14)),
                  onPressed: () {},
                  // Get.to(() => AddReport(),
                      // transition: Transition.rightToLeft),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.camera),
                      Container(
                          width: MediaQuery.of(context).size.width * .6,
                          child:
                              Text("Scan and Add new Report".toUpperCase().tr))
                    ],
                  ))),

                // controller.reportType.length == 0
                false
                ? Expanded(child: Center(child: Text("No Report Added".tr)))
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
                            onTap: () {
                              // Get.to(
                              //     () => ReportList(
                              //         reportType: controller.reportType[index]),
                              //     transition: Transition.rightToLeft);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 20, bottom: 20),
                              child: Text("Report 1",
                              // ontroller.reportType[index],
                                  style: TextStyle(
                                      color: Get.isDarkMode
                                          ? Colors.grey
                                          : PrimaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            )),
                      ),
                    ),
                  ),
          
          
        ],
      ),



    );
  }
}