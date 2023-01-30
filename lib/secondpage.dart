import 'dart:async';

import 'package:practice/main.dart';
import 'savememory.dart';
import 'MyorderList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:practice/homepage.dart';
import 'round_button.dart';
import 'homepage.dart';
import 'Dialogexample.dart';
import 'Screens/ProfilePage.dart';
import 'settings.dart';
import 'profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';

class lis extends StatefulWidget {
  late List Myorder = MyOrderList;
  late int count = 0;
  final int numberoflist = 0;

  void startcount() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      StepState() {
        count++;
      }
    });
  }

  @override
  State<lis> createState() => _lisState();
}

class _lisState extends State<lis> {
  final _mybox3 = Hive.box<List<dynamic>>('myboxk');
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  void writedata3() {
    if (MyOrderList != null) _mybox3.put(3, MyOrderList);
  }

  void readdata3() {
    List<dynamic>? tempu1 = _mybox3.get(3);
    if (tempu1 != null) {
      MyOrderList = tempu1;
    }
  }

  Map<String, Color> map2 = {
    'On the way ...': Color.fromARGB(255, 224, 26, 26),
    'Food Picked': Color.fromARGB(255, 68, 170, 211),
    'Delivering ...': Color.fromARGB(255, 55, 84, 200),
    'Delivered': Color.fromARGB(255, 26, 171, 47),
    'Pending ...': Colors.blueAccent
  };
  Map<String, IconData> map1 = {
    'On the way ...': Icons.directions_run_outlined,
    'Food Picked': Icons.hail_outlined,
    'Delivering ...': Icons.delivery_dining_outlined,
    'Delivered': Icons.done_all_outlined,
    'Pending ...': Icons.pending_actions_outlined
  };
  late var myController = TextEditingController();
  late var myController1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    late List profile = Profile;

