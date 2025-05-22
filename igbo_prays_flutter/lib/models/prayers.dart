class Prayer {
  final String titleIgbo;
  final String titleEnglish;
  final String textIgbo;
  final String textEnglish;

  Prayer({
    required this.titleIgbo,
    required this.titleEnglish,
    required this.textIgbo,
    required this.textEnglish,
  });

  factory Prayer.fromJson(Map<String, dynamic> json) {
    return Prayer(
      titleIgbo: json['title']['igbo'],
      titleEnglish: json['title']['english'],
      textIgbo: json['text']['igbo'],
      textEnglish: json['text']['english'],
    );
  }
}
