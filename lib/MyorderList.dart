import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

late List MyOrderList = [];
late SharedPreferences prefs;
setuptodo() async {
  prefs = await SharedPreferences.getInstance();
  MyOrderList.clear();
  final String? todo = prefs.getString('todo1');
  String temp;
  if (todo != null) {
    temp = todo.toString();
    List todolist = jsonDecode(temp);

    for (var i in todolist) {
      MyOrderList.add(i);
    }
  }
}

savetodo() {
  prefs.setString('todo1', jsonEncode(MyOrderList));
}
