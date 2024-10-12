import 'package:allolab/API/Requests/Userapi.dart';
import 'package:allolab/Components/bottom_nav_bar.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/User/UserController.dart';
import 'package:allolab/Screens/Sync/SyncUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});


  Usercontroller controller = Get.put(Usercontroller());

  @override
  Widget build(BuildContext context) {
    return 
    Obx(()=>
    controller.loading.value ? Scaffold(body: Center(child: CircularProgressIndicator())):
    Scaffold(

      bottomNavigationBar: bottomNavigationBar(),

      body: Obx(() => bodyRoutes.elementAt(navController.selectedIndex.value),


    ),

                      floatingActionButton: FloatingActionButton(
                        backgroundColor: Colors.transparent,
              mini: false,
              child: Container(
                // color: Colors.transparent,
                width: 80,
                height: 80,
                child: Icon(
                  Icons.sync,
                  color: White,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: yellowColor,
                ),
              ),
              onPressed: () => 
              controller.initScreen(),
                  // Get.to(() => Sync(), transition: Transition.rightToLeft),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
    ));
  }
}