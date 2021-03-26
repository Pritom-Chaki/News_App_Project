import 'package:flutter/material.dart';
import 'package:news_app_new/model/news_model.dart';

class NewsDetails extends StatelessWidget {
  final News news;
  NewsDetails({@required this.news});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(news.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.red,
            child: Column(
              children: [
                Container(
                  color: Colors.white38,
                  height: 120,
                  width: double.infinity,
                  child: Image.network(
                    news.image,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  news.title,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      news.date.substring(0, 10),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      news.author,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ));
  }
}
