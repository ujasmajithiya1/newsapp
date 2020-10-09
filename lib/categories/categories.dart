import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news/loader/loader.dart';
import 'package:news/models/costant.dart';
import 'package:news/models/country_info.dart';

import 'package:news/models/nav_page.dart';
import 'package:news/models/news_api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class Categories extends StatefulWidget {
  final int id;
  
  Categories({Key key, this.id}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
   int _selectedIndex = 0;
   String category;
   String title; 
  
  Future<List<NewsApi>> getData() async {
    if (widget.id==1) {
      category="Business";
      title="Business";
    } else if (widget.id==2){
      category="Sports";
      title="Sports";
    } else if (widget.id==3){
      category="politics";
      title="Politics";
    } else if (widget.id==4){
      category="entertainment";
      title="Entertainment";
    } else if (widget.id==5){
      category="technology";
      title="Technology";
    } else if (widget.id==6){
      category="health";
      title="Health";
    } else if (widget.id==7){
      category="science";
      title="Science";
    }


    // if(widget.countryId==1){
    //   country="ar";
    // }
    // else if(widget.countryId==2){
    //   country="at";
    // }
    // else if(widget.countryId==3){
    //   country="au";
    // }
    // else if(widget.countryId==4){
    //   country="be";
    // }
    // else if(widget.countryId==5){
    //   country="br";
    // }
    // else if(widget.countryId==6){
    //   country="bg";
    // }
    // else if(widget.countryId==7){
    //   country="ca";
    // }
    // else if(widget.countryId==8){
    //   country="cn";
    // }
    // else if(widget.countryId==9){
    //   country="co";
    // }
    // else if(widget.countryId==10){
    //   country="cu";
    // }
    // else if(widget.countryId==11){
    //   country="cz";
    // }
    // else if(widget.countryId==12){
    //   country="eg";
    // }
    // else if(widget.countryId==13){
    //   country="in";
    // }
    List<NewsApi> list;
    String link =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=40969ceac9214cb19ea18027d8077d49";
    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["articles"] as List;
      list = rest.map<NewsApi>((json) => NewsApi.fromJson(json)).toList();
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text(title,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0)),
                ),
                SizedBox(height: 32.0,),
        FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? Container(
                      height: 560.0,
                      child: Swiper(
                        viewportFraction: 0.65,
                        scale: 0.7,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NavPage(
                                              imageURL: snapshot
                                                  .data[index].urlToImage,
                                              newsDec: snapshot
                                                  .data[index].description,
                                              title: snapshot.data[index].title,
                                            )),
                                  );
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          snapshot.data[index].urlToImage ==
                                                  null
                                              ? nullImage
                                              : snapshot.data[index].urlToImage,
                                          fit: BoxFit.fill,
                                          height: 400.0,
                                          width: 300.0,
                                        ),
                                      ),
                                      Container(
                                        width: 400.0,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0, top: 5.0),
                                          child: Text(
                                            snapshot.data[index].title,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ))
                  : Container(
                      height: 560,
                      alignment: Alignment.center,
                      child: ColorLoader3());
            }),
      ]),
       bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.amber,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              duration: Duration(milliseconds: 800),
              tabBackgroundColor: Colors.white,
              tabs: [
                GButton(
                  iconColor: Colors.grey,
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  iconColor: Colors.grey,
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
                GButton(
                  iconColor: Colors.grey,
                  icon: LineIcons.bookmark,
                  text: 'Saved',
                ),
                GButton(
                  iconColor: Colors.grey,
                  icon: LineIcons.globe,
                  text: 'Country',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
