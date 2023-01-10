import 'package:chordpro/src/line.dart';
import 'package:test/test.dart';

void main() {
  group('Line', () {
    test('lyric only', () {
      final content = 'This is just a lyric';
      final line = Line.fromChordPro(content);
      expect(line.blocks.length, 1);
      expect(line.blocks.first.chord, null);
      expect(line.blocks.first.lyric, content);
    });

    test('chord only', () {
      final content = '[A]    [B]    [C]';
      final line = Line.fromChordPro(content);
      expect(line.blocks.length, 3);

      expect(line.blocks[0].chord, 'A');
      expect(line.blocks[0].lyric, '    ');

      expect(line.blocks[1].chord, 'B');
      expect(line.blocks[1].lyric, '    ');

      expect(line.blocks[2].chord, 'C');
      expect(line.blocks[2].lyric, '');
    });

    test('mixed', () {
      final content = '[A] with [B] chords [C]';
      final line = Line.fromChordPro(content);
      expect(line.blocks.length, 3);

      expect(line.blocks[0].chord, 'A');
      expect(line.blocks[0].lyric, ' with ');

      expect(line.blocks[1].chord, 'B');
      expect(line.blocks[1].lyric, ' chords ');

      expect(line.blocks[2].chord, 'C');
      expect(line.blocks[2].lyric, '');
    });
  });
}
