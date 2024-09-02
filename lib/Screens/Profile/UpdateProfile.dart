import 'package:allolab/Components/dropdown.dart';
import 'package:allolab/Components/form.dart';
import 'package:allolab/Components/textfield.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/User/UserController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';
class UpdateProfile extends StatelessWidget {
  
   UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
                appBar: AppBar(
            title: Text("Edit Profile".tr),
            actions: [
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () async {
                    // patientDetailsController.updateProfile(patientDetails);
                  })
            ],
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [ GestureDetector(
                                      onTap: () => showDialog(
                                            builder: (BuildContext context) =>
                                                Container(
                                                    height: Get.height / 2,
                                                    width: Get.width / 2,
                                                    child: 
                                                    CachedNetworkImage(
                                                            imageUrl:"https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                                                    ),
                                                    // controller
                                                    //             .fileImage64 !=
                                                    //         null
                                                    //     ? Image.memory(
                                                    //         base64Decode(
                                                    //             controller
                                                    //                 .fileImage64))
                                                    //     : CachedNetworkImage(
                                                    //         imageUrl: patientDetails
                                                    //                 .photo!
                                                    //                 .isEmpty
                                                    //             ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                                                    //             : patientDetails
                                                    //                 .photo!,
                                                    //       )
                                                          ),
                                            context: context,
                                          ),
                                      child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 64.0,
                                          child: 
                                          CachedNetworkImage(
                                            imageUrl: "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"),
                                          // controller.fileImage64 != null
                                          //     ? Image.memory(
                                          //         base64Decode(
                                          //             controller.fileImage64),
                                          //       )
                                          //     : CachedNetworkImage(
                                          //         imageUrl: patientDetails
                                          //                 .photo!.isEmpty
                                          //             ? "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                                          //             : patientDetails.photo!,
                                          //       )
                                                )),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: FloatingActionButton(
                                  heroTag: "image",
                                  elevation: 0,
                                  child: Icon(Icons.camera_alt_rounded,
                                      color: White),
                                  backgroundColor: PrimaryColor,
                                  onPressed: () {
                                    Get.bottomSheet(
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 18.0, bottom: 18.0),
                                          color: White,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Choose Photo from :".tr,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                              FloatingActionButton(
                                                  elevation: 0,
                                                  tooltip: "Camera".tr,
                                                  onPressed: () {
                                                    // patientDetailsController
                                                    //     .getImageFromCamera();
                                                    // Navigator.pop(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           UpdateProfile(
                                                    //             patientDetails:
                                                    //                 patientDetails,
                                                    //           )),
                                                    // );
                                                  },
                                                  backgroundColor:
                                                      Colors.amberAccent,
                                                  child: Image.asset(
                                                    'assets/camera.png',
                                                    scale: 16,
                                                  )),
                                              FloatingActionButton(
                                                  elevation: 0,
                                                  focusColor:
                                                      Colors.greenAccent,
                                                  tooltip: "Gallery".tr,
                                                  onPressed: () {
                                                    // patientDetailsController
                                                    //     .getImageFromGallery();
                                                    // Navigator.pop(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           UpdateProfile(
                                                    //             patientDetails:
                                                    //                 patientDetails,
                                                    //           )),
                                                    // );
                                                  },
                                                  backgroundColor:
                                                      Colors.indigoAccent,
                                                  child: Image.asset(
                                                    'assets/gallery.png',
                                                    scale: 16,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        barrierColor:
                                            Colors.black12.withOpacity(0.5));
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "test@gmail.com",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "9878678976",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    Text(
                      'General Details'.tr,
                      style: TextStyle(
                        fontSize: 18,
                        color: PrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      // controller: patientDetailsController.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Name'.tr;
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: "Name".tr, border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                            child: TextFormField(
                          readOnly: true,
                          // controller: patientDetailsController.dob,
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1954),
                              lastDate: DateTime.now(),
                            ).then((selectedDate) {
                              // patientDetailsController.age.text =
                              //     calculateAge(selectedDate!).toString();
                              // final localization =
                              //     MaterialLocalizations.of(context);
                              // patientDetailsController.dob.text =
                              //     DateFormat('yyyy-MM-dd').format(selectedDate);
                             
                            });
                          },
                          decoration: InputDecoration(
                              labelText: "Date of Birth".tr,
                              border: OutlineInputBorder()),
                        )),
                        SizedBox(
                          width: 4,
                        ),
                        Flexible(
                          child: TextFormField(
                            readOnly: true,
                            // controller: patientDetailsController.age,
                            decoration: InputDecoration(
                                labelText: "Age".tr,
                                border: OutlineInputBorder()),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      height: 60.0,
                      child: dropDown("Blood Group", BG,
                      (text) {
                              
                            })
                      // DropdownSearch<String>(

                      //   popupProps: PopupProps.menu(
                      //     showSelectedItems: true
                      //   ),
                      //   mode: Mode.MENU,
                      //   selectedItem: patientDetailsController.bloodGroup.value,
                      //   showSelectedItem: true,
                      //   items: BG,
                      //   label: "Blood Group".tr,
                      //   onChanged: (value) {
                      //     patientDetailsController.bloodGroup.value = value!;
                      //   },
                      // ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),

                      dropDown("Gender", ["Male".tr, "Female".tr],
                      (text) {
                              
                            })
                    ,
                    // DropdownSearch<String>(
                    //   mode: Mode.MENU,
                    //   showSelectedItem: true,
                    //   items: ["Male".tr, "Female".tr],
                    //   label: "Gender".tr,
                    //   selectedItem: patientDetailsController.gender.value,
                    //   maxHeight: 120,
                    //   onChanged: (value) {
                    //     patientDetailsController.gender.value = value!;
                    //     if (value == "Female") {
                    //       patientDetailsController.showFemaleFields("YES");
                    //     } else {
                    //       patientDetailsController.showFemaleFields("NO");
                    //     }
                    //   },
                    // ),

                          SizedBox(
                            height: 20,
                          ),
                        
                          SizedBox(
                            height: 60,
                            child: Ddown(
                              label: "Pregnant Status",
                              ssItem: true,
                              validator: (value) {
        
                              },
                              itemz: [
                                "YES",
                                "NO",
                              ],
                              sItem: "",
    
                              mHeight: 120,
                              oChanged: (value) {
                    
                              },
                            ),
                          ),
            

                        SizedBox(
                            height: 10,
                          ),
                       
                            TFField(
                            function: () {},
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Pick Me'.tr;
                            //   }
                            //   return null;
                            // },
                            mLength: 12,
                            label: "PICME / RCH ID".tr,
                            kType: TextInputType.number,),
                     
                          SizedBox(
                            height: 10,
                          ),
                            TFField(
                            // txtController: patientDetailsController.lmpDate,
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
                                // patientDetailsController.lmpDate.text =
                                //     DateFormat("dd-MM-yyyy")
                                //         .format(selectedDate!)
                                //         .toString();
                                // patientDetailsController.nextVisitDate.text =
                                //     DateFormat("dd-MM-yyyy")
                                //         .format(selectedDate
                                //             .add(Duration(days: 30)))
                                //         .toString();
                                // patientDetailsController.update();
                              });
                            },
                            label: "LMP Date".tr,
                            ),
                       
