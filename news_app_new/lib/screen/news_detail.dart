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
      body: Container(
        height: 50.0,
        color: Colors.red,
      ),
    );
  }
}
