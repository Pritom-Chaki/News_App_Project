import 'package:flutter/material.dart';
import 'package:news_app_new/model/news_model.dart';

class NewsDetails extends StatefulWidget {
  final News news;
  NewsDetails({@required this.news});

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  TextStyle myStyle = TextStyle(
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.news.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            //color: Colors.blueAccent,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.news.title,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Publish Date: ',
                      style: myStyle,
                    ),
                    Text(
                      widget.news.date.substring(0, 10),
                      style: myStyle,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Author: ',
                      style: myStyle,
                    ),
                    Text(
                      widget.news.author,
                      style: myStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.white38,
                  height: 250,
                  width: double.infinity,
                  child: Image.network(
                    widget.news.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.news.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
