import 'package:allolab/Config/Color.dart';
import 'package:allolab/Config/OurFirebase.dart';
import 'package:allolab/Controller/Chatdisplaycontroller.dart';
import 'package:allolab/Controller/User/UserController.dart';
import 'package:allolab/Screens/Chat/DoctorList.dart';
import 'package:allolab/Screens/Chat/HealthWorker.dart';
import 'package:allolab/Screens/Chat/PatientList.dart';
import 'package:allolab/db/dbHelper.dart';
import 'package:allolab/utils/backgroundservice.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  ChatController cont = Get.put(ChatController());

  Usercontroller userCont = Get.put(Usercontroller());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Chat'.tr,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Black),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.translate_rounded,
              ),
              onPressed: () {}, 
              // languageSelectDialog(context),
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_none_rounded,
              ),
              onPressed: () => Get.to(() {}, 
              // NotificationView(),
                  transition: Transition.rightToLeft),
            ),
            SizedBox(
              width: 8.0,
            ),
            GestureDetector(
                      onTap: () {},
                      //  settingsController.getHealthWorkerDetail(),
                      child:
                          // mainScreenController.healthWorkerDetails.length == 0
                          userCont.profile_pic==null
                              ? Container()
                              : CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: 
                                  CachedNetworkImageProvider(userCont.profile_pic as String) ,
                                  radius: 16,
                                ),
                    ),
            SizedBox(
              width: 10,
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'PATIENTS'.tr,
              ),
              Tab(
                text: 'DOCTORS'.tr,
              ),
              Tab(
                text: 'NURSE'.tr,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "contact",
          backgroundColor: PrimaryColor,
          onPressed: () async {
            // await createChatTable();
          //  await Backgroundservice.processDataList();

          //  await Backgroundservice.listenForData();



            // await createChatTable();
            // Get.to(() => SearchSection(), transition: Transition.rightToLeft);
          },
          child: Icon(
            Icons.people,
            color: White,
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            patientChatList(cont),
            doctorList(cont),
            healthWorkerContactList(cont),
          ],
        ),
      ),
    
    );
  }
}


