import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:practice/homepage.dart';
import 'package:practice/secondpage.dart';
import 'package:practice/profile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  final myController = TextEditingController();
  final First_name = TextEditingController();
  final Last_name = TextEditingController();
  final Email = TextEditingController();
  final Address = TextEditingController();
  final mobile = TextEditingController();
  final age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                gradient: new LinearGradient(colors: [
              const Color(0xFF26CBE6),
              const Color(0xFF26CBC0),
            ], begin: Alignment.topCenter, end: Alignment.center)),
          ),
          new Scaffold(
            backgroundColor: Colors.transparent,
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.center,
                    child: new Padding(
                      padding: new EdgeInsets.only(top: _height / 15),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundImage:
                                new AssetImage(Profile[0]['image']),
                            radius: _height / 10,
                          ),
                          new SizedBox(
                            height: _height / 30,
                          ),
                          new Text(
                            Profile[0]['First_name'] +
                                " " +
                                Profile[0]['Last_name'],
                            style: new TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(top: _height / 2.2),
                    child: new Container(
                      color: Colors.white,
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 2.6,
                        left: _width / 20,
                        right: _width / 20),
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 2.0,
                                    offset: new Offset(0.0, 2.0))
                              ]),
                          child: new Padding(
                            padding: new EdgeInsets.all(_width / 20),
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  headerChild(
                                      'Delivered', Profile[0]['Delivered']),
                                  headerChild1(
                                      'Ratings', Profile[0]['Ratings']),
                                  headerChild('Followers', 100000),
                                ]),
                          ),
                        ),
                        new Padding(
                          padding: new EdgeInsets.only(top: _height / 20),
                          child: new Column(
                            children: <Widget>[
                              infoChild(_width, Icons.account_circle_outlined,
                                  Profile[0]['username']),
                              infoChild(
                                  _width, Icons.email, Profile[0]['email']),
                              infoChild(
                                  _width, Icons.call, Profile[0]['mobile']),
                              infoChild(_width, Icons.location_on_outlined,
                                  Profile[0]['address']),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: [
                              //     Icon(Icons.border_color,
                              //         size: 40, color: Color(0xFF26CBE6))
                              //   ],
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget headerChild1(String header, int value) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Container(
            child: RatingBar.builder(
              initialRating: value.toDouble(),
              itemSize: 18,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
                size: 4,
              ),
              onRatingUpdate: (rating) {},
            ),
          )
//          new RatingBar.builder(
//    initialRating: 3,
//    minRating: 1,
//    direction: Axis.horizontal,
//    allowHalfRating: true,
//    itemCount: 5,
//    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//    itemBuilder: (context, _) => Icon(
//      Icons.star,
//      color: Colors.amber,
//    ),
//    onRatingUpdate: (rating) {
//      print(rating);
//    },
// );
          // new Text(
          //   '$value',
          //   style: new TextStyle(
          //       fontSize: 14.0,
          //       color: const Color(0xFF26CBE6),
          //       fontWeight: FontWeight.bold),
          // )
        ],
      ));
  Widget headerChild(String header, int value) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(header),
          new SizedBox(
            height: 8.0,
          ),
          new Text(
            '$value',
            style: new TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF26CBE6),
                fontWeight: FontWeight.bold),
          )
        ],
      ));
  Widget infoChild(double width, IconData icon, data) => new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: width / 10,
              ),
              new Icon(
                icon,
                color: Colors.blueGrey[400],
                size: 25.0,
              ),
              new SizedBox(
                width: width / 20,
              ),
              new Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
