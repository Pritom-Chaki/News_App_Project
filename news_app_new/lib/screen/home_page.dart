import 'package:flutter/material.dart';
import 'package:news_app_new/model/news_model.dart';
import 'package:news_app_new/network/news_network.dart';
import 'package:news_app_new/screen/news_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NewsNeteork newsNetwork = NewsNeteork();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP"),
      ),
      body: FutureBuilder(
        future: newsNetwork.getNews(),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasData) {
            List<News> _news = snapshot.data;
            return ListView(
              children: _news
                  .map(
                    (News _varNews) => ListTile(
                      leading: Text("${_varNews.publisher}"),
                      title: Text(_varNews.title),
                      subtitle: Text("${_varNews.id}"),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NewsDetails(
                            news: _varNews,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
