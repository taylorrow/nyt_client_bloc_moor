import 'package:nyt_client_bloc_moor/data/model/search_result.dart';
import 'package:nyt_client_bloc_moor/data/services/nyt_client.dart';

class NYTRepository {
  final NYTClient client = NYTClient();

  Future<SearchResult> loadData() async {
    final result = await client.fetchData();
    return result;
  }
}
