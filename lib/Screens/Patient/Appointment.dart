import 'package:allolab/Config/Color.dart';
import 'package:allolab/Models/DoctorDetails.dart';
import 'package:allolab/Models/PatientDetails.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';


class Appointment extends StatelessWidget {
 final _formKey = GlobalKey<FormState>();
  // PatientModel patientDetails;
  Appointment({Key? key}) : super(key: key);
  // Appointment({Key? key, required this.patientDetails}) : super(key: key);
  

  @override
  Widget  build (BuildContext context) {
    final localizations = MaterialLocalizations.of(context);
    Widget _customPopupItemBuilderExample2(
        BuildContext context, DoctorDetails item, bool isSelected) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
        child: ListTile(
          selected: isSelected,
          title: Text(
              "Dr.${item.name} ${item.designation.toString().toUpperCase()}"),
          subtitle: Text(item.specialization.toString()),
          leading: CircleAvatar(
            // this does not work - throws 404 error
            child: CachedNetworkImage(
              imageUrl: item.photo,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    // colorFilter:
                    // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                  ),
                ),
              ),
              placeholder: (context, url) => Container(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      );
    }
    
    Widget _customDropDownExample(
        BuildContext context, DoctorDetails? item, String i) {
      if (item == null) {
        return Container();
      }
      return Container(
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: CircleAvatar(
            // this does not work - throws 404 error
            child: CachedNetworkImage(
              imageUrl: item.photo,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    // colorFilter:
                    // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                  ),
                ),
              ),
              placeholder: (context, url) => Container(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          title: Text(
              "Dr.${item.name} ${item.designation.toString().toUpperCase()}"),
          subtitle: Text(
            item.specialization.toString(),
          ),
        ),
      );
    }
        return Scaffold(
      appBar: AppBar(
        title: Text("Appointment"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: _formKey,
              child: 
              
              // GetBuilder<AppointmentController>(
              //   builder: (controller) =>
                
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    false
                    // GetBuilder<AppointmentController>(
                    //     builder: (controller) =>
                    //         controller.doctorDetails.length == 0
                                ? Container()
                                : DropdownSearch<DoctorDetails>(
                                    validator: (v) =>
                                        v == null ? "Select Doctor".tr : null,
                                    // mode: Mode.BOTTOM_SHEET,
                                    popupProps: PopupProps.bottomSheet(
                                      showSelectedItems: false
                                    ),
                                    items: [],
                                    // selectedItem: "",
                                        // controller.doctorDetails.first,
                                    // showSearchBox: true,
                                    
                                    dropdownDecoratorProps: DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                      labelText: "Select Doctor",
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 12, 0, 0),
                                      border: OutlineInputBorder(),
                                    )
                                    )
                                    ,
                                    onChanged: (value) {
                                      // controller.selectedDoctor = value!.id;
                                      // controller.getHolidayList(value.id);
                                      // controller.selectedDoctorDetails = value;
                                    },
                                    // dropdownBuilder: _customDropDownExample,
                                    // popupItemBuilder: _customPopupItemBuilderExample2,
                                  ),
                    SizedBox(
                      height: 18,
                    ),
                    // GetBuilder<AppointmentController>(
                    //     builder: (controller) =>
                        
                         TextFormField(
                              // controller: appointmentController.aDate,
                              decoration: InputDecoration(
                                  suffix: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: true
                                      
                                      // controller.showAvailableSlot
                                          ? CircularProgressIndicator()
                                          : Container()),
                                  labelText: "Appointment Date".tr,
                                  border: OutlineInputBorder()),
                              readOnly: true,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  // initialDate: controller.holiday.contains(
                                  //             "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}") ==
                                  //         true
                                  //     ? DateTime.now().add(Duration(days: 1))
                                  //     : DateTime.now(),
                                  // selectableDayPredicate: (DateTime val) {
                                  //   // String sanitized = sanitizeDateTime(val);
                                  //   // return !controller.holiday
                                  //   //     .contains(sanitized);
                                  // },
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2025),
                                ).then((selectedDate) {
                                  // final localization =
                                  //     MaterialLocalizations.of(context);
                                  // appointmentController.aDate.text =
                                  //     localization
                                  //         .formatShortDate(selectedDate!);
                                  // appointmentController.appointmentDate =
                                  //     selectedDate;
                                  // appointmentController.getAppointmentSlots(
                                  //     appointmentController.selectedDoctor,
                                  //     selectedDate,
                                  //     context);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select Appointment Date'.tr;
                                }
                                return null;
                              },
                            ),
                    SizedBox(
                      height: 18,
                    ),
                    Visibility(
                      visible: true,
                      
                      // controller.slot.isNotEmpty,
                      child: OutlinedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: SingleChildScrollView(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Available slots".tr,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18),
                                            ),
                                            TextButton(
                                                onPressed:() {}, 
                                                // Get.back() ,
                                                
                                                
                
                                                child: Text("Close"))
                                          ],
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                        child:
                                                GridView.count(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    crossAxisCount: 4,
                                                    childAspectRatio: 2.0,
                                                    children: List.generate(
                                                      // controller
                                                      //     .datesList.length,
                                                      1,
                                                      (slotIndex) => ChoiceChip(
                                                        selected: false,
                                                        shadowColor:
                                                            Colors.grey,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0)),
                                                        label: Text(
                                                          // localizations
                                                          //     .formatTimeOfDay(
                                                          //   controller
                                                          //           .datesList[
                                                          //       slotIndex],
                                                          // ),
                                                          "Noon",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: Black,
                                                              // controller
                                                              //             .selectedSlots ==
                                                              //         controller
                                                              //                 .datesList[
                                                              //             slotIndex]
                                                              //     ? White
                                                              //     : Black
                                                                  ),
                                                        ),
                                                        selectedColor:
                                                            PrimaryColor,
                                                        // ignore: unrelated_type_equality_checks
                                                        // selected:
                                                        
                                                        // controller
                                                        //         .selectedSlots ==
                                                        //     controller
                                                        //             .datesList[
                                                        //         slotIndex],
                                                        onSelected: (value) {
                                                          // controller.updateSelectedSlots(
                                                          //     controller
                                                          //             .datesList[
                                                          //         slotIndex]);
                                                          // controller
                                                          //         .selectedSlotsString =
                                                          //     controller
                                                          //         .datesList[
                                                          //             slotIndex]
                                                          //         .format(
                                                          //             context);
                                                        },
                                                        labelStyle: TextStyle(
                                                            // ignore: unrelated_type_equality_checks
                                                            color: White),
                                                      ),
                                                    ))),
                                  ],
                                )),
                              ),
                            );
                          },
                          child: Text(
                            "View Available Slots".tr,
                            style: TextStyle(fontSize: 16),
                          )),
                    ),
                    // GetBuilder<AppointmentController>(
                    //     init: AppointmentController(),
                    //     builder: (controller) =>


                    true
                            // controller.selectedSlotsString.isNotEmpty
                                ? Wrap(
                                    children: [
                                      Text(
                                        "Selected time slot :".tr,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        // "${controller.selectedSlotsString}",
                                        "hi",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  )
                                : Text("No Slot Selected".tr),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      // controller: appointmentController.diagnosis,
                      decoration: InputDecoration(
                          labelText: "Diagnosis Desc".tr,
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Diagnosis Desc'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        true
                        // GetBuilder<AppointmentController>(
                        //     init: AppointmentController(),
                        //     builder: (controller) => controller
                        //             .selectedSlotsString.isEmpty
                                ? ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width /
                                                2,
                                            42),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                    onPressed: null,
                                    child: Text("Book".tr),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width /
                                                2,
                                            42),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                    onPressed: () {
                                      // if (_formKey.currentState!.validate()) {
                                      //   appointmentController.bookAppointment(
                                      //       patientDetails.id,
                                      //       patientDetails.name,
                                      //       patientDetails.phone);
                                      // }
                                    },
                                    child: Text("Book".tr),
                                  )
                      ],
                    )
                  ],
                ),
              ),
        ),
      ),
    );
  }

  }
