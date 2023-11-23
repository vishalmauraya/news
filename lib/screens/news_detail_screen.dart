import 'package:flutter/material.dart';
import 'package:news/models/news.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(news.url)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
      ),
    );
  }
}

