class WordModel {
  final int word_id;
  final String word_kanji;
  final String word_hurigana;
  final String word_hurigana_test1;
  final String word_hurigana_test2;

  WordModel({
    required this.word_id,
    required this.word_kanji,
    required this.word_hurigana,
    required this.word_hurigana_test1,
    required this.word_hurigana_test2,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word_id: json["word_id"],
      word_kanji: json["word_kanji"],
      word_hurigana: json["word_hurigana"],
      word_hurigana_test1: json["word_hurigana_test1"],
      word_hurigana_test2: json["word_hurigana_test2"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['word_id'] = this.word_id;
    data['word_kanji'] = this.word_kanji;
    data['word_hurigana'] = this.word_hurigana;
    data['word_hurigana_test1'] = this.word_hurigana_test1;
    data['word_hurigana_test2'] = this.word_hurigana_test2;
    return data;
  }
}