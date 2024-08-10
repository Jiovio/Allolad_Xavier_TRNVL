import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Chat/ChatScreen.dart';
import 'package:allolab/Screens/Home/Home.dart';
import 'package:allolab/Screens/Patient/PatientList.dart';
import 'package:allolab/Screens/Settings/SettingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


final NavController navController = Get.put(NavController());

final List<Widget> bodyRoutes = <Widget>[
  HomeScreen(),
  PatientlistScreen(),
  ChatScreen(),
  SettingsScreen(),
];

Obx bottomNavigationBar() {
  return Obx(
    () => Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        navController.selectedIndex.value = 0;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.home_outlined,
                            color: navController.selectedIndex.value == 0
                                ? PrimaryColor
                                : Colors.grey,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              fontSize: 12,
                              color: navController.selectedIndex.value == 0
                                  ? PrimaryColor
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        navController.selectedIndex.value = 1;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.list_alt_outlined,
                            color: navController.selectedIndex.value == 1
                                ? PrimaryColor
                                : Colors.grey,
                          ),
                          Text(
                            "Patient List",
                            style: TextStyle(
                              fontSize: 12,
                              color: navController.selectedIndex.value == 1
                                  ? PrimaryColor
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        navController.selectedIndex.value = 2;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: navController.selectedIndex.value == 2
                                ? PrimaryColor
                                : Colors.grey,
                          ),
                          Text(
                            "Chat",
                            style: TextStyle(
                              fontSize: 12,
                              color: navController.selectedIndex.value == 2
                                  ? PrimaryColor
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        navController.selectedIndex.value = 3;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.settings_outlined,
                            color: navController.selectedIndex.value == 3
                                ? PrimaryColor
                                : Colors.grey,
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(
                              fontSize: 12,
                              color: navController.selectedIndex.value == 3
                                  ? PrimaryColor
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.home_outlined), label: 'Home'.tr),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.list_alt), label: 'Patient List'.tr),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.chat_bubble_outline), label: 'Chat'.tr),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.settings_outlined), label: 'Settings'.tr)
        //   ],
        //   currentIndex: navController.selectedIndex.value,
        //   onTap: (index) => navController.selectedIndex.value = index,
        // ),
      ],
    ),
  
  );
}

//NavController
class NavController extends GetxController {
  var selectedIndex = 0.obs;
}
