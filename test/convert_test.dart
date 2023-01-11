import 'package:chordpro/src/convert.dart';
import 'package:test/test.dart';

void main() {
  group('Convert', () {
    test('chord only', () {
      final content = '[A] [B] [C]\n[A] [B] [C]\n';
      final result = convertToChordInLyric(content);
      expect(result, content);
    });

    test('chord & lyric', () {
      final content = '[A] [B] [C]\nThis is a lyric\n';
      final expected = '[A]This[B] is [C]a lyric\n';
      final actual = convertToChordInLyric(content);
      expect(actual, expected);
    });

    test('chord & shorter lyric', () {
      final content = '[A] [B] [C]\nThis\n';
      final expected = '[A]This[B] [C]\n';
      final actual = convertToChordInLyric(content);
      expect(actual, expected);
    });

    test('mixed', () {
      final content = """
{start_of_verse}
[A] [B] [C]
This is a lyric
{end_of_verse}

{start_of_chorus}
[A] [B] [C]
[A] [B] [C]
{end_of_chorus}
""";
      final expected = """
{start_of_verse}
[A]This[B] is [C]a lyric
{end_of_verse}

{start_of_chorus}
[A] [B] [C]
[A] [B] [C]
{end_of_chorus}
""";
      final actual = convertToChordInLyric(content);
      expect(actual, expected);
    });
  });
}
