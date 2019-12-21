import 'package:flutter/material.dart';

class Mission_Page extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Container(
                  child: Text('特別任務喔'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
