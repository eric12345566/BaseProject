import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_test/Home_Page.dart';
import 'copy.dart';
import 'Wait.dart';
import 'Home_Page.dart';

class chooserest extends StatelessWidget {
  static const String id = "chooserest";

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.limeAccent[700],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home_Page(),
                            ));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Container(
                    child: Text(
                      '預約等待',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Card(
                  child: InkWell(
                    onTap: () async {
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Wait(),
                            ));
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage('sisterimage/image.png'),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  '拉牙早餐店',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '店內人數 : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '30/30',
                                    style: TextStyle(
                                      color: Colors.red[900],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '預估等候 : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '10分鐘',
                                    style: TextStyle(
                                      color: Colors.red[900],
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Card(
                  child: InkWell(
                    onTap: () async {
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Waitcopy(),
                            ));
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage('sisterimage/image1.png'),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  '藝文會館',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '店內人數 : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '10/30',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '預估等候 : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    '立即出餐',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
