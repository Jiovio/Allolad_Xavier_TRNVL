
import 'package:allolab/Controller/global/InternetController.dart';
import 'package:allolab/app.dart';
import 'package:allolab/db/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:workmanager/workmanager.dart';
import 'utils/backgroundservice.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await Backgroundservice.initializeNotifications();
    await Backgroundservice.listenForData();
    return Future.value(true);
  });
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sqlite.db();
  await initLocalStorage();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  runApp(const MyApp());
}


