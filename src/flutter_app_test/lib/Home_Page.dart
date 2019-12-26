import 'package:flutter/material.dart';
import 'package:flutter_app_test/Choose.dart';
import 'package:flutter_app_test/Merging.dart';
//import 'package:provider/provider.dart';
import 'main.dart';
import 'DinnerCard.dart';
import 'Merging.dart';
import 'Choose.dart';
import 'Register_Page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'special.dart';
import 'chooserest.dart';

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

      //print(users.length);
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
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          Icons.search,
                          color: Colors.amber.shade900,
                          size: 40,
                        ),
                        onPressed: () {
                          showSearch(context: context, delegate: DataSearch());
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                                  //text: Provider.of<Data>(context).data['user'].toString(), // 使用者名稱取自 state
                                  text: "eric",
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
                          'image/金城武.jpg',
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
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Special()));
                        },
                      ),
                      FlatButton(
                        child: Image.asset('image/IconWait.png'),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => chooserest()));
                        },
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

class DataSearch extends SearchDelegate<String> {
  final data = [
    "a漢堡王",
    "b麥當勞",
    "c擄胃專家",
    "d小品屋",
    "f炒飯英雄",
    "g黑盒子",
    "h九州拉麵",
    "i拉牙漢堡"
  ];
  final rData = ["a漢堡王", "b麥當勞", "c擄胃專家", "d小品屋"];
  final idData = [1, 2, 3, 7, 4, 5, 6, 8];

  int indexId = 1;
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("你選擇的是"),
            GestureDetector(
              onTap: () {
                this.close(context, this.query);
                print("idindex:");
                print(indexId);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Mer(
                              rid: this.idData[indexId],
                            )));
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList =
        query.isEmpty ? rData : data.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.location_city),
        onTap: () {
          this.query = suggestionList[index];
          for (var i = 0; i < 8; i++) {
            if (this.query == this.data[i]) {
              this.indexId = i;
            }
          }
          print("hellp");
          print(this.indexId);
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
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
