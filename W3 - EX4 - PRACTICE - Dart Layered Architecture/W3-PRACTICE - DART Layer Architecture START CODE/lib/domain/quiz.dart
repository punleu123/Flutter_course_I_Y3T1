import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    this.point = 1,
  }) : id = id ?? uuid.v4();

  // Getter methods
  String get getId => id;
  String get getTitle => title;
  List<String> get getChoices => choices;
  String get getGoodChoice => goodChoice;
  int get getPoint => point;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
      'point': point,
    };
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id']?.toString(),
      title: json['title'],
      choices: List<String>.from(json['choices']),
      goodChoice: json['goodChoice'],
      point: json['point'] ?? 1,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    String? id,
    required this.questionId,
    required this.answerChoice,
  }) : id = id ?? uuid.v4();

  // Getter methods
  String get getId => id;
  String get getQuestionId => questionId;
  String get getAnswerChoice => answerChoice;

  bool isGood(Question question) {
    return answerChoice == question.goodChoice;
  }

  int getPointsEarned(Question question) {
    return isGood(question) ? question.point : 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'answerChoice': answerChoice,
    };
  }

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id']?.toString(),
      questionId: json['questionId'],
      answerChoice: json['answerChoice'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Answer && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Quiz {
  final String id;
  final List<Question> questions;
  final List<Answer> answers;

  Quiz({
    String? id,
    required this.questions,
    List<Answer>? answers,
  })  : id = id ?? uuid.v4(),
        answers = answers ?? [];

  // Getter methods
  String get getId => id;
  List<Question> get getQuestions => questions;
  List<Answer> get getAnswers => answers;

  // Get question by ID
  Question? getQuestionById(String id) {
    try {
      return questions.firstWhere((question) => question.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get answer by ID
  Answer? getAnswerById(String id) {
    try {
      return answers.firstWhere((answer) => answer.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get answers by question ID
  List<Answer> getAnswersByQuestionId(String questionId) {
    return answers.where((answer) => answer.questionId == questionId).toList();
  }

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScoreInPercentage() {
    if (questions.isEmpty) return 0;

    int correctAnswers = 0;
    for (Answer answer in answers) {
      Question? question = getQuestionById(answer.questionId);
      if (question != null && answer.isGood(question)) {
        correctAnswers++;
      }
    }
    return ((correctAnswers / questions.length) * 100).toInt();
  }

  int getScoreInPoints() {
    int totalPoints = 0;
    for (Answer answer in answers) {
      Question? question = getQuestionById(answer.questionId);
      if (question != null) {
        totalPoints += answer.getPointsEarned(question);
      }
    }
    return totalPoints;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questions': questions.map((q) => q.toJson()).toList(),
      'answers': answers.map((a) => a.toJson()).toList(),
    };
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    try {
      var questionsJson = json["questions"] as List? ?? [];
      var questions = questionsJson.map((q) => Question.fromJson(q)).toList();

      var answers = <Answer>[];
      if (json.containsKey('answers')) {
        var answersJson = json["answers"] as List? ?? [];
        answers = answersJson.map((a) => Answer.fromJson(a)).toList();
      }

      return Quiz(
        id: json['id']?.toString(),
        questions: questions,
        answers: answers,
      );
    } catch (e) {
      print('❌ Error parsing Quiz from JSON: $e');
      rethrow;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Quiz && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class Player {
  final String id;
  final String name;
  final int score;

  Player({
    String? id,
    required this.name,
    required this.score,
  }) : id = id ?? uuid.v4();

  // Getter methods
  String get getId => id;
  String get getName => name;
  int get getScore => score;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score': score,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id']?.toString(),
      name: json['name'],
      score: json['score'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
