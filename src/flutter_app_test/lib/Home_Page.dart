import 'package:flutter/material.dart';
import 'package:flutter_app_test/Choose.dart';
import 'package:flutter_app_test/Merging.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'DinnerCard.dart';
import 'Merging.dart';
import 'Choose.dart';
import 'Register_Page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> showAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('測試標題'),
        content: const Text('測試內容.....'),
        actions: <Widget>[
          FlatButton(
            child: Text('確定'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class Home_Page extends StatelessWidget {
  static const String id = "Home_Page";

  Future<List<User>> _getUsers() async {
    var data = await http.get("http://ericlion.tw:3000/api/resturant/list/10");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["rest_ID"], u["rest_name"], u["type"], u['res_urla']);

      users.add(user);

      print(users.length);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      new RichText(
                        text: TextSpan(
                            style: new TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: '嗨! '),
                              new TextSpan(
                                  text: Provider.of<Data>(context)
                                      .data['user']
                                      .toString(), // 使用者名稱取自 state
                                  style: new TextStyle(
                                      color: Colors.deepOrangeAccent)),
                              new TextSpan(text: ' ，要'),
                              new TextSpan(
                                  text: '吃晚餐',
                                  style: new TextStyle(
                                      color: Colors.deepOrangeAccent)),
                              new TextSpan(text: '了嗎？'),
                            ]),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        child: Image.asset(
                          'image/韓國瑜.jpg',
                          height: 70,
                          width: 70,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        child: Image.asset('image/IconSlot.png'),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DinnerCard()));
                        },
                      ),
                      FlatButton(
                        child: Image.asset('image/IconCard.png'),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Choose()));
                        },
                      ),
                      FlatButton(
                        child: Image.asset('image/IconMission.png'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Image.asset('image/IconWait.png'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment(-0.835, 0),
                  child: Text(
                    '附近餐廳',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FutureBuilder(
                  future: _getUsers(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                          child: Center(
                        child: Text("Loading..."),
                      ));
                    } else {
                      return Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int rest_ID) {
                            return Container(
                              width: 160.0,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Card(
                                child: InkWell(
                                  onTap: () async {
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Mer(
                                                    rid: snapshot
                                                        .data[rest_ID].rest_ID,
                                                  )));
                                    }
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 100,
                                        child: Image(
                                            image: NetworkImage(
                                                snapshot.data[rest_ID].resUrla),
                                            fit: BoxFit.cover),
                                      ),
                                      SizedBox(height: 8.50),
                                      Container(
                                          alignment: Alignment(-0.8, 10),
                                          child: Text(
                                            snapshot.data[rest_ID].rest_name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(height: 8.50),
                                      Container(
                                          child: Text(
                                        snapshot.data[rest_ID].type,
                                        style: TextStyle(fontSize: 10),
                                      ))
                                    ],
                                  ),
                                ),
                                elevation: 5,
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment(-0.835, 0),
                  child: Text(
                    '今日熱門',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                FutureBuilder(
                  future: _getUsers(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                          child: Center(
                        child: Text("Loading..."),
                      ));
                    } else {
                      return Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int rest_ID) {
                            return Container(
                              width: 160.0,
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Card(
                                child: InkWell(
                                  onTap: () async {
                                    {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Mer(
                                                    rid: snapshot
                                                        .data[rest_ID].rest_ID,
                                                  )));
                                    }
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 100,
                                        child: Image(
                                            image: NetworkImage(
                                                snapshot.data[rest_ID].resUrla),
                                            fit: BoxFit.cover),
                                      ),
                                      SizedBox(height: 8.50),
                                      Container(
                                          alignment: Alignment(-0.8, 10),
                                          child: Text(
                                            snapshot.data[rest_ID].rest_name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )),
                                      SizedBox(height: 8.50),
                                      Container(
                                          child: Text(
                                        snapshot.data[rest_ID].type,
                                        style: TextStyle(fontSize: 10),
                                      ))
                                    ],
                                  ),
                                ),
                                elevation: 5,
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  final int rest_ID;
  final String rest_name;
  final String type;
  final String resUrla;

  User(this.rest_ID, this.rest_name, this.type, this.resUrla);
}
