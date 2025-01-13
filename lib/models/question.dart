class QuestionModel {
  QuestionModel({
    required this.question,
    required this.answer,
    required this.options,
    this.userAnswer,
  });
  final String question;
  final String answer;
  final List<String> options;
  final String? userAnswer;

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json['question'],
      answer: json['answer'],
      options: json['options'],
    );
  }

  QuestionModel copyWith({
    String? question,
    String? answer,
    List<String>? options,
    String? userAnswer,
    bool clearUserAnswer = false,
  }) {
    return QuestionModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      options: options ?? this.options,
      userAnswer: clearUserAnswer ? null : userAnswer ?? this.userAnswer,
    );
  }

  QuestionModel answerQuestion(String answer) => copyWith(userAnswer: answer);

  void clearUserAnswer() => copyWith(clearUserAnswer: true);

  bool get isCorrect => answer == userAnswer;

  bool get isAnswered => userAnswer != null;
}
