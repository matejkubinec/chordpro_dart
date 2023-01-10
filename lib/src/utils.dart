class Utils {
  static bool isDirective(String line, String directive) {
    return line.startsWith('{$directive');
  }

  static String? valueFromDirective(String directive) {
    final parts = directive.split(':');

    if (parts.length == 1) {
      return null;
    }

    final value = parts.last.trim();
    return value.substring(0, value.length - 1).trim();
  }

  static List<String> getSections(String content) {
    final regex =
        RegExp(r'\{start_of(.|\n|\r\n)*?\{end_of_.*\}$', multiLine: true);
    final matches = regex.allMatches(content);
    final sections = matches.map((match) => match[0].toString());

    return sections.toList();
  }
}
