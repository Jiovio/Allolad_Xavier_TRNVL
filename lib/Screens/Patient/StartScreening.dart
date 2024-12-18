import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/PatientsController.dart';
import 'package:allolab/Screens/Patient/AddPatient.dart';
import 'package:allolab/Screens/Patient/PatientDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartScreening extends StatelessWidget {
  StartScreening({super.key});


  Patientscontroller controller = Get.put(Patientscontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
         child: Column(
          children: [
       Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  splashColor: PrimaryColor,
                  onTap: 
                  
                  
                  () => {},
                  // Get.to(
                  //     () => SignIn(
                  //           cameraDescription:
                  //               peopleController.cameraDescription,
                  //         ),
                  //     transition: Transition.rightToLeft),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/face-recognition.png",
                            scale: 4,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Face Recognition",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "Start Screening with Face Recognition",
                                    style: TextStyle(fontSize: 18),
                                    softWrap: true,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
                          SizedBox(
                height: 20,
              ),
               Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  splashColor: PrimaryColor,
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/book.png",
                                scale: 4,
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      child: Text(
                                        "Search with Phone Number",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 22),
                                        softWrap: true,
                                      )),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: TextFormField(
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                          labelText: "Enter Phone Number",
                                          border: UnderlineInputBorder()),
                                      keyboardType: TextInputType.number,
                                      controller: controller.phone,
                                      onChanged: controller.findPatient,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter Phone Number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                ],
                              ),
                            ],
                          ),


                          GetBuilder<Patientscontroller>(
                            
                            builder: (controller) {
                              return controller.patientFound?
                              Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics:
                                            AlwaysScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text( controller.patient["name"]
                                            ),
                                            subtitle: Row(
                                              children: [
                                                Text("Mobile No:"),
                                                Text(

                                                  controller.patient["phone_number"],
                                                  // "${controller.filterPeopleListWithPhoneNumber[index].phone}",
                                                  softWrap: true,
                                                ),
                                              ],
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_right_outlined,
                                              color: PrimaryColor,
                                            ),
                                            onTap: (){
                                              controller.navigateToPatient(controller.patient);
                                            },
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            Divider(),
                                        itemCount: 1,
                                        
                                        // controller
                                        //     .filterPeopleListWithPhoneNumber
                                        //     .length,
                                      ),
                                    ):Container();
                                  
                            }, ),
                         
                        ],
                      )),
                ),
              ),
         SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  splashColor: PrimaryColor,
                  onTap: () =>
                  
                  
                  Get.to(() => AddPatient(),
                      transition: Transition.rightToLeft),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/examination.png",
                            scale: 4,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add New Patient",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 22),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Add Patient to Start Screening",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ),
            

          ],
         ),
         
         
         
         
         
         
         
         
         
         ),




      ),
    );
  }
}