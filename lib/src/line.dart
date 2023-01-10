import 'block.dart';

class Line {
  var blocks = <Block>[];

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
