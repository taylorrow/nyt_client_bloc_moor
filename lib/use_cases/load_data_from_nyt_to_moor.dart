import 'package:nyt_client_bloc_moor/data/model/search_result.dart';
import 'package:nyt_client_bloc_moor/data/repository/moor_repository.dart';

class LoadDataFromNYTToMoor {
  final MoorRepository repository = MoorRepository();

  sendDataToMoor(SearchResult result) async {
    await repository.sendDataToMoor(result);
  }
}
