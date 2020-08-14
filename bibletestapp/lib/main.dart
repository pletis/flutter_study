import 'dart:io';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title:  '성서봇',
    home:  First(),
  ));
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 80.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/성서봇로고.png'),
                radius: 100.0,
                backgroundColor: Colors.white,
              ),
            ),
            Center(
              child: Text('성서봇',
              style: TextStyle(
                fontWeight:  FontWeight.bold,
                fontSize: 35,
                color: Colors.blue
              ),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Center(
              child: RaisedButton(
                child: Text('인트라넷으로 시작',style: TextStyle(
                    fontSize: 20,
                  color: Colors.white
                )),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.all(
                    Radius.circular(10.0)
                  ),
                ),
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute<void>(builder: (BuildContext context){
                    return Second();
                  }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black54,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(

        child: Column(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/성서봇로고.png'),
              radius: 50.0,
              backgroundColor: Colors.white,
            ),

          ],
        ),
      ),
    );
  }
}

