import 'dart:io';

import 'package:allolab/Components/dropdown.dart';
import 'package:allolab/Components/textfield.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class AddPatient extends StatefulWidget {
   AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  bool loading = false;

  int patientController = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add People".tr),
      ),

      body: Container(
        child: loading?Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                  ),
                ):Stepper(
                  
                  currentStep: patientController,
                  type: StepperType.horizontal,
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controlsDetails) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // patientController.index.value == 1
                          true
                              ? OutlinedButton(
                                  onPressed: controlsDetails.onStepCancel,
                                  child: Text('CANCEL'.tr),
                                )
                              : SizedBox(),
                          ElevatedButton(
                            onPressed: controlsDetails.onStepContinue,
                            child: Text(
                              1==1
                              // patientController.index.value == 1
                                ? 'SAVE'.tr
                                : 'CONTINUE'.tr),
                          ),
                        ],
                      ),
                    );
                  },
                  onStepCancel: () {
                    // if (patientController.index.value > 0) {
                    //   patientController.index.value -= 1;
                    // }
                  },
                  onStepContinue: () {

                    setState((){
                      patientController++;
                    });
                    // if (patientController.index.value <= 0) {
                    //   if (_formKey.currentState!.validate()) {
                    //     patientController.index.value += 1;
                    //   }
                    // } else {
                    //   if (_formKey1.currentState!.validate()) {
                    //     patientController.addPeopleDetails();
                    //   }
                    // }
                  },
                  onStepTapped: (int index) {
                    // if (_formKey.currentState!.validate()) {
                    //   patientController.index.value = index;
                    // }
                  },
                  steps: [
                    Step(
                        title: Container(child: Text("Personal Details".tr)),
                        content: Form(
                          // key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                  // controller
                                  //             .captureImage ==
                                  //         ""
                                  //     ? Container()
                                  //     : 
                                      Transform(
                                          alignment: Alignment.center,
                                          transform: Matrix4.rotationY(pi),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: NetworkImage("https://static-00.iconduck.com/assets.00/user-icon-1024x1024-dtzturco.png"),
                                            // FileImage(
                                            //     File(controller.captureImage)),
                                            radius: 58,
                                          ),
                                        ),
                              ElevatedButton(
                                  onPressed: () => {},
                                  // Get.to(
                                  //     () => CaptureImage(
                                  //         cameraDescription: peopleController
                                  //             .cameraDescription),
                                  //     transition: Transition.rightToLeft),
                                  child: Text("Capture Image".tr)),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // controller: patientController.name,
                                decoration: InputDecoration(
                                    labelText: "Name".tr,
                                    border: UnderlineInputBorder()),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name'.tr;
                                  }
                                  return null;
                                },
                              ),
                              // TextFormField(
                              //   controller: patientController.emailID,
                              //   decoration: InputDecoration(
                              //       labelText: "EmailID".tr,
                              //       border: UnderlineInputBorder()),
                              //   validator: (value) {
                              //     if (value!.isNotEmpty && value.isEmail) {
                              //       return null;
                              //     }
                              //     return "Enter a valid email id!";
                              //   },
                              //   keyboardType: TextInputType.emailAddress,
                              // ),
                              TextFormField(
                                // controller: patientController.phoneNumber,
                                maxLength: 10,
                                decoration: InputDecoration(
                                    labelText: "Phone Number".tr,
                                    border: UnderlineInputBorder()),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter phone number'.tr;
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      readOnly: true,
                                      // controller: patientController.dateOfBirth,
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1948),
                                          lastDate: DateTime.now(),
                                        ).then((selectedDate) {
                                          // patientController.age.text =
                                          //     calculateAge(selectedDate!)
                                          //         .toString();
                                          // final localization =
                                          //     MaterialLocalizations.of(context);
                                          // patientController.dateOfBirth.text =
                                          //     localization.formatShortDate(
                                          //         selectedDate);
                                          // patientController.dateOfBirthValue =
                                          //     DateFormat("yyyy-MM-dd")
                                          //         .format(selectedDate)
                                          //         .toString();
                                        });
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Date of Birth".tr,
                                          border: OutlineInputBorder()),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      onTap: () {},
                                      readOnly: true,
                                      // controller: patientController.age,
                                      decoration: InputDecoration(
                                          labelText: "Age".tr,
                                          border: OutlineInputBorder()),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      height: 60.0,
                                      child: DropdownSearch<String>(
                                        // mode: Mode.MENU,
                                        popupProps: PopupProps.menu(
                                        showSelectedItems: true,

                                        ),
                                        items: BG,
                                        dropdownDecoratorProps: DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                            hintText: "Blood Group".tr,
                                            border: OutlineInputBorder()
                                          )
                                        ),

                                        // label: "Blood Group".tr,
                                        // onChanged: (value) => patientController
                                        //     .bloodGroup = value!,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                    child: DropdownSearch<String>(
                       
                                      popupProps: PopupProps.menu(
                                        showSelectedItems: true
                                      ),
                                      // showSelectedItem: true,
                                      items: ["Male".tr, "Female".tr],
                                       dropdownDecoratorProps: DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                            hintText: "Gender".tr,
                                            border: OutlineInputBorder()
                                          )
                                        ),
                                      // label: "Gender".tr,
                                      // selectedItem: patientController.gender,
                                      // maxHeight: 120,
                                      onChanged: (value) {
                                     
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              true
                              // patientController.showFemaleField.value == true

                                  ? Text(
                                      "Pregnant Status".tr,
                                      style: TextStyle(fontSize: 13),
                                    )
                                  : SizedBox(),
                              true
                              // patientController.showFemaleField.value == true

                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : SizedBox(),
                             true
                              // patientController.showFemaleField.value == true

                                  ? SizedBox(
                                      height: 60,
                                      child: Ddown(
                                        ssItem: true,
                                        validator: (value) {
                                          return 'Select Pregnant Status';
                                          // if (patientController
                                          //     .pregnantStatus.isEmpty) {
                                          //   return 'Select Pregnant Status';
                                          // }
                                          // return null;
                                        },
                                        itemz: [
                                          "YES",
                                          "NO",
                                        ],
                                        label: " Pregnancy Status",
                                        sItem: "",
                                        // patientController
                                        //         .pregnantStatus.isEmpty
                                        //     ? ""
                                        //     : patientController.pregnantStatus,
                                        mHeight: 120,
                                        oChanged: (value) {
                                          // patientController.pregnantStatus =
                                          //     value!.toString();

                                          // patientController.showPreganentFields(
                                          //     value.toString());
                                        },
                                      ),
                                    )
                                  : SizedBox(),
                              // patientController.showFemaleField.value == true
                              true

                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : SizedBox(),
                              true
                              // patientController.showPregnantField.value == true

                                  ? TFField(
                                      // txtController: patientController.pickme,
                                      function: () {},
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter Pick Me'.tr;
                                      //   }
                                      //   return null;
                                      // },
                                      mLength: 12,
                                      kType: TextInputType.number,
                                      label: "PICME / RCH ID".tr,
                                     
                                      )
                                  : SizedBox(),

                              true
                              // patientController.showPregnantField.value == true

                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : SizedBox(),
                              // patientController.showPregnantField.value == true
                              true

                                  ? TFField(
                                      // txtController: patientController.lmpDate,
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter LMP Date'.tr;
                                      //   }
                                      //   return null;
                                      // },
                                      function: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1948),
                                          lastDate: DateTime.now(),
                                        ).then((selectedDate) {
                                          // patientController.lmpDate.text =
                                          //     DateFormat("dd-MM-yyyy")
                                          //         .format(selectedDate!)
                                          //         .toString();
                                          // patientController.nextVisitDate.text =
                                          //     selectedDate
                                          //         .add(Duration(days: 30))
                                          //         .toString();
                                          // patientController.update();
                                        });
                                      },
                                      label: "LMP Date".tr,
                                      )
                                  : SizedBox(),

                              true
                              // patientController.showPregnantField.value == true

                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : SizedBox(),
                             true
                              // patientController.showPregnantField.value == true

                                  ? TFField(
                                      // txtController: patientController.eddDate,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter EDD Date'.tr;
                                        }
                                        return null;
                                      },
                                      function: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2100),
                                        ).then((selectedDate) {
                                          // patientController.eddDate.text =
                                          //     DateFormat("dd-MM-yyyy")
                                          //         .format(selectedDate!)
                                          //         .toString();
                                          // patientController.update();
                                        });
                                      },
                                      label: "EDD Date".tr,
                                      )
                                  : SizedBox(),
                               true
                                                            // patientController.showPregnantField.value == true
                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : SizedBox(),
                              true
                                                            // patientController.showPregnantField.value == true
                                  ? Container(
                                      height: 60.0,
                                      child: DropdownSearch<String>(
                                        // mode: Mode.MENU,
                                        // showSelectedItem: true,
                                        items: babies,
                                        dropdownDecoratorProps: DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                            hintText: "Number Of Children".tr,
                                            border: OutlineInputBorder()
                                          )
                                        ),
                                        // label: "Number Of Children".tr,
                                        // onChanged: (value) => patientController
                                        //     .noOfBabies = value!,
                                      ),
                                    )
                                  : SizedBox(),
                              true
                                                            // patientController.showPregnantField.value == true
                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : SizedBox(),
                              true
                                                            // patientController.showPregnantField.value == true
                                  ? TextFormField(
                                      // controller: patientController.otherInfo,
                                      decoration: InputDecoration(
                                          labelText: "Other Informations".tr,
                                          border: UnderlineInputBorder()),
                                      keyboardType: TextInputType.text,
                                      maxLines: 5,
                                      maxLength: 50,
                                    )
                                  : SizedBox(),
                              true
                              // patientController.showPregnantField.value == true

                                  ? SizedBox(
                                      height: 10,
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        isActive: true
                            // patientController.index.value >= 0 ? true : false
                            ),
                    Step(
                        title: Container(
                            width: MediaQuery.of(context).size.width * .2,
                            child: Text('Address Details'.tr)),
                        isActive: true,
                            // patientController.index.value > 0 ? true : false,
                        content: Form(
                          // key: _formKey1,
                          child: Column(
                            children: [
                              TextFormField(
                                // controller: patientController.addressLine,
                                decoration: InputDecoration(
                                    labelText: "Address Line".tr,
                                    border: UnderlineInputBorder()),
                                keyboardType: TextInputType.text,
                                maxLines: 5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                // controller: patientController.pinCode,
                                maxLength: 6,
                                decoration: InputDecoration(
                                    labelText: "Pincode".tr,
                                    border: UnderlineInputBorder()),
                                keyboardType: TextInputType.number,
                                onChanged: (value) async {
                                  // if (patientController.pinCode.text.length >
                                  //     5) {
                                  //   patientController.isLoadingArea.value =
                                  //       true;
                                  //   patientController.areaList.clear();
                                  //   final response = await http.get(Uri.parse(
                                  //       "$pinCodeAPI${patientController.pinCode.text}"));
                                  //   print("$pinCodeAPI$value");
                                  //   print(response);
                                  //   if (jsonDecode(response.body)[0]
                                  //               ["Status"] ==
                                  //           "Error" &&
                                  //       value.length == 6) {
                                  //     showSnackBar(
                                  //         "Enter Correct Pincode", "error");
                                  //   } else {
                                  //     var f = jsonDecode(response.body);
                                  //     patientController.stateList.clear();
                                  //     patientController.districtList.clear();
                                  //     print(f);
                                  //     patientController.areaList.clear();
                                  //     f[0]['PostOffice'].forEach((e) {
                                  //       print(e['Name']);
                                  //       patientController.areaList
                                  //           .add(e['Name']);
                                  //       patientController.stateList
                                  //           .add(e['State']);
                                  //       patientController.districtList
                                  //           .add(e['District']);
                                  //     });
                                  //     patientController.update();
                                  //     print('asdasd');
                                  //   }
                                  //   patientController.isLoadingArea.value =
                                  //       false;
                                  // }
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              // patientController.isLoadingArea.value

                              false
                                  ? CircularProgressIndicator()
                                  : DropdownSearch<String>(
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                        dropdownSearchDecoration: InputDecoration(
                                          hintText: "Select Area".tr
                                        )
                                    ),
                                      // mode: Mode.MENU,
                                      // showSelectedItem: true,
                                      // items: patientController.areaList,
                                      // label: "Select Area".tr,
                                      // selectedItem: patientController.areaData,
                                      // maxHeight: 220,
                                      onChanged: (value) {
                                        // int index = patientController.areaList
                                        //     .indexOf(value!);
                                        // patientController.state.text =
                                        //     patientController.stateList[index];
                                        // patientController.city.text =
                                        //     patientController
                                        //         .districtList[index];
                                        // patientController.update();
                                   
                                      },
                                    ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                      child: TextFormField(
                                      // controller: c.city,
                                      onTap: () {},
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          labelText: "City".tr,
                                          border: OutlineInputBorder()),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(
                                      child: TextFormField(
                                      // controller: c.state,
                                      onTap: () {},
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          labelText: "State".tr,
                                          border: OutlineInputBorder()),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
        
      )


      
      



    );
  }
}

calculateAge(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - birthDate.year;
  int month1 = currentDate.month;
  int month2 = birthDate.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = birthDate.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}

List<String> BG = [
  "A+",
  "B+",
  "A-",
  "B-",
  "AB+",
  "AB-",
  "O+",
  "O-",
  "A1B-",
  "A1B+"
];

List<String> babies = ["0", "1", "2", "3", "4", "5", "6", "7"];