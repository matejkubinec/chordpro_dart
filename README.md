# Chordpro

Simple parser for songs in the [ChordPro](https://chordpro.org/) format to a specific structure:

```
Song {
    metadata {
        title
        artist
    }
    sections [
        {
            title
            lines [
                blocks [
                    {
                        lyric
                        chord
                    }
                ]
            ]
        }
    ]
}

```

## Usage

```dart

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

// use the parsed song as needed

```
