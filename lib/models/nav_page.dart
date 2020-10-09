import 'package:flutter/material.dart';
import 'package:news/loader/loader.dart';

class NavPage extends StatelessWidget {
  final String newsDec;
  final String imageURL;
  final String title;
  NavPage({this.imageURL, this.newsDec,this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          imageURL == null
              ? SafeArea(
                              child: Center(heightFactor: 2.0,
                                child: Container(
                   // padding: EdgeInsets.only(top: 100),
                    alignment: Alignment.center,
                    child: ColorLoader3()),
                              ),
              )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SafeArea(
                                      child: Image.network(
                      imageURL,
                      //height: 400,
                      width: double.infinity,
                    ),
                  )),
          newsDec == null
              ? Center(heightFactor: 5.0,child: ColorLoader3())
              : Expanded(child: Container(
                  decoration: BoxDecoration(color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.0),
                          topRight: Radius.circular(24.0))),child: Column(
                            children: [
                              SizedBox(height:20.0),
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 16.0,right: 16.0),
                                child: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                               SizedBox(height:20.0),
                              Padding(
                                padding: const EdgeInsets.only(top:10,left: 16.0,right: 16.0),
                                child: Text(newsDec,style: TextStyle(fontSize: 20),),
                              ),
                            ],
                          )))
        ],
      ),
    );
  }
}
