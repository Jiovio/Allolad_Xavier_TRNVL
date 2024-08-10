import 'package:allolab/Config/Color.dart';
import 'package:allolab/Screens/Notification/NotificationView.dart';
import 'package:allolab/Screens/Settings/AppInfo.dart';
import 'package:allolab/Screens/Settings/EditProfile.dart';
import 'package:allolab/Screens/Settings/LanguageDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Container(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Settings".tr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: darkGrey2),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications_none_rounded,
                          color: Black800,
                        ),
                        onPressed: () => Get.to(() => NotificationView(),
                            transition: Transition.rightToLeft),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),


          body: SingleChildScrollView(
            child: Column(
              children: [
                            InkWell(
              splashColor: PrimaryColor.withOpacity(0.5),
              onTap: () => {},
              // settingsController.getHealthWorkerDetail(),
              child: Container(
                padding:
                    EdgeInsets.only(left: 16, top: 25, bottom: 16, right: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: Black,
                            child: Material(
                              color: Colors.transparent,
                              child: Stack(
                                children: [
                                  InteractiveViewer(
                                    child: Center(
                                        child: Image.network(
                                          "https://static-00.iconduck.com/assets.00/user-icon-1024x1024-dtzturco.png"
                                          
                                          // keep user image
                                    )),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: White,
                                        ),
                                        onPressed: () =>
                                            Navigator.pop(context)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        child: false
                                    ? CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        radius: 38,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(
                                          // controller
                                              // .healthWorkerDetails[0].photo,
                                              
                                              "https://static-00.iconduck.com/assets.00/user-icon-1024x1024-dtzturco.png"
                                        ),
                                        radius: 38,
                                      )
                                      
                                      ,
                      ),
                      SizedBox(
                        width: 24.0,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 4,
                            ),
                            // GetBuilder<MainScreenController>(
                                    false
                                        ? Text(
                                            "",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w800),
                                          )
                                        : Text(
                                            // "${controller.healthWorkerDetails[0].name}",
                                            "${"Senthil Kumar"}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w800),
                                          ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Worker ID".tr,
                                  style: TextStyle(
                                    color: Black800,
                                    fontSize: 16,
                                  ),
                                ),
                                    Text(
                                    ": a1234",
                                    // ": ${controller.healthWorkerDetails[0].uid}",

                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                
                              ],
                            ),
                          ])
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),

ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.only(left: 18, right: 18),
                      title: Text(
                        'Edit Profile'.tr,
                      ),
                      leading: Icon(
                        Icons.account_circle_outlined,
                        color: Black,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      ),
                      // onTap: () => settingsController.getHealthWorkerDetail(),
                      onTap: () =>Get.to(EditProfile()),



                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 18, right: 18),
                    title: Text(
                      'Notification'.tr,
                    ),
                    leading: Icon(
                      Icons.notifications_none,
                      color: Black,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () => notification(context),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 18, right: 18),
                    title: Text(
                      'Language'.tr,
                    ),
                    // subtitle: GetBuilder<LanguageController>(
                    //     builder: (controller) => Text(
                    //           controller.selectedLang,
                    //         )),
                    subtitle: Text("English"),
                    leading: Icon(
                      Icons.translate_rounded,
                      color: Black,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () => languageSelectDialog(context),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    title: Text(
                      'Terms & Conditions'.tr,
                    ),
                    leading: Icon(
                      Icons.assignment_outlined,
                      color: Black,
                    ),
                    // onTap: () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => WebView(
                    //                 url:
                    //                     "https://jiovio.com/buy/termsandconditions.php",
                    //                 title: "Terms of Use",
                    //               )),
                    //     )
                    onTap: () async {
                      const url = 'www.jiovio.com/buy/termsandconditions.php';
                      _launchURL(url);
                    },
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    title: Text(
                      'Privacy Policy'.tr,
                    ),
                    leading: Icon(
                      Icons.warning_amber_rounded,
                      color: Black,
                    ),
                    // onTap: () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => WebView(
                    //                 url: "https://jiovio.com/buy/policy.php",
                    //                 title: "Terms of Use",
                    //               )),
                    //     )
                    onTap: () async {
                      const url = 'www.jiovio.com';
                      _launchURL(url);
                    },
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 18, right: 18),
                    title: Text(
                      'Help'.tr,
                    ),
                    leading: Icon(
                      Icons.help_outline,
                      color: Black,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    // onTap: () => Get.to(() => Help(),
                    //     transition: Transition.rightToLeft),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 18, right: 18),
                    title: Text(
                      'App Info'.tr,
                    ),
                    leading: Icon(
                      Icons.info_outline,
                      color: Black,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () => Get.to(() => AppInfo(),
                        transition: Transition.rightToLeft),
                  ),
                  Divider(
                    height: 0,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.only(left: 18, right: 18),
                    title: Text(
                      'Log out'.tr,
                    ),
                    leading: Icon(
                      Icons.logout,
                      color: Black,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                    onTap: () {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Log out'.tr),
                              content: SingleChildScrollView(
                                child: Text('Are you sure to log out?'.tr),
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
                                      // data.remove('token');
                                      // data.remove('hospitalName');
                                      // await deleteCacheDir();
                                      // await deleteAppDir();

                                      // navController.selectedIndex.value = 0;
                                      // signOutController.googleSignOut();
                                    }),
                              ],
                            );
                          });
                    },
                  ),
                ])


              ],
            ),
          ),
      

    );
  }

  notification(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("Notification"),
          content: ListTile(
              title: Text(
                'ON/OFF',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              leading: ValueBuilder<bool?>(
                initialValue: false,
                builder: (isChecked, updateFn) => Switch(
                  activeColor: PrimaryColor,
                  value: isChecked!,
                  onChanged: (newValue) {
                    updateFn(newValue);
                  },
                ),
              ))));
}

    _launchURL(String url) async {
      await launchUrl(Uri.https(Uri.encodeComponent(url)));

    // if (await canLaunchUrl(Uri.https(url))) {
    //   await launchUrl(Uri.https(url));
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
  //   _launchURL(String url) async {
  //   if (await canLaunchUrl(url as Uri)) {
  //     await launchUrl(url as Uri);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}