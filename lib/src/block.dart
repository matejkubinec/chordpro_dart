class Block {
  String? lyric;
  String? chord;

  static Block fromChordPro(String part) {
    final block = Block();

    if (part.contains(']')) {
      final parts = part.replaceAll('[', '').split(']');
      block.chord = parts.first;
      block.lyric = parts.last;
    } else if (part != '') {
      block.lyric = part;
    }

    return block;
  }
}
