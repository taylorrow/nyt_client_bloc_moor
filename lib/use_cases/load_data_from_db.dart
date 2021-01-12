import 'package:nyt_client_bloc_moor/data/moor/moor_database.dart';

class LoadNYTMainPageFromDB {
  Future<List<NYTMainPageTableData>> get mainPageList => database.allEntries;
}
