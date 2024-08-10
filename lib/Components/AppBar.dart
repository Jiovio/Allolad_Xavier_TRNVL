import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Notification/NotificationView.dart';
import 'package:allolab/Screens/Settings/LanguageDialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

PreferredSize customAppBar(
    {required String title,
    // ignore: non_constant_identifier_names
    required BuildContext Context,
    // ignore: non_constant_identifier_names
    required Color Color,
    required double elevation}) {

  return PreferredSize(
      preferredSize: Size.fromHeight(100.0),
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 8),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(Context).size.width * .4,
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24, color: Color),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.translate_rounded,
                      color: Black800,
                    ),
                    onPressed: () =>
                    languageSelectDialog(Context),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      color: Black800,
                    ),
                    onPressed: () => 
                    Get.to(() => NotificationView(),
                        transition: Transition.rightToLeft),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                          GestureDetector(
                            onTap: () {},
                                // settingsController.getHealthWorkerDetail(),
                            child: false
                                ? Container()
                                : CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 16.0,
                                    backgroundImage: NetworkImage("https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjg2OC1zYXNpLTA2LmpwZw.jpg")),
                          ),
                ],
              )
            ],
          ),
        ),
      ));
}
