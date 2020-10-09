import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import './models/news_api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import './loader/loader.dart';
import './models/nav_page.dart';
import './models/costant.dart';
class Menu extends StatefulWidget {
    String country;
  Menu({this.country});
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  Future<List<NewsApi>> getData() async {

    if(widget.country==null){
      widget.country="in";
    }
    List<NewsApi> list;
    String link =
        "https://newsapi.org/v2/top-headlines?country=${widget.country}&apiKey=40969ceac9214cb19ea18027d8077d49";
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
    return FutureBuilder(
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
                                          imageURL:
                                              snapshot.data[index].urlToImage,
                                          newsDec:
                                              snapshot.data[index].description,
                                          title: 
                                              snapshot.data[index].title,
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
                                      snapshot.data[index].urlToImage == null
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
                                            color: Colors.black, fontSize: 20),
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
        });
  }
}
