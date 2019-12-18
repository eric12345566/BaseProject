import 'dart:ui' as prefix0;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    final _showSnack = () => Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Button tapped'),
          duration: Duration(milliseconds: 500),
        ));

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[800],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: IconButton(
                  iconSize: 25,
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: _showSnack,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        Icons.casino,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                    Container(
                      child: Text(
                        '晚餐拉霸',
                        style: (TextStyle(
                          fontFamily: 'Source Sans Pro',
                          color: Colors.white,
                          fontSize: 35.0,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.casino,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 51.0),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 145,
                              height: 145,
                              child: Image(
                                image: AssetImage('image/11.jpg'),
                              ),
                            ),
                            Container(
                              width: 145,
                              height: 145,
                              child: Image(
                                image: AssetImage('image/13.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 145,
                              height: 145,
                              child: Image(
                                image: AssetImage('image/12.jpg'),
                              ),
                            ),
                            Container(
                              width: 145,
                              height: 145,
                              child: Image(
                                image: AssetImage('image/14.jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 30.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                '今晚跟誰',
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '吃飯',
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 20,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '?由你決定',
                                style: TextStyle(
                                  fontFamily: 'Source Sans Pro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 30.0),
                        child: Text(
                          '拉霸拉下去,晚餐有人陪',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Source Sans Pro',
                          ),
                        ),
                      ),
                    ],
                  ),
                  elevation: 20),
              Card(
                margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 120.0),
                child: ButtonTheme(
                  minWidth: 150,
                  height: 70,
                  child: RaisedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Icons.casino,
                            size: 28,
                            color: Colors.orange,
                          ),
                        ),
                        Container(
                          child: Text(' 拉下去',
                              style: TextStyle(
                                fontFamily: 'Source Sans Pro',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                    color: Colors.white,
                    onPressed: _showSnack,
                  ),
                ),
              elevation: 10),
            ],
          ),
        ),
      ),
    );
  }
}
