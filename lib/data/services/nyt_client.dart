import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nyt_client_bloc_moor/data/model/search_result.dart';
import 'package:nyt_client_bloc_moor/data/model/search_result_error.dart';

class NYTClient {
  final String baseUrl;
  final http.Client httpClient;
  final String key;

  NYTClient(
      {http.Client httpClient,
      this.baseUrl =
          "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=",
      this.key = 'AbbiAsPY0u9qPJAB9GIeR50TOAYZXBdu'})
      : this.httpClient = httpClient ?? http.Client();

  Future<SearchResult> fetchData() async {
    final response = await httpClient.get(Uri.parse("$baseUrl$key"));
    final results = json.decode(response.body);

    if (response.statusCode == 200) {
      return SearchResult.fromJson(results);
    } else {
      throw SearchResultError.fromJson(results);
    }
  }
}
