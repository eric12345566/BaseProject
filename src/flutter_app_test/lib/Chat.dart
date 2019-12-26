import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'Home_Page.dart';
import 'MarkPage.dart';

class Chat extends StatelessWidget {
  Widget build(BuildContext context) {
    final _showSnack = () =>
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Button tapped'),
          duration: Duration(milliseconds: 500),
        ));

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Card(
                  child: Container(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: IconButton(
                            iconSize: 20,
                            icon: Icon(Icons.arrow_back_ios),
                            color: Colors.black,
                             onPressed:()async{
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Home_Page(),
                  )
                  );
                  },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 100.0),
                        ),
                        Container(
                          child: Text(
                            'Kiky',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 100.0),
                        ),
                        Container(
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('image/13.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  elevation: 15),
              SizedBox(
                height: 480,
                child: Column(
                  children: <Widget>[
                    Container(
                      //Display on left
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage(
                                    'image/13.jpg',
                                  ),
                                ),
                                Text(
                                  'Kiky',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                          ),
                          Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        "Hello,tea,coffee or me?",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        '12:00 p.m.',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              elevation: 5),
                        ],
                      ),
                    ),
                    Container(
                      //Display on right
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(18.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        "是在哈囉?",
                                        style: TextStyle(
                                          fontSize: 19.0,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        '12:02 p.m.',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              elevation: 5),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage(
                                    'image/123.jpg',
                                  ),
                                ),
                                Text(
                                  'Eric',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
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
                child: Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.black26,
                      thickness: 3.0,
                    ),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            maxLines: 1,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                              hintText: '輸入文字...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _showSnack,
                          color: Colors.amber,
                          icon: Icon(
                            Icons.send,
                            size: 20.0,
                          ),
                        ),
                      ],

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.deepOrangeAccent,
                      child: FlatButton(
                        child: Text('評分這次晚餐',style: TextStyle(color: Colors.white)),
                        onPressed:()async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarkPage()));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



