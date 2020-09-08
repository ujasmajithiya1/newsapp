import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news/models/button.dart';
import 'package:news/cards.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 500,
            padding: const EdgeInsets.only(left: 32),
            child: Swiper(
              viewportFraction: 0.7,
              scale: 0.6,
              itemCount: 3,
              itemBuilder: (context, int) {
                return Cards();
              },
            )),
            SizedBox(height: 40,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
                  child: Row(
            
            children: <Widget>[
             CostumButton(
               category: "Business",
             ),
             CostumButton(
               category: "Sports",
             ),
             CostumButton(
               category: "Politics",
             ),
             CostumButton(
               category: "Entertainment",
             ),
             CostumButton(
               category: "Technology",
             ),
             CostumButton(
               category: "Health",
             ),
             CostumButton(
               category: "Science",
             )
            ],
          ),
        )
      ],
    );
  }
}
