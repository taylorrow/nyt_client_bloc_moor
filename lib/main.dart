import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/nyt_homepage_bloc.dart';
import 'presentation/ui/home_page.dart';
import 'use_cases/delete_all_data_in_db.dart';
import 'use_cases/load_data_from_db.dart';
import 'use_cases/load_data_from_nyt.dart';
import 'use_cases/load_data_from_nyt_to_moor.dart';

void main() {
  final LoadNYTMainPageFromDB loadNYTMainPageFromDB = LoadNYTMainPageFromDB();
  final LoadDataFromNYT dataFromNYT = LoadDataFromNYT();
  final LoadDataFromNYTToMoor dataFromNYTToMoor = LoadDataFromNYTToMoor();
  final DeleteAllDataInDB deleteAllDataInDB = DeleteAllDataInDB();
  runApp(App(
    dataFromNYT: dataFromNYT,
    dataFromNYTToMoor: dataFromNYTToMoor,
    deleteAllDataInDB: deleteAllDataInDB,
    loadNYTMainPageFromDB: loadNYTMainPageFromDB,
  ));
}

class App extends StatelessWidget {
  final LoadNYTMainPageFromDB loadNYTMainPageFromDB;
  final LoadDataFromNYT dataFromNYT;
  final LoadDataFromNYTToMoor dataFromNYTToMoor;
  final DeleteAllDataInDB deleteAllDataInDB;

  const App(
      {Key key,
      @required this.deleteAllDataInDB,
      this.loadNYTMainPageFromDB,
      this.dataFromNYT,
      this.dataFromNYTToMoor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New York Times Home',
      home: Scaffold(
        appBar: AppBar(title: Text('New York Times Today')),
        body: BlocProvider(
          create: (context) => NYTHomePageBloc(
              dataFromNYT: dataFromNYT,
              dataFromNYTToMoor: dataFromNYTToMoor,
              deleteAllDataInDB: deleteAllDataInDB,
              loadNYTMainPageFromDB: loadNYTMainPageFromDB),
          child: NYTHomePage(),
        ),
      ),
    );
  }
}
