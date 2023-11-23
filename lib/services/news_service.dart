import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/news.dart';

class NewsService {
  final String apiKey = 'afa86666892f455bb805fcc70ae0a4fc';
  final String baseUrl = 'https://newsapi.org/v2/everything?q=apple&from=2023-11-22&to=2023-11-22&sortBy=popularity&apiKey=afa86666892f455bb805fcc70ae0a4fc';

  Future<List<News>> getNews() async {
    final response = await http.get(Uri.parse('$baseUrl?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['articles'];
      return data.map((item) => News.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