                            SizedBox(
                            height: 10,
                          ),
                       
                            TFField(
                            // txtController: patientDetailsController.eddDate,
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
                                firstDate: DateTime(1948),
                                lastDate: DateTime.now(),
                              ).then((selectedDate) {
                                // patientDetailsController.eddDate.text =
                                //     DateFormat("dd-MM-yyyy")
                                //         .format(selectedDate!)
                                //         .toString();
                                // patientDetailsController.update();
                              });
                            },
                            label: "EDD Date".tr,
                            ),
                        
                          SizedBox(
                            height: 10,
                          ),
                        
                            Container(
                            height: 60.0,

                            child: 
                            Ddown(oChanged:(p0) {
                              
                            },
                            mHeight: 150,
                            ssItem: true,
                            itemz: babies,
                            sItem: "",
                            label: "Number Of Children".tr,


                            )
                          ),
                        
                          SizedBox(
                            height: 10,
                          ),
                        
                          TextFormField(
                            // controller: patientDetailsController.otherInfo,
                            decoration: InputDecoration(
                                labelText: "Other Informations".tr,
                                border: UnderlineInputBorder()),
                            keyboardType: TextInputType.text,
                            maxLines: 5,
                            maxLength: 50,
                          ),
                        
                          SizedBox(
                            height: 10,
                          ),

                          Ddown(oChanged:(p0) {
                            
                          },
                          ssItem: true,
                          sItem: "",
                          itemz: ["NORMAL", "LOW", "HIGH"],
                          label: "Health Status",
                          mHeight: 160,

                          )
                        ,
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Address Details'.tr,
                      style: TextStyle(
                        fontSize: 18,
                        color: PrimaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      // controller: patientDetailsController.address,
                      maxLines: 5,
                      decoration: InputDecoration(
                          labelText: "Address".tr,
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextFormField(
                      // controller: patientDetailsController.pinCode,
                      decoration: InputDecoration(
                          labelText: "Pincode".tr,
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        


    );
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
}