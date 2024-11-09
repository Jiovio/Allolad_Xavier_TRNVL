
import 'package:allolab/API/Requests/HospitalApi.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/GlobalPatientController.dart';
import 'package:allolab/Screens/Consultation/Consultation.dart';
import 'package:allolab/Screens/Screening/CheckUpReport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Currentappointment extends StatefulWidget {
  const Currentappointment({super.key});

  @override
  State<Currentappointment> createState() => _CurrentappointmentState();
}

class _CurrentappointmentState extends State<Currentappointment> {
  // Keys to force FutureBuilder rebuilds
  Key _currentAppointmentKey = UniqueKey();
  Key _allAppointmentsKey = UniqueKey();

  // Method to refresh both FutureBuilders
  void _refreshAppointments() {
    setState(() {
      _currentAppointmentKey = UniqueKey();
      _allAppointmentsKey = UniqueKey();
    });
  }


  Globalpatientcontroller gp = Get.put(Globalpatientcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Appointments"),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Current Appointment".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            FutureBuilder(
              key: _currentAppointmentKey,
              future: Hospitalapi.getScheduledAppointments(gp.id as int),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                  return Center(child: Text("No Upcoming Appointments".tr));
                } else {
                  var appointment = snapshot.data[0];
      
                  return Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, index) => Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        margin: const EdgeInsets.only(left: 10, top: 10, right: 4),
                        decoration: BoxDecoration(
                          color: PrimaryColor.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(14),
                          highlightColor: accentColor.withOpacity(0.3),
                          splashColor: accentColor.withOpacity(0.5),
                          onTap: () {

                            print(appointment);
                            
                            Get.to(()=>Consultation(data:appointment),
                                        transition: Transition.rightToLeft);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, right: 20.0, left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr.${appointment["doctor"]["name"]}",
                                  style: TextStyle(
                                    color: White,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Divider(color: White, thickness: 2),
                                Row(
                                  children: [
                                    Text(
                                      "Date".tr,
                                      style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      " : ${appointment['appointment_date']}",
                                      style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      "Time".tr,
                                      style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      " : ${appointment['start_time']}",
                                      style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      "Status".tr,
                                      style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      " : ${appointment['status']}",
                                      style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      "Reason".tr,
                                      style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      " : ${appointment['reason']}",
                                      style: TextStyle(
                                        color: White,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 14),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    // ElevatedButton(
                                    //                   style: ElevatedButton
                                    //                       .styleFrom(
                                    //                           backgroundColor: White,
                                    //                           elevation: 0),
                                    //                   onPressed: () {}, 
                                    //                   // Get.to(
                                    //                   //     () => Consultation(
                                    //                   //           appointment:
                                    //                   //               controller
                                    //                   //                       .upcomingAppointmentList[
                                    //                   //                   index],
                                    //                   //           patientDetails:
                                    //                   //               patientDetails,
                                    //                   //         ),
                                    //                   //     transition: Transition
                                    //                   //         .rightToLeft),
                                    //                   child: Text(
                                    //                     "View Appointment".tr,
                                    //                     style: TextStyle(
                                    //                         color:
                                    //                             Colors.black),
                                    //                   )),


                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: White,
                                        elevation: 0,
                                      ),
                                      onPressed: () {
                                        showDialog<void>(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Cancel Appointment'.tr),
                                              content: SingleChildScrollView(
                                                child: Text(
                                                    'Are you sure to cancel the appointment?'
                                                        .tr),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: Text('No'.tr),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text('Yes'.tr),
                                                  onPressed: () async {
                                                    bool status =
                                                        await Hospitalapi
                                                            .cancelAppointment(
                                                                appointment["id"]);
                                                    Navigator.of(context)
                                                        .pop(); // Close dialog
                                                    if (status) {
                                                      // Refresh both FutureBuilders
                                                      _refreshAppointments();
                                                      // Show success message
                                                      ScaffoldMessenger.of(context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              'Appointment cancelled successfully'
                                                                  .tr),
                                                          backgroundColor:
                                                              Colors.green,
                                                        ),
                                                      );
                                                    } else {
                                                      // Show error message
                                                      ScaffoldMessenger.of(context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              'Failed to cancel appointment'
                                                                  .tr),
                                                          backgroundColor:
                                                              Colors.red,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Cancel Appointment".tr,
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                " My Appointments ".tr,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            FutureBuilder(
              key: _allAppointmentsKey,
              future: Hospitalapi.getAllAppointmentsByUesr(gp.id as int),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    var appointments = snapshot.data;
                    return ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        var appointment = appointments[index];
                        return Card(
                          elevation: 1,
                          shape: Border(
                            left: BorderSide(
                              color: appointment['status'] == 'Scheduled'
                                  ? Colors.green
                                  : Colors.redAccent,
                              width: 4,
                            ),
                          ),
                          child: InkWell(
                            highlightColor: Colors.green.withOpacity(0.1),
                            splashColor: Colors.green.withOpacity(0.8),
                            onTap: () => Get.to(CheckUpReport()),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 10, right: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        DateFormat('dd-MM-yyyy')
                                            .format(DateTime.parse(
                                                appointment['appointment_date']))
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        appointment['doctor']['name'],
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Appointment Status".tr,
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(height: 6.0),
                                        Text(
                                          appointment['status'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                appointment['status'] == 'Scheduled'
                                                    ? Colors.orange
                                                    : Colors.redAccent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 10),
                      itemCount: appointments.length,
                    );
                  } else {
                    return Text('No appointments found');
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}