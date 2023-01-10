import 'package:chordpro/src/metadata.dart';
import 'package:test/test.dart';

void main() {
  group('Metadata', () {
    test('parses song without metadata', () {
      final content = '';
      final expected = Metadata();
      final actual = Metadata.fromChordpro(content);

      expect(actual.title, expected.title);
      expect(actual.artist, expected.artist);
    });

    test('it parses artist', () {
      final content = '{artist: Artist}\n{title:Title}';
      final actual = Metadata.fromChordpro(content);

      expect(actual.artist, 'Artist');
    });

    test('it parses title', () {
      final content = '{artist: Artist}\n{title:Title}';
      final actual = Metadata.fromChordpro(content);

      expect(actual.title, 'Title');
    });
  });
}
