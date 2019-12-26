import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DinnerCard.dart';

void main() {
  runApp(
    Meeting(),
  );
}

class Meeting extends StatelessWidget {

  static const String id = "Meeting";

  @override
  Widget build(BuildContext context) {
    final _showSnack = () => Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Button tapped'),
          duration: Duration(milliseconds: 500),
        ));

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => DinnerCard()));
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 30.0,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 100),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.casino,
                        color: Colors.white,
                        size: 35,
                      ),
                      Text(
                        '晚餐拉霸',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.casino,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
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
                            height: 400,
                            child: Image(
                              width: 3,
                              height: 3,
                              image: AssetImage('sisterimage/sister.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Kiky',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(
                                        '逢甲大學 行銷系 21歲',
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
                                      Text(
                                        '喜歡吃 : 火鍋、焗烤、披薩',
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
                                      Text(
                                        '拉霸評價 : 4.5分',
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 20, 0, 50),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Container(

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Material(
                              color: Colors.white, // button color
                              child: InkWell(
                                splashColor: Colors.red, // inkwell color
                                child: SizedBox(
                                  width: 90,
                                  height: 70,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '  ',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Icon(
                                        Icons.done,
                                        color: Colors.green,
                                        size: 20,
                                      ),
                                      Text(
                                        '接受',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Container(

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            child: Material(
                              color: Colors.white, // button color
                              child: InkWell(
                                splashColor: Colors.red, // inkwell color
                                child: SizedBox(
                                  width: 90,
                                  height: 70,
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        '  ',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Icon(
                                        Icons.clear,
                                        color: Colors.red,
                                        size: 20,
                                      ),
                                      Text(
                                        '拒絕',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  final snackBar =
                                      new SnackBar(content: new Text("Tap"));
                                  Scaffold.of(context).showSnackBar(snackBar);
                                },
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
          ),
        ),

      ),
    );
  }
}



