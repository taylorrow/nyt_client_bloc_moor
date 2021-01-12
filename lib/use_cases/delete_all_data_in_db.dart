import 'package:nyt_client_bloc_moor/data/repository/moor_repository.dart';

class DeleteAllDataInDB {
  final MoorRepository repository = MoorRepository();

  deleteAllDataInDB() async {
    await repository.deleteAllDataInDB();
  }
}
