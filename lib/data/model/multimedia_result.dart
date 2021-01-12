class MultimediaResult {
  final String avatarUrl;

  const MultimediaResult({this.avatarUrl});

  static MultimediaResult fromJson(dynamic json) {
    String result;
    bool isFind = false;
    json.forEach((element) {
      if (element['format'] == 'Normal') {
        result = element['url'] as String;
        isFind = true;
      }
    });
    if (isFind) {
      return MultimediaResult(avatarUrl: result);
    } else {
      return MultimediaResult(avatarUrl: 'no image');
    }
  }
}
