import 'package:flutter/material.dart';
import 'package:news/categories/categories.dart';
import 'package:news/menu.dart';


class Countries extends StatelessWidget  {
   

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
              child: Column(children: [
          ListTile(title: Text("Argentina"),onTap: (){
            Menu(country: "ar",);
          }),
          ListTile(title: Text("Austria"),),
          ListTile(title: Text("Australia"),onTap: (){}),
          ListTile(title: Text("Belgium"),onTap: (){}),
          ListTile(title: Text("Brazil"),onTap: (){}),
          ListTile(title: Text("Bulgaria"),onTap: (){}),
          ListTile(title: Text("Canada"),onTap: (){}),
          ListTile(title: Text("China"),onTap: (){}),
          ListTile(title: Text("Colombia"),onTap: (){}),
          ListTile(title: Text("Cuba"),onTap: (){}),
          ListTile(title: Text("Czech Republic"),onTap: (){}),
          ListTile(title: Text("Egypt"),onTap: (){}),
          ListTile(title: Text("India"),onTap: (){}),
        ]),
      ),
     
    );
  }
}
