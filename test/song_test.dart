import 'package:chordpro/src/song.dart';
import 'package:test/test.dart';

void main() {
  group('Song', () {
    test('empty song', () {
      final content = '';
      final result = Song.fromChordPro(content);
      expect(result.metadata.title, null);
      expect(result.metadata.artist, null);
    });

    test('with metadata', () {
      final content = '{title:Title}\n{artist:Artist}\n';
      final result = Song.fromChordPro(content);
      expect(result.metadata.title, 'Title');
      expect(result.metadata.artist, 'Artist');
    });

    test('with sections', () {
      final content =
          '{title:Title}\n{artist:Artist}\n\n{start_of_verse}\nThis is a verse\n{end_of_verse}\n{start_of_chorus}\nThis is a chorus\n{end_of_chorus}\n';
      final result = Song.fromChordPro(content);
      expect(result.metadata.title, 'Title');
      expect(result.metadata.artist, 'Artist');
      expect(result.sections.length, 2);
    });
  });
}
