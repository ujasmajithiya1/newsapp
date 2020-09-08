import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset(
              "asset/mn.PNG",
              height: 398,
              width: 400,
            ),
            Text(
              "there is something news, NDTV",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 55,
            height: 40,
            child: RaisedButton(
              elevation: 0,
              color: Colors.amber,
              shape: CircleBorder(),
              onPressed: () {
                print('object');
              },
              child: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
