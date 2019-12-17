import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'main.dart';
import 'Home_Page.dart';

class Login_page extends StatelessWidget {
  static const String id = "Login_page";

  static final formKey = GlobalKey<FormState>();
  Map data = {'user': String, 'password': String};

  _makeGetRequest() async {
    // make GET request
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Response response = await get(url);
    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    Map<String, dynamic> map = jsonDecode(json);
    print(map);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('image/background.png'),
                    fit: BoxFit.cover)),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Image.asset(
                        'image/Logo_01.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '登入帳號',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.5,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: TextFormField(
                            decoration: InputDecoration(
                              //labelText: "帳號",
                              hintText: "輸入帳號...",
                              prefixIcon: Icon(Icons.person),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            onSaved: (input) => data['user'] = input,
                          ),
                          elevation: 18,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: TextFormField(
                            decoration: InputDecoration(
                              //labelText: "密碼",
                              hintText: "輸入密碼...",
                              prefixIcon: Icon(Icons.lock),
                              fillColor: Colors.white,
                              filled: true,
                            ),
                            obscureText: true,
                            //是否是密碼
                            onSaved: (input) => data['password'] = input,
                          ),
                          elevation: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            child: Text('忘記密碼'),
                            onPressed: () {
                              print('這裡要接忘記密碼頁面');
                            },
                          ),
                          FlatButton(
                            child: Text('註冊帳號'),
                            onPressed: () {
                              print('這裡要接註冊帳號頁面');
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ButtonTheme(
                      minWidth: 100,
                      height: 38,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        //side: BorderSide(color: Colors.red)
                      ),
                      child: RaisedButton(
                          child:
                              Text('登入', style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            formKey.currentState.save();
                            Provider.of<Data>(context).updateAccount(data);
                            formKey.currentState.reset();
                            Navigator.pushNamed(context, Home_Page.id);
                            print('press login');
                            _makeGetRequest();
                          },
                          elevation: 30,
                          color: Color.fromRGBO(250, 149, 25, 10) //245,211,25
                          ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
