import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class News {
  String id;
  String url;
  String title;
  String text;
  String publisher;
  String author;
  String image;
  String date;

  News(this.id, this.url, this.title, this.text, this.publisher, this.author,
      this.image, this.date);
  News.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    url = json["url"];
    title = json["title"];
    text = json["text"];
    publisher = json["publisher"];
    author = json["author"];
    image = json["image"];
    date = json["date"];
  }
}

///New Class....................................................................

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}

///Home Class...................................................................
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<News> _news = [];
  static List<News> _newsInApp = [];

  Future<List<News>> comingNews() async {
    var url = 'http://www.mocky.io/v2/5ecfddf13200006600e3d6d0';

    var response = await http.get(Uri.parse(url));
//Error Message: The argument type 'String' can't be assigned
// to the parameter type 'Uri'.

    var news = <News>[];

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        news.add(News.fromJson(noteJson));
      }
    }

    return news;
  }

  @override
  void initState() {
    super.initState();
    comingNews().then((value) {
      setState(() {
        _news.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(97),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Colors.white,
                  ),
                ),
              ),
              child: AppBar(
                title: Text(
                  'News',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _listItem(index);
        },
        itemCount: _newsInApp.length,
      ),
    );
  }

  _listItem(index) {
    return Container(
      //color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 1, right: 1, bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      _newsInApp[index].title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      iconSize: 16,
                      color: Colors.black26,
                      alignment: Alignment.bottomCenter,
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () => {},
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
