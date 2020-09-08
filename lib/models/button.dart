import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  final String category;
  CostumButton({this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 20),
      height: 50,
      width: 140,
      child: RaisedButton(
        elevation: 0,
        color: Colors.grey[200],
        onPressed: (){},
        child: Text(category,style: TextStyle(color: Colors.grey,fontSize: 16),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        ),
      
    );
  }
}