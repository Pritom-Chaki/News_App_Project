import 'package:flutter/material.dart';

class News {
  String id;
  String url;
  String title;
  String text;
  String publisher;
  String author;
  String image;
  String date;

  News(
      {@required this.id,
      @required this.url,
      @required this.title,
      @required this.text,
      @required this.publisher,
      @required this.author,
      @required this.image,
      @required this.date});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json["id"] as String,
      url: json["url"] as String,
      title: json["title"] as String,
      text: json["text"] as String,
      publisher: json["publisher"] as String,
      author: json["author"] as String,
      image: json["image"] as String,
      date: json["date"] as String,
    );
  }
}
