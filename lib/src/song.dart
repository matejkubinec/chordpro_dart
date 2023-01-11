import 'package:chordpro/src/convert.dart';
import 'package:chordpro/src/utils.dart';

import 'section.dart';
import 'metadata.dart';

class Song {
  Metadata metadata = Metadata();
  List<Section> sections = [];

  Song();

  Song.withMetadata(this.metadata);

  static Song fromChordPro(String content) {
    final song = Song();
    song.metadata = Metadata.fromChordpro(content);

    var contentToParse = content;

    if (song.metadata.hasChordsOverLyrics) {
      contentToParse = convertToChordInLyric(content);
    }

    final rawSections = Utils.getSections(contentToParse);
    song.sections = rawSections.map((s) => Section.fromChordPro(s)).toList();

    return song;
  }
}
