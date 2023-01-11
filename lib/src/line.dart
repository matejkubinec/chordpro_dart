import 'block.dart';

class Line {
  var blocks = <Block>[];

  bool get lyricOnly => blocks.every((b) => b.chord == null);

  bool get chordOnly =>
      blocks.every((b) => b.lyric == null || b.lyric!.trim() == '');

  static Line fromChordPro(String content) {
    final line = Line();
    final parts = content.split('[');
    final blocks = parts.map((part) => Block.fromChordPro(part));
    line.blocks = blocks
        .where((block) => block.chord != null || block.lyric != null)
        .toList();

    return line;
  }
}
