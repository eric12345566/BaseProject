import 'package:flutter/material.dart';
import 'Login_page.dart';
import 'Register_Page.dart';
void main() => runApp(Register());

class LauchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:Scaffold(
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  '晚餐食客',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
