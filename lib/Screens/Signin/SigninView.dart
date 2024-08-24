import 'package:allolab/Config/Color.dart';
import 'package:allolab/Controller/AuthController.dart';
import 'package:allolab/Screens/Main/MainScreen.dart';
import 'package:allolab/Screens/Settings/LanguageDialog.dart';
import 'package:allolab/intl/Translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class Signinview extends StatefulWidget {
  const Signinview({super.key});

  @override
  State<Signinview> createState() => _SigninviewState();
}

class _SigninviewState extends State<Signinview> {

  bool loading = false;

  bool viewPassword = true;

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

      final Authcontroller authcontroller = Get.put(Authcontroller());

       return Container(
      color: PrimaryColor,
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height / 1.04,
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      PageView(children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 2.3,
                              color: PrimaryColor,
                              child: Image.asset(
                                "assets/onboarding/image12.png",
                                width: 350,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0, right: 24.0),
                                child: Text(
                                  'Helps you to consult patient Virtually'.tr,
                                  style: TextStyle(
                                      color: darkGrey3,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 2.3,
                              width: double.infinity,
                              color: PrimaryColor,
                              child: Image.asset(
                                "assets/onboarding/image13.png",
                                width: 350,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0, right: 24.0),
                                child: Text(
                                  'Engage with patient through video and audio'
                                      .tr,
                                  style: TextStyle(
                                      color: darkGrey3,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 2.3,
                              width: double.infinity,
                              color: PrimaryColor,
                              child: Image.asset(
                                "assets/onboarding/image14.png",
                                width: 350,
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0, right: 24.0),
                                child: Text(
                                  'Keep on track your patient Health'.tr,
                                  style: TextStyle(
                                      color: darkGrey3,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        )
                      ]),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.translate_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () =>
                          languageSelectDialog(context),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Username".tr,
                                    border: UnderlineInputBorder()),
                                controller: authcontroller.username,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Username'.tr;
                                  }
                                  return null;
                                },
                              ),
                              TextFormField(
                                obscureText: !viewPassword,
                                decoration: InputDecoration(

                                    suffixIcon: IconButton(
                                        splashRadius: 18.0,
                                        onPressed: () {
                                          setState(() {
                                            viewPassword =
                                                viewPassword ? false : true;
                                          });
                                        },
                                        iconSize: 22,
                                        icon: const Icon(Icons.visibility_off)),
                                    labelText: "password".tr,
                                    border: UnderlineInputBorder()),
                                controller: authcontroller.password,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password'.tr;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // Obx(() => signInController.isloading.value
                        //     ? Center(
                        //   child: CircularProgressIndicator(),
                        // )
                        //     :
                        loading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () {

                                  // Get.to(()=>MainScreen(),transition: Transition.cupertino);


                                  if (_formKey.currentState!.validate()) {

                                    authcontroller.login();

                                  } else {
                                    Get.snackbar('All fields',
                                        'Fields are empty. please enter all fields.',
                                        snackPosition: SnackPosition.BOTTOM);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(350, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40))),
                                child: Text("CONTINUE".tr)),
                        SizedBox(
                          height: 18,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                                  'By continuing, You agree that you have read and accept our ',
                              style: TextStyle(color: Black700),
                              children: [
                                TextSpan(
                                  text: 'T&C and Privacy Policy ',
                                  style: TextStyle(
                                    color: PrimaryColor,
                                  ),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  
  }
}