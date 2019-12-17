import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Register extends StatelessWidget {
  static const String id = "Register";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('image/background.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(child: Register_()),
        ),
      ),
    );
  }
}

class Register_ extends StatefulWidget {
  @override
  _Register_State createState() => _Register_State();
}

class _Register_State extends State<Register_> {
  DateTime _date = DateTime.now();

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

  String dropdownValue = '生理男性';
  bool checkboxListChecked = false;
  @override
  Widget build(BuildContext context) {
    return Center(
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
              '註冊帳號',
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
                child: TextField(
                  decoration: InputDecoration(
                    //labelText: "帳號",
                    hintText: "輸入帳號...",
                    prefixIcon: Icon(Icons.person),
                    fillColor: Colors.white,
                    filled: true,
                  ),
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
                child: TextField(
                  decoration: InputDecoration(
                    //labelText: "密碼",
                    hintText: "輸入密碼...",
                    prefixIcon: Icon(Icons.lock),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true, //是否是密碼
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
                child: TextField(
                  decoration: InputDecoration(
                    //labelText: "名稱",
                    hintText: "輸入名稱...",
                    prefixIcon: Icon(Icons.border_color),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                elevation: 18,
              ),
            ),
          ),
          Container(
            width: 338,
            child: Card(
              child: new DropdownButtonHideUnderline(
                child: Container(
                  margin: EdgeInsets.only(left: 50),
                  child: new DropdownButton<String>(
                    value: dropdownValue,
                    icon: new Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: new TextStyle(color: Colors.grey),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                        print('$dropdownValue');
                      });
                    },
                    items: <String>['生理男性', '生理女性']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              elevation: 10,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Card(
            child: Container(
              width: 330,
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
                    '選擇您的出生日期',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            elevation: 10,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 63),
            child: CheckboxListTile(
              onChanged: (isCheck) {
                setState(() {
                  checkboxListChecked = isCheck;
                });
              },
              activeColor: Colors.deepOrangeAccent,
              selected: false,
              value: checkboxListChecked,
              title: Text(
                "勾選表示同意我們的使用條款",
                style: TextStyle(fontSize: 12),
              ),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          ButtonTheme(
            minWidth: 100,
            height: 38,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
              //side: BorderSide(color: Colors.red)
            ),
            child: RaisedButton(
                child: Text('註冊', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  print('這裡要保存資料');
                },
                elevation: 30,
                color: Color.fromRGBO(250, 149, 25, 10) //245,211,25
                ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
