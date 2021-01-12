import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:nyt_client_bloc_moor/data/model/search_result.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'moor_database.g.dart';

class NYTMainPageTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get url => text()();

  TextColumn get image => text()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [NYTMainPageTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  Future<List<NYTMainPageTableData>> get allEntries =>
      select(nYTMainPageTable).get();

  addAllEntries(SearchResult searchResult) {
    searchResult.items.forEach((element) async {
      await _addEntry(NYTMainPageTableCompanion.insert(
          title: element.title,
          url: element.url,
          image: element.multimedia.avatarUrl));
    });
  }

  Future<void> _addEntry(NYTMainPageTableCompanion entry) {
    return into(nYTMainPageTable).insert(entry);
  }

  deleteAllEntries() async {
    await delete(nYTMainPageTable).go();
  }

  @override
  int get schemaVersion => 1;
}

final database = AppDatabase();
