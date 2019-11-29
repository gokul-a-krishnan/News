import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:study_monk/config/config.dart';

class NewsApi {
  String baseUrl =
      'https://newsapi.org/v2/everything?apiKey=' + Config.newsApiKey;
  String url;

  Future<List> loadNews(String topic) async {
    url = baseUrl + '&q=$topic';
    try {
      http.Response response = await http.get(url);
      const JsonDecoder decoder = const JsonDecoder();
      //we need only articles
      return decoder.convert(response.body)['articles'];
    } on Exception catch (_) {
      return null;
    }
  }
}
