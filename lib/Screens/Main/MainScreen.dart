import 'package:allolab/Components/bottom_nav_bar.dart';
import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Sync/SyncUI.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                  Get.to(() => Sync(), transition: Transition.rightToLeft),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
    );
  }
}