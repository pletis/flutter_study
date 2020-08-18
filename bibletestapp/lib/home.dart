import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black54,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(
              'assets/성서봇로고.png',
              height: 110,
            ),
            SizedBox(
              height: 20,
            ),
            makeRowContainer(true),
            makeRowContainer2(false),
            SizedBox(
              height: 20
            ),
            Container(
              width: 330,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                color: Colors.lightBlue,
                child: Text('로그인',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                onPressed: () {
                  if (userName == 'pletis' && password == 'TJSwk700_') {
                    setState(() {
                      userName = '';
                      password = '';
                    });
                  } else
                    Scaffold.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        content: Text('일치하지않습니다.'),
                      ));
                },
              ),
            ),
          ],
        )
    );
  }

  Widget makeRowContainer(bool isUserName) {
    return Container(
      child: Row(
        children: <Widget>[
          makeTextField(isUserName),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      padding: EdgeInsets.only(left: 43, right: 0, top: 8, bottom: 8),
    );
  }

  Widget makeRowContainer2(bool isUserName) {
    return Container(
      child: Row(
        children: <Widget>[
          makeTextField2(isUserName),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      padding: EdgeInsets.only(left: 43, right: 0, top: 8, bottom: 8),
    );
  }

  Widget makeTextField(bool isUserName) {
    return Container(
      child: TextField(
        controller: TextEditingController(),
        style: TextStyle(fontSize: 21, color: Colors.black),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: ("아이디 입력"),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45, width: 1.0),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        onChanged: (String str) {
          if (isUserName)
            userName = str;
          else
            password = str;
        },
      ),
      width: 330,
      height: 60,
    );
  }

  Widget makeTextField2(bool isUserName) {
    return Container(
      child: TextField(
        controller: TextEditingController(),
        style: TextStyle(fontSize: 21, color: Colors.black),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: ("비밀번호 입력"),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black45, width: 1.0),
          ),
          contentPadding: EdgeInsets.all(18),
        ),
        onChanged: (String str) {
          if (isUserName)
            userName = str;
          else
            password = str;
        },
      ),
      width: 330,
      height: 60,
    );
  }
}
