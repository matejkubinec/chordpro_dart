import 'dart:convert';

import 'constants.dart';
import 'utils.dart';

class Metadata {
  String? title;
  String? artist;
  bool hasChordsOverLyrics = false;

  static Metadata fromChordpro(String content) {
    final lines = LineSplitter().convert(content);
    final metadata = Metadata();

    if (content.contains(CHORDS_OVER_LYRIC_DIRECTIVE)) {
      metadata.hasChordsOverLyrics = true;
    }

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
