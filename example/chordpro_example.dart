import 'package:chordpro/chordpro.dart';

void main() {
  final content = """
{title:Amazing Grace}

{start_of_verse:Verse 1}
A[F]mazing Grace, how s[Bb]weet the s[F]ound,
That [F]saved a wretch like [C/E]me.
I [F]once was lost but [Bb]now am foun[F]d,
Was [F]blind, but [C/E]now I s[F]ee.
{end_of_verse}
  """;

  final song = Song.fromChordPro(content);
}