    return Scaffold(
        key: _key,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                // <-- SEE HERE
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  profile[0]['First_name'] + '' + profile[0]['Last_name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  profile[0]['email'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 60,
                ),
              ),
              ListTile(
                title: const Text('Home'),
                leading: Icon(
                  Icons.home,
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Listi()),
                  // );
                  // ...
                },
              ),
              ListTile(
                title: const Text('My Note List '),
                leading: Icon(
                  Icons.list_outlined,
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => lis()),
                  // );
                },
              ),
              ListTile(
                title: const Text('Setting'),
                leading: Icon(
                  Icons.settings_outlined,
                ),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ProfilePage()),
                  // );

                  // ...
                },
              ),
              ListTile(
                title: const Text('Profile'),
                leading: Icon(
                  Icons.account_circle_outlined,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => setting()),
                  );

                  // ...
                },
              ),
              ListTile(
                title: const Text('Terms & Conditions / Privacy'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ProfilePage()),
                  // );

                  // ...
                },
              ),
              ListTile(
                title: const Text('Log out'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ProfilePage()),
                  // );

                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: IconButton(
                    splashRadius: 25,
                    onPressed: () {
                      _key.currentState!.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu_outlined,
                      color: Color.fromARGB(255, 239, 234, 234),
                    ),
                  ),
                ),
                Text(
                  "",
                  style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[300],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.06)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(top: 18),
                        child: Row(
                          children: [
                            IconButton(
                              // splashRadius: 25,
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(pickedDate);
                                }
                              },
                              icon: Icon(
                                Icons.calendar_month_outlined,
                                color: Color.fromARGB(255, 239, 234, 234),
                              ),
                            ),
                            IconButton(
                              // splashRadius: 25,
                              onPressed: () {},
                              icon: Icon(Icons.settings_outlined,
                                  color: Color.fromARGB(255, 239, 234, 234)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color.fromRGBO(120, 144, 156, 1),
                      ),
                    ),
                  ],
                )
              ],
            ),
            actions: <Widget>[]),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            print("Drag Left - AddValue");

            setState(() {});
            if (details.velocity.pixelsPerSecond.dx > -200.0) {
              print("Drag Right - SubValue");
            }
          },
          child: Container(
            child: Stack(
              children: <Widget>[
                ListView(
                  children: [
                    for (var item in MyOrderList)
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                offset: Offset(4.0, 4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0),
                            BoxShadow(
                                color: Colors.white,
                                offset: Offset(-4.0, -4.0),
                                blurRadius: 15.0,
                                spreadRadius: 1.0),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            String dtime = DateTime.now().toString();
                            item['Date'] = dtime.substring(8, 10) +
                                "/" +
                                dtime.substring(5, 7) +
                                "/" +
                                dtime.substring(2, 4) +
                                "    " +
                                dtime.substring(11, 16);

                            if (item['name'] == 'New' && item['text'] == '') {
                              showMenu(item['id']);
                              myController.text = "";
                              myController1.text = "";
                            } else {
                              showMenu3(item['id']);
                              myController.text = item['name'];
                              myController1.text = item['text'];
                            }
                          },
                          onHorizontalDragEnd: (DragEndDetails details) {
                            print("Drag Left - AddValue");

                            setState(() {});
                            if (details.velocity.pixelsPerSecond.dx > -200.0) {
                              // if (item['status'] == 'Delivered') {
                              showMenu2(item['id']);
                              // }
                              print("Drag Right - SubValue");
                            }
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  direction: Axis.vertical,
                                  // crossAxisAlignment: CrossAxisAlrignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Container(
                                          width: 120,
                                          child: Text(
                                            item['name'],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.green[400],
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 10)),
                                        Text(
                                          " ",
                                          style: TextStyle(
                                            color: Colors.blueGrey[400],
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(left: 7)),
                                        Text(
                                          item['Date'],
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.blueGrey[400],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [],
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 10))
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 20))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
                new Positioned(
                  left: MediaQuery.of(context).size.width * 0.75,
                  top: MediaQuery.of(context).size.height * 0.70,
                  child: RoundNeuButton(
                    function: () {
                      String dtime = DateTime.now().toString();

                      setState(() {
                        MyOrderList.add(
                          {
                            'id': find(),
                            'name': 'New',
                            'text': '',
                            'time': dtime.substring(12),
                            'Date': dtime.substring(8, 10) +
                                "/" +
                                dtime.substring(5, 7) +
                                "/" +
                                dtime.substring(2, 4) +
                                "    " +
                                dtime.substring(11, 16),
                          },
                        );
                      });

                      _mybox3.put(3, MyOrderList);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => lis()),
                      );
                    },
                    child: Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  startCount() {}
  showMenu2(int uid) {
    int id = 0;
    for (var i in MyOrderList) {
      if (i['id'].toString() == uid.toString()) {
        break;
      }
      id++;
    }
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(46.0),
                topRight: Radius.circular(46.0),
              ),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 18,
                ),
                SizedBox(
                    height: (100 * 1).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(36.0),
                            topRight: Radius.circular(36.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "Delete",
                                      style: TextStyle(
                                          color: Colors.blueGrey[400]),
                                    ),
                                    leading: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        MyOrderList.remove(MyOrderList[id]);
                                      });
                                      _mybox3.put(3, MyOrderList);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => lis()),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),
                // Container(
                //   height: 56,
                //   color: Color(0xff4a6572),
                // )
              ],
            ),
          );
        });
  }

  showMenu3(int uid) {
    int id = 0;

    for (var i in MyOrderList) {
      if (i['id'].toString() == uid.toString()) {
        print(i);
        break;
      }
      id++;
    }
    print(id);
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            // height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36.0),
                topRight: Radius.circular(36.0),
              ),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 18,
                ),
                SizedBox(
                    height: (450).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    title: Text(
                                      MyOrderList[id]['name'],
                                      style: TextStyle(
                                          color: Colors.blueGrey[400],
                                          fontSize: 28,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onTap: () {
                                      myController.text =
                                          MyOrderList[id]['name'];
                                      myController1.text =
                                          MyOrderList[id]['text'];
                                      Navigator.pop(context);

                                      showMenu((MyOrderList[id]['id']));

                                      _mybox3.put(3, MyOrderList);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      MyOrderList[id]['Date'],
                                      style: TextStyle(
                                          color: Colors.blueGrey[400],
                                          fontSize: 12),
                                    ),
                                    onTap: () {
                                      myController.text =
                                          MyOrderList[id]['name'];
                                      myController1.text =
                                          MyOrderList[id]['text'];
                                      Navigator.pop(context);
                                      showMenu(MyOrderList[id]['id']);

                                      _mybox3.put(3, MyOrderList);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      MyOrderList[id]['text'],
                                      style: TextStyle(
                                          color: Colors.blueGrey[400],
                                          fontSize: 17),
                                    ),
                                    onTap: () {
                                      myController.text =
                                          MyOrderList[id]['name'];
                                      myController1.text =
                                          MyOrderList[id]['text'];
                                      Navigator.pop(context);
                                      showMenu(MyOrderList[id]['id']);

                                      _mybox3.put(3, MyOrderList);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),

                SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  // height: 300,

                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        decoration: BoxDecoration(
                          //  border: OutlineInputBorder(),

                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   height: 56,
                //   color: Color(0xff4a6572),
                // )
              ],
            ),
          );
        });
  }

  showMenu(int uid) {
    int id = 0;
    print(uid);
    for (var i in MyOrderList) {
      if (i['id'].toString() == uid.toString()) {
        print(i);
        break;
      }
      id++;
    }

    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            // height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(36.0),
                topRight: Radius.circular(36.0),
              ),
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 18,
                ),
                SizedBox(
                    height: (450).toDouble(),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: Colors.white,
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          children: <Widget>[
                            Positioned(
                              child: ListView(
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  ListTile(
                                    title: TextField(
                                      controller: myController,
                                      onEditingComplete: () {
                                        MyOrderList[id]['name'] =
                                            myController.text;
                                        MyOrderList[id]['text'] =
                                            myController1.text;
                                        Navigator.pop(context);
                                        _mybox3.put(3, MyOrderList);
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Title',
                                      ),
                                      style: TextStyle(
                                          color: Colors.blueGrey[400]),
                                    ),
                                    leading: Icon(
                                      Icons.done_outline_outlined,
                                      color: Colors.green[300],
                                      size: 30,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        MyOrderList[id]['name'] =
                                            myController.text;
                                        MyOrderList[id]['text'] =
                                            myController1.text;
                                        Navigator.pop(context);
                                        _mybox3.put(3, MyOrderList);
                                      });
                                    },
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        textAlign: TextAlign.left,
                                        controller: myController1,
                                        onEditingComplete: () {
                                          MyOrderList[id]['name'] =
                                              myController.text;
                                          MyOrderList[id]['text'] =
                                              myController1.text;
                                          Navigator.pop(context);
                                          _mybox3.put(3, MyOrderList);
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Write Here',

                                          // contentPadding: EdgeInsets.symmetric(vertical: 100),
                                        ),
                                        maxLines: 5,
                                        minLines: 1,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 300,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ))),

                SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  // height: 300,

                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Container(
                        decoration: BoxDecoration(
                          //  border: OutlineInputBorder(),

                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // Container(
                //   height: 56,
                //   color: Color(0xff4a6572),
                // )
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    readdata3();
  }
}

find() {
  late List tempo = [];

  for (var i in MyOrderList) tempo.add(i['id']);
  tempo.sort();
  int c = 0;

  for (var item in tempo) {
    if (item != c) {
      print(c);

      return c;
    }
    c++;
  }
  return c;
}
