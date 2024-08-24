import 'dart:typed_data';

import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/User/UserController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final Usercontroller userController = Get.put(Usercontroller());



    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile".tr),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () async {
                // if (_formKey.currentState!.validate()) {
                //   settingsController.updateInitialDetails();
                // }
              })
        ],
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            // key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                              GestureDetector(
                                  onTap: () => showDialog(
                                        builder: (BuildContext context) =>
                                            Container(
                                                height: Get.height / 2,
                                                width: Get.width / 2,
                                                child: 
                                                // controller.fileImage64 !=
                                                //         null
                                                //     ? 
                                                //     Image.memory("base64Image"(
                                                //         controller.fileImage64))
                                                //     : 
                                                    CachedNetworkImage(
                                                        imageUrl: "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                                                      )),
                                        context: context,
                                      ),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius: 64.0,
                                      child: 
                                      // controller.fileImage64 != null
                                      //     ? Image.memory(
                                      //         base64Decode(
                                      //             controller.fileImage64),
                                      //       )
                                      //     : 
                                          CachedNetworkImage(
                                              imageUrl: 
                                              // mainScreenController
                                              //             .healthWorkerDetails
                                              //             .length !=
                                              //         0
                                              //     ? mainScreenController
                                              //             .healthWorkerDetails
                                              //             .first
                                              //             .photo
                                              //             .isEmpty
                                              //         ? 
                                                      "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png"
                                            ))),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: FloatingActionButton(
                              heroTag: "image",
                              elevation: 0,
                              child:
                                  Icon(Icons.camera_alt_rounded, color: White),
                              backgroundColor: PrimaryColor,
                              onPressed: () {
                                showModalBottomSheet(
                                  builder: (BuildContext context) => Container(
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
                                              // settingsController
                                              //     .getImageFromCamera();
                                           
                                            },
                                            backgroundColor: Colors.amberAccent,
                                            child: Image.asset(
                                              'assets/camera.png',
                                              scale: 16,
                                            )),
                                        FloatingActionButton(
                                            elevation: 0,
                                            focusColor: Colors.greenAccent,
                                            tooltip: "Gallery".tr,
                                            onPressed: () {
                                              // settingsController
                                              //     .getImageFromGallery();
                                              Navigator.pop(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditProfile()),
                                              );
                                            },
                                            
                                            backgroundColor:
                                                Colors.indigoAccent,
                                            child: Image.asset(
                                              'assets/gallery.png',
                                              scale: 16,
                                            )
                                            ),
                                      ],
                                    ),
                                  ),
                                  barrierColor: Colors.transparent,
                                  context: context,
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
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
                  controller: userController.name,
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
                  height: 12.0,
                ),
                Row(
                  children: [
                    Flexible(
                      child: DropdownSearch<String>(

                        dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration(
                          labelText: "Gender".tr
                        )),
                        

                        validator: (v) =>
                            v == null ? "Please Select Gender".tr : null,

                        popupProps: PopupProps.menu(
                          constraints: BoxConstraints(maxHeight: 120),
                          
                          showSelectedItems: true
                        ),
                        selectedItem: userController.gender,
                        items: ["Male", "Female"],
                        onChanged: (value) {
                          userController.gender = value!;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: userController.age,
                        onTap: () {},
                        decoration: InputDecoration(
                            labelText: "Age".tr, border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Age'.tr;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 60.0,
                  child: DropdownSearch<String>(
                    dropdownDecoratorProps: DropDownDecoratorProps(dropdownSearchDecoration: InputDecoration(
                      labelText: "Year of Experience".tr,
                    )),
                    selectedItem: userController.yearOfExperience,
                    validator: (v) =>
                        v == null ? "Select Years of experience".tr : null,
                    popupProps: PopupProps.menu(
                      showSelectedItems: true
                    ),
                    // showSelectedItem: true,
                    items: yoe,
                    onChanged: (value) {
                      userController.yearOfExperience = value!;
                    },
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: userController.title,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Title'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Title".tr, border: OutlineInputBorder()),
                ),
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
                  controller: userController.address,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text'.tr;
                    }
                    return null;
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: "Address".tr, border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  controller: userController.pincode,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter pincode'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Pincode".tr, border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
        ),
      )

    );
  }


}

  List<String> yoe = [
  "0-1",
  "1-2",
  "2-3",
  "3-4",
  "4-5",
  "5-6",
  "6-7",
  "7-8",
  "8-9",
  "9-10",
  "10+"
];