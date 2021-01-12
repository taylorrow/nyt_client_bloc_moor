import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_client_bloc_moor/data/moor/moor_database.dart';
import 'package:nyt_client_bloc_moor/presentation/bloc/nyt_homepage_bloc.dart';
import 'package:nyt_client_bloc_moor/presentation/bloc/nyt_homepage_event.dart';
import 'package:nyt_client_bloc_moor/presentation/bloc/nyt_homepage_state.dart';
import 'package:url_launcher/url_launcher.dart';

class NYTHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NYTHomePageBloc _githubSearchBloc =
        BlocProvider.of<NYTHomePageBloc>(context);
    _githubSearchBloc.add(LoadNYTMainPage());
    return BlocBuilder<NYTHomePageBloc, NYTLoadHomePageState>(
      bloc: BlocProvider.of<NYTHomePageBloc>(context),
      builder: (BuildContext context, NYTLoadHomePageState state) {
        if (state is NYTLoadHomePageStateSuccess) {
          return state.items.isEmpty
              ? Text('No Results')
              : _SearchResults(items: state.items);
        }
        if (state is NYTLoadHomePageStateLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is NYTLoadHomePageStateError) {
          return Text(state.error);
        }
      },
    );
  }
}

class _SearchResults extends StatelessWidget {
  final List<NYTMainPageTableData> items;

  const _SearchResults({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<NYTHomePageBloc>(context).add(UpdateNYTMainPage());
      },
      child: GridView.builder(
          itemCount: items.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              childAspectRatio: 0.9,
              mainAxisSpacing: 4),
          itemBuilder: (BuildContext context, int index) {
            return _SearchResultItem(item: items[index], index: index);
          }),
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final NYTMainPageTableData item;
  final int index;

  const _SearchResultItem({Key key, @required this.item, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
          color: Colors.black.withOpacity(0.6),
          child: Text(
            '${item.title}',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
      child: InkResponse(
        enableFeedback: true,
        child: Image.network(
          item.image,
          fit: BoxFit.cover,
        ),
        onTap: () async {
          if (await canLaunch(item.url)) {
            await launch(item.url);
          }
        },
        highlightShape: BoxShape.circle,
      ),
    );
  }
}

// class _SearchResults extends StatelessWidget {
//   final List<NYTMainPageTableData> items;
//
//   const _SearchResults({Key key, this.items}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: ((){
//         BlocProvider.of<NYTHomePageBloc>(context).add(UpdateNYTMainPage());
//       }),
//       child: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (BuildContext context, int index) {
//           return _SearchResultItem(
//             item: items[index],
//             index: index,
//           );
//         },
//       ),
//     );
//   }
// }

// class _SearchResultItem extends StatelessWidget {
//   final NYTMainPageTableData item;
//   final int index;
//
//   const _SearchResultItem({Key key, @required this.item, this.index})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // print('image-$index-${item.image}');
//     return Card(
//       child: ListTile(
//         trailing: CircleAvatar(
//           child: Image.network(
//             item.image,
//             height: 150,
//             width: 100,
//             fit: BoxFit.cover,
//           ),
//         ),
//         title: Text('${index + 1}. ${item.title}'),
//         onTap: () async {
//           if (await canLaunch(item.url)) {
//             await launch(item.url);
//           }
//         },
//       ),
//     );
//   }
// }
