import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Page extends StatelessWidget {
  Widget build(BuildContext context) {
    final _showSnack = () => Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Button tapped'),
      duration: Duration(milliseconds: 500),
    ));

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                              textCapitalization: TextCapitalization.sentences,
                              decoration: InputDecoration(
                                  hintText: '輸入內容...', border: InputBorder.none),
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
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 25.0),
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('images/123.jpg'),
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
              ),
            )),
      ),
    );
  }
}
