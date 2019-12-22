import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class Mer extends StatelessWidget {

  static const String id = "Merging";

  Widget build(BuildContext context) {
    final _showSnack = () => Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Button tapped'),
      duration: Duration(milliseconds: 500),
    ));
    return MaterialApp(

        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white30,
            title: Text('餐廳資訊內容'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
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
                                '張三漢堡',
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
                          child: Row(
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
                          child: Row(
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
                                  image: AssetImage('sisterimage/image1.png'),
                                ),
                              ),
                              Container(
                                height: 160.0,
                                width: 160.0,
                                child: Image(
                                  image: AssetImage('sisterimage/image2.png'),
                                ),
                              ),
                              Container(
                                height: 160.0,
                                width: 160.0,
                                child: Image(
                                  image: AssetImage('sisterimage/image4.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                              backgroundImage: AssetImage('sisterimage/123.jpg'),
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
            ),
          ),
        ));
  }
}


