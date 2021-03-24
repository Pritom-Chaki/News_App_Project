import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app_new/model/news_model.dart';

class NewsNeteork {
  final String newsURL =
      "https://run.mocky.io/v3/46377726-22a1-414a-80b5-5544fc72a1a3";

  Future<List<News>> getNews() async {
    Response res = await get(Uri.parse(newsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<News> _news = body
          .map(
            (dynamic item) => News.fromJson(item),
          )
          .toList();

      return _news;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
