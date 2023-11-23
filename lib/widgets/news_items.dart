import 'package:flutter/material.dart';
import 'package:news/models/news.dart';
import 'package:news/screens/news_detail_screen.dart';  // Import the NewsDetailScreen class


class NewsItem extends StatelessWidget {
  final News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(news.title),
      subtitle: Text(news.description),
      leading: Image.network(news.imageUrl),
      onTap: () {
        // Navigate to news detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailScreen(news: news),
          ),
        );
      },
    );
  }
}
