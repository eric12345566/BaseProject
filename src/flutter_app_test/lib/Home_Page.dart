import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';
import 'DinnerCard.dart';

class Home_Page extends StatelessWidget {
  static const String id = "Home_Page";

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
                        onPressed: () {Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DinnerCard()));},
                      ),
                      FlatButton(
                        child: Image.asset('image/IconCard.png'),
                        onPressed: () {},
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '凱恩斯咖啡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '輕鬆/咖啡/適合聊天',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/ham.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '張三漢堡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '聚會/啤酒/美式餐點',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '凱恩斯咖啡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '輕鬆/咖啡/適合聊天',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '凱恩斯咖啡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '輕鬆/咖啡/適合聊天',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '凱恩斯咖啡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '輕鬆/咖啡/適合聊天',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment(-0.835, 0),
                  child: Text(
                    '今日熱門',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '凱恩斯咖啡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '輕鬆/咖啡/適合聊天',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/ham.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '張三漢堡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '聚會/啤酒/美式餐點',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '凱恩斯咖啡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '輕鬆/咖啡/適合聊天',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '凱恩斯咖啡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '輕鬆/咖啡/適合聊天',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                      Container(
                        width: 160.0,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Card(
                          child: InkWell(
                            onTap: () async {},
                            child: Column(
                              children: <Widget>[
                                Image.asset('image/coffee.png',
                                    fit: BoxFit.fitWidth),
                                SizedBox(height: 8.50),
                                Container(
                                    alignment: Alignment(-0.8, 10),
                                    child: Text(
                                      '凱恩斯咖啡',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    )),
                                SizedBox(height: 8.50),
                                Container(
                                    child: Text(
                                  '輕鬆/咖啡/適合聊天',
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                          elevation: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
