import 'package:flutter/material.dart';
import 'package:news_app_new/model/news_model.dart';
import 'package:news_app_new/network/news_network.dart';

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
                    (News _var) => ListTile(
                      leading: Text("${_var.publisher}"),
                      title: Text(_var.title),
                      subtitle: Text("${_var.id}"),
                      // onTap: () => Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => PostDetail(
                      //       post: post,
                      //     ),
                      //   ),
                      // ),
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
