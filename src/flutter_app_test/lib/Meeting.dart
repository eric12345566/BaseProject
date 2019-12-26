import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DinnerCard.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Merging.dart';


class Meeting extends StatelessWidget {

  static const String id = "Meeting";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Meet(),
      ),
    );
  }
}

class Meet extends StatefulWidget {
  @override
  _MeetState createState() => _MeetState();
}

class _MeetState extends State<Meet> {

  var i = 0;
  Future<List<User>> _getUsers() async {
    var data = await http.get("http://ericlion.tw:3000/api/user");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["userID"], u["name"], u["gender"], u["year"], u["rating"] ,
          u["like_eat"], u["pic"],u["uni"],u["dp"],);

      users.add(user);

      print(users.length);
    }
    return users;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
            return Container(
                child: Center(
                child: Text('Loading...'),
            ),
            );
            } else {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 40,),
                      Container(
                        margin: EdgeInsets.only(left: 100),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.casino,
                              color: Colors.white,
                              size: 35,
                            ),
                            Text(
                              '晚餐拉霸',
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.casino,
                              color: Colors.white,
                              size: 35,
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(120),
                          child: Card(
                            margin: EdgeInsets.fromLTRB(50, 20, 50, 30),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 400,
                                  height: 400,
                                  child: Image(
                                    image: NetworkImage('http://5b0988e595225.cdn.sohucs.com/images/20190305/1db93256bcd64241a0077cd2f135529d.jpeg'),
                                    width: 3,
                                    height: 3,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 30),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              snapshot.data[i].name,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              '${snapshot.data[i].uni} ${snapshot.data[i].dp } ${snapshot.data[i].year}歲',
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
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              '喜歡吃 :${snapshot.data[i].like_eat}',
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
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              '拉霸評價 : ${snapshot.data[i].rating}分',
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
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(80, 20, 0, 50),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Container(

                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.red, // inkwell color
                                      child: SizedBox(
                                        width: 90,
                                        height: 70,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              '  ',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Icon(
                                              Icons.done,
                                              color: Colors.green,
                                              size: 20,
                                            ),
                                            Text(
                                              '接受',
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Container(

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  child: Material(
                                    color: Colors.white, // button color
                                    child: InkWell(
                                      splashColor: Colors.red, // inkwell color
                                      child: SizedBox(
                                        width: 90,
                                        height: 70,
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              '  ',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Icon(
                                              Icons.clear,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                            Text(
                                              '拒絕',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          i = (i+1)%9;
                                        });
                                      },
                                    ),
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
              );
            }});
  }
}


class User {
  final int userID;
  final String name;
  final String gender;
  final String year;
  final String rating;
  final String like_eat;
  final String pic;
  final String uni;
  final String dp;

  User(this.userID, this.name, this.gender, this.year, this.rating, this.like_eat, this.pic, this.uni,this.dp);
}



