import 'dart:convert';

String convertToChordInLyric(String content) {
  final result = <String>[];
  final lines = LineSplitter.split(content).toList();

  for (var i = 0; i < lines.length; i++) {
    if (i == lines.length - 1) {
      result.add(lines[i]);
    } else if (lines[i].contains('[') && lines[i + 1].contains('[')) {
      result.add(lines[i]);
    } else if (lines[i].contains('[') &&
        !lines[i + 1].contains('[') &&
        !lines[i + 1].contains('{')) {
      var chordLine = lines[i];
      var lyricLine = lines[i + 1];
      var pairs = _getChordPairs(chordLine);

      if (chordLine.length > lyricLine.length) {
        final shorter = pairs.where((p) => p.idx < lyricLine.length).toList();
        final longerIndices =
            pairs.where((p) => p.idx >= lyricLine.length).toList();
        final splitIdx = longerIndices.isEmpty ? -1 : longerIndices.first.idx;

        lyricLine = lyricLine.padRight(chordLine.length);
        if (splitIdx != -1) {
          lyricLine =
              lyricLine.substring(0, splitIdx) + chordLine.substring(splitIdx);
        }

        var offset = 0;
        for (var pair in shorter) {
          final idx = pair.idx + offset;
          final start = lyricLine.substring(0, idx);
          final end = lyricLine.substring(idx);
          lyricLine = start + pair.chord + end;
          offset += pair.chord.length;
        }
      } else {
        for (var pair in pairs.reversed) {
          final start = lyricLine.substring(0, pair.idx);
          final end = lyricLine.substring(pair.idx);
          lyricLine = start + pair.chord + end;
        }
      }

      result.add(lyricLine);
      i++;
    } else {
      result.add(lines[i]);
    }
  }

  return '${result.join('\n')}\n';
}

List<_Pair> _getChordPairs(String line) {
  final pairs = <_Pair>[];
  var current = '';
  var idx = -1;

  for (var i = 0; i < line.length; i++) {
    if (line[i] == '[') {
      idx = i;
    }

    if (line[i] == ']') {
      current += line[i];

      pairs.add(_Pair(idx, current));

      current = '';
      idx = -1;
    }

    if (idx != -1) {
      current += line[i];
    }
  }

  return pairs;
}

class _Pair {
  int idx = -1;
  String chord = '';

  _Pair(this.idx, this.chord);
}
