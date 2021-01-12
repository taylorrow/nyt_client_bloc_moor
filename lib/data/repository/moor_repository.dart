import 'package:nyt_client_bloc_moor/data/model/search_result.dart';
import 'package:nyt_client_bloc_moor/data/moor/moor_database.dart';

class MoorRepository {
  sendDataToMoor(SearchResult result) async {
    await database.addAllEntries(result);
  }

  deleteAllDataInDB() async {
    await database.deleteAllEntries();
  }
}
