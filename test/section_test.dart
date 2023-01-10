import 'package:chordpro/src/section.dart';
import 'package:test/test.dart';

void main() {
  group('Section', () {
    test('parses empty section', () {
      final content = '{start_of_verse}\n{end_of_verse}';
      final section = Section.fromChordPro(content);
      expect(section.title, null);
      expect(section.lines.length, 0);
    });

    test('parses without title', () {
      final content = '{start_of_verse}\nThis is a verse\n{end_of_verse}';
      final section = Section.fromChordPro(content);
      expect(section.title, null);
      expect(section.lines.length, 1);
      expect(section.lines.first.blocks.length, 1);
    });

    test('parses with multiple lines', () {
      final content =
          '{start_of_verse}\nThis is a verse\n[A] with [B] chords \n{end_of_verse}';
      final section = Section.fromChordPro(content);
      expect(section.title, null);
      expect(section.lines.length, 2);
      expect(section.lines.first.blocks.length, 1);
      expect(section.lines.last.blocks.length, 2);
    });
  });
}
