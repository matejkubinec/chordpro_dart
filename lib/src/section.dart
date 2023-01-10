import 'dart:convert';

import 'package:chordpro/src/line.dart';
import 'package:chordpro/src/utils.dart';

class Section {
  String? title;
  List<Line> lines = [];

  static Section fromChordPro(String content) {
    final section = Section();
    final rawLines = LineSplitter().convert(content);
    final startOf = rawLines.removeAt(0);
    rawLines.removeLast();
    final lines = rawLines.map((line) => Line.fromChordPro(line)).toList();
    section.title = Utils.valueFromDirective(startOf);
    section.lines = lines;
    return section;
  }
}
