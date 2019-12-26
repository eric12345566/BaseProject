import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Mer extends StatelessWidget {
  static const String id = "Merging";
  int rid;
  Mer({this.rid = 1});

  Future<List<RestData>> _getData() async {
    var data =
        await http.get("http://ericlion.tw:3000/api/resturant/${this.rid}");
    var jsonData = json.decode(data.body);

    List<RestData> restDatas = [];
    for (var u in jsonData) {
      RestData restData = RestData(
          u['rest_ID'],
          u['rest_name'],
          u['address'],
          u['phoneNumber'],
          u['opentime'],
          u['closetime'],
          u['res_urla'],
          u['res_urlb'],
          u['res_urlc'],
          u['res_urld']);
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
        backgroundColor: Colors.amber.shade700,
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
                        height: 300,
                        child: FittedBox(
                            child: Image(
                          image: NetworkImage(snapshot.data[0].resUrla),
                          fit: BoxFit.cover,
                        )),
                      ),
                      SizedBox(
                        height: 10,
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
                                    padding: EdgeInsets.only(right: 10),
                                    child: Image(
                                      image: NetworkImage(
                                          snapshot.data[0].resUrlb),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 160.0,
                                    width: 160.0,
                                    padding: EdgeInsets.only(right: 10),
                                    child: Image(
                                      image: NetworkImage(
                                          snapshot.data[0].resUrlc),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 160.0,
                                    width: 160.0,
                                    child: Image(
                                      image: NetworkImage(
                                          snapshot.data[0].resUrld),
                                      fit: BoxFit.cover,
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
              }),
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
  final String resUrla;
  final String resUrlb;
  final String resUrlc;
  final String resUrld;

  RestData(this.restId, this.restName, this.address, this.phone, this.opTime,
      this.clsTime, this.resUrla, this.resUrlb, this.resUrlc, this.resUrld);
}
