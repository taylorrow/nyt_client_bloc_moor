import 'package:nyt_client_bloc_moor/data/model/search_result.dart';
import 'package:nyt_client_bloc_moor/data/repository/nyt_repository.dart';

class LoadDataFromNYT {
  final NYTRepository repository = NYTRepository();

  Future<SearchResult> loadData() async {
    final result = await repository.loadData();
    return result;
  }
}