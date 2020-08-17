import 'dart:io';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 80.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Image.asset(
                  'assets/성서봇로고.png',
                  height: 300,
                )),
            Center(
              child: Text(
                '성서봇',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Center(
              child: Container(
                height: 50,
                width: 250,
                child: RaisedButton(
                  child: Text('인트라넷으로 시작',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                        return Login();
                      }),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userName = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon:  Icon(Icons.arrow_back),
            color: Colors.black54,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            makeRowContainer(true),
            makeRowContainer(false),
            Container(
              child: RaisedButton(
                child: Text('로그인', style: TextStyle(fontSize: 21)),
                onPressed: () {
                  if (userName == 'pletis' && password == 'TJSwk700_') {
                    setState(() {
                      userName = '';
                      password = '';
                    });
                  }
                  else
                    Scaffold.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text('일치하지않습니다.'),));
                },
              ),
              margin: EdgeInsets.only(top: 12),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ));
  }

  Widget makeRowContainer(bool isUserName) {
    return Container(
      child: Row(
        children: <Widget>[
          makeTextField(isUserName),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      padding: EdgeInsets.only(left: 50, right: 0, top: 8, bottom: 8),
    );
  }

  Widget makeTextField(bool isUserName) {
    return Container(
      child: TextField(
        controller: TextEditingController(),
        style: TextStyle(fontSize: 21, color: Colors.black),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black45,
                width: 2.0
            ),
          ),
          contentPadding: EdgeInsets.all(12),
        ),
        onChanged: (String str) {
          if (isUserName)
            userName = str;
          else
            password = str;
        },
      ),
      width: 300,
      padding: EdgeInsets.only(left: 16),
    );
  }
}



