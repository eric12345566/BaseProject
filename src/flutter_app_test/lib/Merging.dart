import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Mer extends StatelessWidget {
  static const String id = "Merging";
  int rid;
  Mer({this.rid = 1});

  // 餐廳詳細資訊
  int restId;
  String restName = "";
  String address = "";
  String phoneNumber = "";
  String openTime = "";
  String closeTime = "";

  String test = "";

  Future<List<RestData>> _getData() async {
    var data =
        await http.get("http://ericlion.tw:3000/api/resturant/${this.rid}");
    var jsonData = json.decode(data.body);

    List<RestData> restDatas = [];
    for (var u in jsonData) {
      RestData restData = RestData(u['rest_ID'], u['rest_name'], u['address'],
          u['phoneNumber'], u['opentime'], u['closetime']);
      restDatas.add(restData);
    }
    print("data lenth:");
    print(restDatas.length);

    return restDatas;
  }

  @override
  Widget build(BuildContext context) {
    final _showSnack = () => Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Button tapped'),
          duration: Duration(milliseconds: 500),
        ));

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('餐廳資訊內容'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: _getData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Loading...'),
                    ),
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Container(
                        width: 400,
                        child: FittedBox(
                            child: Image(
                          image: NetworkImage(
                              'http://img.lanimg.com/tuku/yulantu/140804/330797-140P411305089-lp.jpg'),
                        )),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    snapshot.data[0].restName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '★★★★☆',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    snapshot.data[0].address,
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
                                  Icon(
                                    Icons.phone,
                                    size: 15,
                                  ),
                                  Text(
                                    '   ${snapshot.data[0].phone}',
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
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    size: 15,
                                  ),
                                  Text(
                                    '   營業時間: ${snapshot.data[0].opTime} ~ ${snapshot.data[0].clsTime}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              height: 200.0,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  Container(
                                    height: 160.0,
                                    width: 160.0,
                                    child: Image(
                                      image:
                                          AssetImage('sisterimage/image1.png'),
                                    ),
                                  ),
                                  Container(
                                    height: 160.0,
                                    width: 160.0,
                                    child: Image(
                                      image:
                                          AssetImage('sisterimage/image2.png'),
                                    ),
                                  ),
                                  Container(
                                    height: 160.0,
                                    width: 160.0,
                                    child: Image(
                                      image:
                                          AssetImage('sisterimage/image4.png'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: SizedBox(
                          height: 30,
                          width: 500,
                          child: Text(
                            '撰寫評論',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: Colors.black,
                              fontSize: 20.0,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 50,
                                    width: 500,
                                  ),
                                ],
                              )),
                              Container(
                                child: SizedBox(
                                  height: 10,
                                  width: 300,
                                  child: Divider(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 25.0),
                                child: TextField(
                                  maxLines: 6,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  decoration: InputDecoration(
                                      hintText: '輸入內容...',
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                child: ButtonBar(
                                  alignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    RaisedButton(
                                      child: Text('送出'),
                                      color: Colors.amber,
                                      onPressed: _showSnack,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          elevation: 10),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: SizedBox(
                          height: 30,
                          width: 500,
                          child: Text(
                            '評論',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Source Sans Pro',
                              color: Colors.black,
                              fontSize: 20.0,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 25.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage('sisterimage/123.jpg'),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Text('Eric'),
                                    ),
                                    Container(
                                      child: Text(
                                        '★☆☆☆☆',
                                        style: TextStyle(color: Colors.amber),
                                      ),
                                    ),
                                    Container(
                                      child: Text('難吃死了,絕對不會二訪'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          elevation: 10),
                    ],
                  );
                }
              }
              ),
        ),
      ),
    ));
  }
}

class RestData {
  final int restId;
  final String restName;
  final String address;
  final String phone;
  final String opTime;
  final String clsTime;

  RestData(this.restId, this.restName, this.address, this.phone, this.opTime,
      this.clsTime);
}
