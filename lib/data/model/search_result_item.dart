import 'multimedia_result.dart';

class SearchResultItem {
  final String title;
  final String url;
  final MultimediaResult multimedia;

  const SearchResultItem({this.title, this.multimedia, this.url});

  static SearchResultItem fromJson(dynamic json) {
    return SearchResultItem(
      title: json['title'] as String,
      url: json['url'] as String,
      multimedia: MultimediaResult.fromJson(json['multimedia']),
    );
  }
}
