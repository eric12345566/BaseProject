import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                                  image: AssetImage('restimage/image1.png'),
                                ),
                              ),
                              Container(
                                height: 160.0,
                                width: 160.0,
                                child: Image(
                                  image: AssetImage('restimage/image2.png'),
                                ),
                              ),
                              Container(
                                height: 160.0,
                                width: 160.0,
                                child: Image(
                                  image: AssetImage('restimage/image4.png'),
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
        ));
  }
}
