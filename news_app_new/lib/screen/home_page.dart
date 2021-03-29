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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
            ),
            Text(
              "News",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            )
          ],
        ),
        backgroundColor: Colors.blue,
        // elevation: 0.0,
      ),
      body: FutureBuilder(
        future: newsNetwork.getNews(),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          if (snapshot.hasData) {
            List<News> _news = snapshot.data;
            return ListView(
              children: _news
                  .map(
                    (News _varNews) => InkWell(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: 220,
                        width: double.infinity,
                        color: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white38,
                              height: 120,
                              width: double.infinity,
                              child: Image.network(
                                _varNews.image,
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              _varNews.title,
                              //  maxLines: 4,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
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
