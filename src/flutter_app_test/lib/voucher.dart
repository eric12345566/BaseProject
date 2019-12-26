import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class Voucher_home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home:Voucher()
    );
  }
}


class Voucher extends StatefulWidget {
  @override
  _VoucherState createState() => _VoucherState();
}

dynamic output = '可使用';
int flag;

Future<void> showAlert(BuildContext context) {
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
        content: const Text('使用優惠卷',style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),),
        actions: <Widget>[
          FlatButton(
            child: Text('確定'),
            onPressed: () {
              Navigator.of(context).pop();
              output = "已使用";
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


class _VoucherState extends State<Voucher> {

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
    return  Scaffold(
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
                    onPressed: () {}),
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
      floatingActionButton: FloatingActionButton(onPressed: null),
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
                    onPressed:(){

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
                  onTap: ()  {
                    {
                      showAlert(context);
                      setState(() {
                      });
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: AssetImage('sisterimage/image.png'),
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
                              child: Text('$output'),

                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
