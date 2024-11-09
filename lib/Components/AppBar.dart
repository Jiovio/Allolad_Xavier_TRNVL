import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/User/UserController.dart';
import 'package:allolab/Screens/Notification/NotificationView.dart';
import 'package:allolab/Screens/Settings/LanguageDialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

PreferredSize customAppBar(
    {required String title,
    // ignore: non_constant_identifier_names
    required BuildContext Context,
    // ignore: non_constant_identifier_names
    required Color Color,
    required double elevation}) {


      Usercontroller cont = Get.put(Usercontroller());

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
                            child: cont.profile_pic==null
                                ? Container()
                                : CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 16.0,
                                    backgroundImage: CachedNetworkImageProvider(cont.profile_pic as String)),
                          ),
                ],
              )
            ],
          ),
        ),
      ));
}
