import 'package:flutter/material.dart';
import 'package:news/categories/categories.dart';
import 'package:news/menu.dart';
import 'package:news/models/button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text("Browse News",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0)),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Menu(),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CostumButton(
                     category: "Business",
                     route: Categories(id: 1,),
                   ),
                   CostumButton(
                     category: "Sports",
                     route: Categories(id: 2),
                   ),
                   CostumButton(
                     category: "Politics",
                     route: Categories(id: 3),
                   ),
                   CostumButton(
                     category: "Entertainment",
                     route: Categories(id: 4),
                   ),
                   CostumButton(
                     category: "Technology",
                     route: Categories(id: 5),
                   ),
                   CostumButton(
                     category: "Health",
                     route: Categories(id: 6),
                   ),
                   CostumButton(
                     category: "Science",
                     route: Categories(id: 7),
                   )
                    ],
                  )
                  )
              ],
            ),
          );
  }
}