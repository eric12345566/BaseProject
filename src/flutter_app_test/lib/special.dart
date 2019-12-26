import 'package:flutter/material.dart';
import 'Home_Page.dart';

void main() => runApp(MaterialApp(
      home: Special(),
    ));

//創建第一頁
class Special extends StatefulWidget {
  static const String id = "special";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Special> {
  var val = 0.0;
  var percent = 0;
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  bool _isButtonDisabled = true;

  void _incrementCounter() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SecondView();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepOrange,
          child: Container(
            margin: EdgeInsets.only(left: 65),
            child: Row(
              children: <Widget>[
                Container(
                  child: IconButton(
                      icon: Icon(
                        Icons.view_list,
                        size: 45,
                        color: Colors.white,
                      ),
                    onPressed: (){
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => Home_Page()));
                    },),
                ),
                SizedBox(
                  height: 70,
                  width: 155,
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.card_giftcard,
                      size: 45,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SecondView();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.orange[800],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: IconButton(
                        iconSize: 25,
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home_Page()));
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              '特別任務',
                              style: (TextStyle(
                                fontFamily: 'Source Sans Pro',
                                color: Colors.white,
                                fontSize: 26.0,
                                letterSpacing: 2.5,
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image(
                            image: AssetImage('image/egg.png'),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          child: Text(
                            '吃十顆蛋',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 20.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '難度 : ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                '★★★★☆',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.amber,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20.0),
                              ),
                              Text(
                                '期限:8/10~12/10',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: SizedBox(
                            height: 10,
                            width: 220,
                            child: Divider(
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            '吃個十顆蛋，然後拍個照分享一下，即可獲得優惠券。',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Text(
                            '進度 : $percent%',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          child: Card(
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey[200],
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.amber),
                                value: val,
                              ),
                              elevation: 10.0),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Card(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  child: Checkbox(
                                    value: wedVal,
                                    onChanged: (bool value) {
                                      setState(() {
                                        wedVal = value;
                                        val = val + 0.33;
                                        percent = percent + 33;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text(
                                    '累積吃三顆蛋',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            elevation: 10.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Card(
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  child: Checkbox(
                                    value: monVal,
                                    onChanged: (bool value) {
                                      setState(() {
                                        monVal = value;
                                        val = val + 0.33;
                                        percent = percent + 33;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Text(
                                    '累積吃六顆蛋',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            elevation: 10.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          child: Card(
                              color: Colors.white,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    child: Checkbox(
                                      value: tuVal,
                                      onChanged: (bool value) {
                                        setState(() {
                                          tuVal = value;
                                          val = val + 0.34;
                                          percent = percent + 34;
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    child: Text(
                                      '累積吃十顆蛋',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 10.0),
                        ),
                        Container(
                          margin: EdgeInsets.all(35.00),
                          alignment: Alignment.center,
                          child: Container(
                            child: Row(
                              children: <Widget>[
                                ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 100.0,
                                      height: 60.0,
                                      child: _buildCounterButton(),
                                    ),
                                  ],
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 100.0,
                                      height: 60.0,
                                      child: RaisedButton(
                                        child: Text('放棄任務',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        color: Colors.black54,
                                        onPressed: () {
                                          {
                                            Del(context);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    elevation: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCounterButton() {
    if (percent >= 100) {
      _isButtonDisabled = false;
    }
    return new RaisedButton(
      color: Colors.amber,
      child: new Text(_isButtonDisabled ? "尚未完成" : "完成任務"),
      onPressed: _isButtonDisabled ? null : _incrementCounter,
    );
  }

  Del(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '提醒',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          content: const Text(
            '確定要放棄任務?放棄後即不可參加',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('確定'),
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home_Page()));
              },
            ),
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

//全域變數
dynamic output = '可使用';
int flag = 0;

//使用優惠

//創建第二頁
class SecondView extends StatelessWidget {
  Text state(int flag) {
    if (flag == 0) {
      output = Text(
        '可使用',
        style: TextStyle(
          color: Colors.green,
          fontSize: 15,
        ),
      );
    } else if (flag == 1) {
      output = Text(
        '已使用',
        style: TextStyle(
          color: Colors.black26,
          fontSize: 15,
        ),
      );
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.black26,
        child: Container(
          margin: EdgeInsets.only(left: 65),
          child: Row(
            children: <Widget>[
              Container(
                child: IconButton(
                    icon: Icon(
                      Icons.view_list,
                      size: 45,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home_Page()));
                    }),
              ),
              SizedBox(
                height: 70,
                width: 155,
              ),
              Container(
                child: IconButton(
                    icon: Icon(
                      Icons.card_giftcard,
                      size: 45,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Special();
                      }));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                Container(
                  child: Text(
                    '優惠卷',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Card(
                child: InkWell(
                  onTap: () {
                    {
                      showAlert(context);
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Flexible(
                          child: Image(
                            image: AssetImage('image/egg1.png'),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Text(
                                '免費十顆蛋',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '期限 :2019-12-31',
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '店家 : 張三漢堡',
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(' $output '),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  showAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '是否要',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          content: const Text(
            '使用優惠卷',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('確定'),
              onPressed: () {
                output = '已使用';
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Home_Page()),
                    (Route<dynamic> route) => false);
              },
            ),
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
