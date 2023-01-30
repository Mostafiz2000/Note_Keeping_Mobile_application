import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:practice/view/viewproduct_screen.dart';
import 'round_button.dart';
import 'secondpage.dart';
import 'settings.dart';
import 'MyorderList.dart';
import 'Thirdpartyorder.dart';
import 'profile.dart';
import 'settings.dart';
import 'package:get/get.dart';
import 'Screens/ProfilePage.dart';
import 'package:hive/hive.dart';
import 'controller/product_controller.dart';

class Listi extends StatefulWidget {
  Listi({super.key});
  late int temp = 0;

  @override
  State<Listi> createState() => _ListiState();
}

class _ListiState extends State<Listi> {
  late int d = 2;
  final ProductController controller = Get.put(ProductController());
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final _mybox = Hive.box<List<dynamic>>('mybox');
  final _mybox2 = Hive.box<int>('mybok');
  final _mybox3 = Hive.box<List<dynamic>>('myboxk');
  void writedata() {
    if (Thirdparty != null) _mybox.put(1, Thirdparty);
  }

  void readdata() {
    List<dynamic>? tempu1 = _mybox.get(1);
    if (tempu1 != null) {
      Thirdparty = tempu1;
    }
  }

  void readdata2() {
    _mybox2.put(2, 1);
  }

  @override
  Widget build(BuildContext context) {
    late List fooditems = Thirdparty;
    late List profile = Profile;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              // <-- SEE HERE
              decoration: BoxDecoration(color: const Color(0xff764abc)),
              accountName: Text(
                profile[0]['First_name'] + '' + profile[0]['Last_name'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                profile[0]['email'],
                overflow: TextOverflow.ellipsis,
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
                Navigator.pop(context);
                // ...
              },
            ),
            ListTile(
              title: const Text('My Order '),
              leading: Icon(
                Icons.list_outlined,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => lis()),
                );
              },
            ),
            ListTile(
              title: const Text('Setting'),
              leading: Icon(
                Icons.settings_outlined,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );

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
              Row(
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
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.06)),

                  // AnimSearchBar(
                  //     width: MediaQuery.of(context).size.width * 0.5,
                  //     textController: TextEditingController(text: 'Search'),
                  //     prefixIcon: Icon(
                  //       Icons.search,
                  //       color: Colors.grey[300],
                  //     ),
                  //     onSuffixTap: () {
                  //       setState(() {
                  //         TextEditingController(text: 'Serching');
                  //       });
                  //     }),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // const snackBar = SnackBar(content: Text('Tap'));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => setting()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(20),
                          child: Image.asset(
                            profile[0]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    profile[0]['username'],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(120, 144, 156, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.grey[300],
          actions: <Widget>[
            // IconButton(
            //     alignment: Alignment.topLeft,
            //     onPressed: () {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //           const SnackBar(content: Text('This is a menu')));
            //     },
            //     icon: Icon(Icons.menu))
          ]),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            print("Drag Left - AddValue");

            setState(() {});
            if (details.velocity.pixelsPerSecond.dx > -1000.0) {
              print("Drag Right - SubValue");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => lis()),
              );
            }
          },
          child: Container(
            child: ListView(
              children: [
                for (var item in fooditems)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox.fromSize(
                              size: Size.fromRadius(40),
                              child: Image.asset(
                                item['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            direction: Axis.vertical,
                            // crossAxisAlignment: CrossAxisAlrignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.local_dining_outlined,
                                      size: 20,
                                      color: Colors.blueGrey[400],
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Container(
                                    width: 140,
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
                                  Container(
                                    child: Icon(
                                      Icons.storefront_outlined,
                                      color: Colors.blueGrey[400],
                                      size: 20,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Text(
                                    item['caterer'],
                                    style: TextStyle(
                                      color: Colors.blueGrey[400],
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      size: 20,
                                      color: Colors.blueGrey[400],
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Text(
                                    item['delivery'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.blueGrey[400],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.timer_outlined,
                                      size: 20,
                                      color: Colors.blueGrey[400],
                                    ),
                                  ),
                                  // Spacer(),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Text(
                                    item['time']['Minutes'] +
                                        ':' +
                                        item['time']['seconds'],
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              child: IconButton(
                                splashRadius: 25,
                                onPressed: () {
                                  setState(() {
                                    Thirdparty.remove(item);
                                  });
                                  _mybox.put(1, Thirdparty);
                                  // savetodo2();
                                  // Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 186, 48, 46),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: IconButton(
                                splashRadius: 25,
                                onPressed: () {
                                  setState(() {
                                    Thirdparty.remove(item);
                                    MyOrderList.add(item);
                                    // writedata();
                                  });
                                  _mybox.put(1, Thirdparty);
                                  _mybox3.put(3, MyOrderList);
                                },
                                icon: Icon(
                                  Icons.done,
                                  color: Color.fromARGB(255, 26, 164, 74),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          )),
    );
  }

  Widget Mydrawelist() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(children: [
        menuitem(),
      ]),
    );
  }

  menuitem() {
    return Material(
      child: Icon(Icons.menu_outlined),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (_mybox2.get(2) == null) {
      writedata();
      print(0);
      readdata2();
    } else {
      readdata();
      print(1);
    }
  }
}
