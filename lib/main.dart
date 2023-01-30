import 'package:flutter/material.dart';

import 'package:practice/Screens/SplashScreen.dart';
import 'homepage.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'Screens/Constant.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/ProfilePage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'view/home_screen.dart';
import 'package:get/get.dart';
import 'secondpage.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox<List<dynamic>>('mybox');
  var box1 = await Hive.openBox<int>('mybok');
  var box2 = await Hive.openBox<List<dynamic>>('myboxk');
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        // SPLASH_SCREEN: (BuildContext context) => new Map(),
        PROFILE: (BuildContext context) => new lis(),
      },
    );
  }
}
