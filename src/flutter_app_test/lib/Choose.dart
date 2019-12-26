import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Choose extends StatelessWidget {
  static const String id = "Choose";

  Future<List<User>> _getUsers() async {
    var data = await http.get("http://ericlion.tw:3000/api/resturant/list/10");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["rest_ID"], u["rest_name"], u["address"], u["type"], u["phoneNumber"] ,
      u["opentime"], u["closetime"]);

      users.add(user);

      print(users.length);
    }
    return users;
  }



  



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => Home_Page()));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                  ),
                ),
              ),

              Center(
                child: Text(
                  '今晚想吃什麼?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Card(
                  margin: EdgeInsets.fromLTRB(50,20,50,30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width:  400,
                        child: FittedBox(
                            child: Image(image: NetworkImage('http://img.lanimg.com/tuku/yulantu/140804/330797-140P411305089-lp.jpg'), )
                        ),),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '張三漢堡\n',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '台中市西屯區西屯路三段000號\n',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child:Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    size: 15,
                                  ),
                                  Text(
                                    '   (04)2244-6677',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child:Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    size: 15,
                                  ),
                                  Text(
                                    '   營業時間: 9:00A.M. ~ 10:00 P.M.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 80),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: ClipOval(
                        child: Material(
                          color: Colors.white, // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                                width: 70,
                                height: 70,
                                child: Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 40,
                                ),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Container(
                      child: ClipOval(
                        child: Material(
                          color: Colors.white, // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                              width: 70,
                              height: 70,
                              child: Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                  size: 40,
                              ),

                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class User {
  final int rest_ID;
  final String rest_name;
  final String address;
  final String type;
  final String phoneNumber;
  final String opentime;
  final String closetime;

  User(this.rest_ID, this.rest_name, this.type, this.address, this.phoneNumber, this.opentime, this.closetime);
}
