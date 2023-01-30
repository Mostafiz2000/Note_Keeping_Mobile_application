import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

late List Thirdparty = [
  {
    'id': 0,
    'name': 'French fries',
    'caterer': 'Mammaji\'s Kitchen',
    'price': '350',
    'image': './assets/image/8.jpeg',
    'delivery': 'Udayan sir',
    'time': {'Minutes': '20', 'seconds': '00'},
    'status': 'Pending ...'
  },
  {
    'id': 9,
    'name': 'French fries',
    'caterer': 'Mammaji\'s Kitchen',
    'price': '350',
    'image': './assets/image/8.jpeg',
    'delivery': 'Udayan sir',
    'time': {'Minutes': '20', 'seconds': '00'},
    'status': 'Pending ...'
  },
  {
    'id': 1,
    'name': 'Burger',
    'caterer': 'Chillox',
    'price': '350',
    'image': './assets/image/3.png',
    'delivery': 'Mostafizs house',
    'time': {'Minutes': '10', 'seconds': '00'},
    'status': 'Pending ...'
  },
  {
    'id': 2,
    'name': 'Noodles',
    'caterer': '2 No. Canteen',
    'price': '350',
    'image': './assets/image/5.jpg',
    'delivery': 'Mostafizs house',
    'time': {'Minutes': '30', 'seconds': '00'},
    'status': 'Pending ...'
  },
  {
    'id': 3,
    'name': 'Chicken Dam Biriyani',
    'caterer': 'Haji Kacchi Ghar',
    'price': '350',
    'image': './assets/image/9.jpg',
    'delivery': 'Asif Iqbal',
    'time': {'Minutes': '40', 'seconds': '00'},
    'status': 'Pending ...'
  },
];
late List stat = [
  {'start': 0}
];
late SharedPreferences prefs2;
setuptodo2() async {
  prefs2 = await SharedPreferences.getInstance();

  final String? todo = prefs2.getString('todo3');
  String temp;
  if (todo != null) {
    Thirdparty.clear();
    temp = todo.toString();

    List todolist = jsonDecode(temp);
    for (var i in todolist) Thirdparty.add(i);
  }
}

savetodo2() async {
  String tempu = jsonEncode(Thirdparty);

  prefs2.setString('todo3', tempu);
}
