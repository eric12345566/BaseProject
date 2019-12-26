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
    var data = await http.get("");

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["index"], u["name"], u["tag"]);

      users.add(user);

      print(users.length);

      return users;
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context, AsyncSnapshot snapshot){

                if(snapshot.data == null){
                  return Container(
                    child: Center(
                      child: Text("Loading..."),
                    )
                  );
                }else {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {
                              {
                                showAlert(context);
                              }
                            },
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                    snapshot.data[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                      snapshot.data[index].tag,
                                      style: TextStyle(fontSize: 10),
                                    ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      );
                    },
                  );
                }
            },
          ),
        ),
      ),
    );
  }
}



class User {
  final int index;
  final String name;
  final String tag;

  User(this.index, this.name, this.tag);
}
