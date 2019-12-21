import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Login_page.dart';
import 'Register_Page.dart';
import 'Home_Page.dart';
import 'DinnerCard.dart';
import 'Mission_Page.dart';

void main() => runApp(Mission_Page());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(home: Login_page(), routes: {
        Home_Page.id: (context) => Home_Page(),
        Register.id: (context) => Register(),
        DinnerCard.id: (context) => DinnerCard(),
      }),
    );
  }
}

class Data extends ChangeNotifier {
  Map data = {'user': 'Frank Abignale', 'password': '12112'};
  Map token = {'token': 'null'};
  void updateAccount(input) {
    data = input;
    notifyListeners();
  }
}
