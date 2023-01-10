import 'package:chordpro/src/block.dart';
import 'package:test/test.dart';

void main() {
  group('Block', () {
    test('lyric only', () {
      final content = 'This is just a lyric';
      final block = Block.fromChordPro(content);

      expect(block.chord, null);
      expect(block.lyric, content);
    });

    test('chord only', () {
      final content = '[A]    ';
      final block = Block.fromChordPro(content);
      expect(block.chord, 'A');
      expect(block.lyric, '    ');
    });

    test('mixed', () {
      final content = '[A] with chords';
      final block = Block.fromChordPro(content);
      expect(block.chord, 'A');
      expect(block.lyric, ' with chords');
    });
  });
}
