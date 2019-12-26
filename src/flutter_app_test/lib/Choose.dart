import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home_Page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Merging.dart';

class Choose extends StatelessWidget {
  static const String id = "Choose";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Choice()
     ),
    );
  }
              }

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
    var i = 0;

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
    return SafeArea(
          child:FutureBuilder(
            future: _getUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50,),
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
                SizedBox(height: 50,),
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
                                      snapshot.data[i].rest_name,
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
                                      snapshot.data[i].address,
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
                                      snapshot.data[i].phoneNumber,
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
                                      '   營業時間  ${snapshot.data[i].opentime} ~ ${snapshot.data[i].closetime} ',
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
                SizedBox(height: 50,),
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
                              onTap: () async {
                                {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=>Mer(rid: snapshot.data[i].rest_ID,)
                                      )
                                  );
                                }
                              },
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
                              onTap: () {
                                setState(() {
                                  
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
         }} ),
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
