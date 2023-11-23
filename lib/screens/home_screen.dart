import 'package:flutter/material.dart';
import 'package:news/services/news_service.dart';
import 'package:news/widgets/news_items.dart';

import 'package:news/models/news.dart';

class HomeScreen extends StatelessWidget {
  final NewsService _newsService = NewsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: FutureBuilder(
        future: _newsService.getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<News> newsList = snapshot.data as List<News>;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return NewsItem(news: newsList[index]);
              },
            );
          }
        },
      ),
    );
  }
}
