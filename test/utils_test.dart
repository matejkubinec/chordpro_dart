import 'package:chordpro/src/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Utils', () {
    test('doesn\'t match directive', () {
      final directive = '{start_of_verse}';
      final result = Utils.isDirective(directive, 'artist');
      expect(result, false);
    });

    test('matches directive', () {
      final directive = '{start_of_verse}';
      final result = Utils.isDirective(directive, 'start_of_verse');
      expect(result, true);
    });

    test('directive without value', () {
      final directive = '{start_of_verse}';
      final result = Utils.valueFromDirective(directive);
      expect(result, null);
    });

    test('directive with value', () {
      final directive = '{start_of_verse: Verse #1 }';
      final result = Utils.valueFromDirective(directive);
      expect(result, 'Verse #1');
    });
  });
}
