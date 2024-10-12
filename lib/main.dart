
import 'package:allolab/Controller/global/InternetController.dart';
import 'package:allolab/app.dart';
import 'package:allolab/db/sqlite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sqlite.db();
  await initLocalStorage();
  runApp(const MyApp());
}
