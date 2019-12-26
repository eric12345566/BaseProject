import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'chooserest.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

dynamic output = '可使用';

Future<void> showAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(

        content: const Text('確認要在此店用餐?',style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),),
        actions: <Widget>[
          FlatButton(
            child: Text(
                '確定',
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> Booking()),
              );
              output = "已使用";
            },
          ),
          FlatButton(
            child: Text(
                '取消',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}



class Wait extends StatefulWidget {
  static const String id = "Wait";
  @override
  WaitState createState() => WaitState();
}

class WaitState extends State<Wait> {

  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  /*Future<Null> selectDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2200),
    );

    if(picked != null && picked != _date){
      print('Date selected : ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }*/

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2020),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        print(_date.toString());
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final _showSnack = () =>
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Button tapped'),
            duration: Duration(milliseconds: 500),
          ),
        );

    return MaterialApp(home: Testpage());
  }
}

class Testpage extends StatelessWidget {

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

      backgroundColor: Colors.limeAccent[700],
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
                    onPressed: () async{
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => chooserest()
                          )
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(
                  width: 70,
                ),

                Container(
                  child: Text(
                    '預約等待',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Card(
                  margin: EdgeInsets.fromLTRB(50, 20, 50, 30),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 400,
                        height: 230,
                        child: Image(
                          width: 3,
                          height: 3,
                          image: AssetImage('sisterimage/wait1.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        child: Column(

                          children: <Widget>[
                            Container(
                              width: 400,
                              height: 350,
                              margin: EdgeInsets.only(left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    child: Text(
                                      '拉牙早餐店',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 0.8,
                                    width: 250,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          '店內人數 : ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '30/30',
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontSize: 20,
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          '預估等候 : ',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          '10分鐘',
                                          style: TextStyle(
                                            color: Colors.red[900],
                                            fontSize: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                      width: 250.0,
                                      height: 35.0,
                                      child: Row(
                                        children: <Widget>[
                                          Text('輸入人數: ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:18,
                                              )),
                                          Flexible(
                                            child: TextField(
                                              keyboardType: TextInputType.number,
                                              decoration: InputDecoration(
                                                hintText: '輸入人數...',
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Card(
                                    child: Container(
                                      width: 250,
                                      child: FlatButton(
                                          onPressed: () {
                                            DatePicker.showDatePicker(context,
                                                showTitleActions: true,
                                                minTime: DateTime(1920, 1, 1),
                                                maxTime: DateTime(2019, 12, 31), onChanged: (date) {
                                                  print('change $date');
                                                }, onConfirm: (date) {
                                                  print('confirm $date');
                                                }, currentTime: DateTime.now(), locale: LocaleType.zh);
                                          },
                                          child: Text(
                                            '選擇您的用餐時間',
                                            style: TextStyle(color: Colors.blue),
                                          )),
                                    ),
                                    elevation: 20,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          child: Container(

                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(5),
                                              child: Material(
                                                color: Colors.limeAccent[700], // button color
                                                child: InkWell(
                                                  onTap: () {
                                                    {
                                                      showAlert(context);
                                                    }
                                                  },
                                                  splashColor: Colors.red, // inkwell color
                                                  child: SizedBox(
                                                    width: 100,
                                                    height: 50,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Text(
                                                          '      ',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                        Text(
                                                          '預約',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Container(
                                              child: Material(
                                                color: Colors.grey, // button color
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context)=> Wait()),
                                                    );
                                                  },
                                                  splashColor: Colors.red, // inkwell color
                                                  child: SizedBox(
                                                    width: 100,
                                                    height: 50,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Text(
                                                          '      ',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),

                                                        Text(
                                                          '清除',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),

                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )

                                ],
                              ),
                            )
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
}







class Booking extends StatelessWidget {

  @override

  Widget build (BuildContext context) {
    final _showSnack = () => Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Button tapped'),
        duration: Duration(milliseconds: 500),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.limeAccent[700],
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=> Wait()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Container(
                  child: Text(
                    '預約等待',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Card(
                  margin: EdgeInsets.fromLTRB(50, 20, 50, 30),
                  child: Column(children: <Widget>[
                    Container(
                      width: 430,
                      height: 230,
                      child: Image(
                        width: 3,
                        height: 3,
                        image: AssetImage('sisterimage/wait1.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 400,
                            height: 350,
                            margin: EdgeInsets.only(left: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text(
                                    '拉牙早餐點',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 0.8,
                                  width: 250,
                                  color: Colors.green,
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '店內人數 : ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '30/30',
                                        style: TextStyle(
                                          color: Colors.red[900],
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '預估等候 : ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),

                                      Text(
                                        '10分鐘',
                                        style: TextStyle(
                                          color: Colors.red[900],
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '已預約',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '用餐人數: 10人',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '用餐時段 : 2020/01/11 13:30',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 50),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Material(
                                      color: Colors.grey,
                                      child: InkWell(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context)=> Wait()),
                                          );
                                        },
                                        splashColor: Colors.red, // inkwell color
                                        child: SizedBox(
                                          width: 140,
                                          height: 50,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                '      ',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),

                                              Text(
                                                '取消預約',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
