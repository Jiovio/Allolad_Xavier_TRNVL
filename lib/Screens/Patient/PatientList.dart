import 'package:allolab/Components/AppBar.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Patient/PatientDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class PatientlistScreen extends StatelessWidget {
  const PatientlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Patient List".tr,
          Context: context,
          Color: Black,
          elevation: 2.0),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: RefreshIndicator(
        onRefresh:() async {
          
        },
        child: Column(
          children: [
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    
                    enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Black, width: 1.0)),
                
                    prefixIcon: Icon(Icons.search_rounded),
                    labelText: 'Search Patient By Name'.tr,
                  ),
                  onChanged: (string) {
                    // peopleController.filteredPeopleList(string);
                  },
                ),
                SizedBox(height: 15,),
      
                          Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: SizedBox(
                                  height: 45,
                                  child: Image.network("https://cdn-icons-png.flaticon.com/512/1533/1533506.png",fit: BoxFit.contain,)),
                                title: Text(
                                  "Martin",
                                ),
                                subtitle: Row(
                                  children: [
                                    Text("Patient ID: ".tr),
                                    Text(
                                      style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.w600),
                                        "4531231"),
                                  ],
                                ),
                                trailing: Icon(
                                  Icons.arrow_right_outlined,
                                  color: PrimaryColor,
                                ),
                                onTap: () {
                                  print('dsaasdasd');
                                  Get.to(()=>PatientDetails(),
                                  transition: Transition.rightToLeft);
                                  // print(controller.filterPeopleList[index]);
                                  // Get.to(
                                  //         () => PeopleDetails(
                                  //             patientDetails: controller
                                  //                 .filterPeopleList[index]),
                                  //         transition: Transition.rightToLeft)!
                                  //     .then((value) => peopleController
                                  //         .filteredPeopleList(""));
                                },
                              );
                            },
                            separatorBuilder: (context, index) => Divider(thickness: 1,color: Colors.black54,height: 0,),
                            itemCount: 1,
                          ),
                        ),
                
          ],
          )
        ),
    ),
    );
  }
}