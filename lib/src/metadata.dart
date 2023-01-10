import 'dart:convert';

import 'utils.dart';

class Metadata {
  String? title;
  String? artist;

  static Metadata fromChordpro(String content) {
    final lines = LineSplitter().convert(content);
    final metadata = Metadata();

    for (var line in lines) {
      if (Utils.isDirective(line, 'artist')) {
        metadata.artist = Utils.valueFromDirective(line);
      }

      if (Utils.isDirective(line, 'title')) {
        metadata.title = Utils.valueFromDirective(line);
      }
    }

    return metadata;
  }
}
