class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question(
      {required this.title,
      required this.choices,
      required this.goodChoice,
      this.point = 1});
}

class Answer {
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice});

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }

  int getPointsEarned() {
    return isGood() ? question.point : 0;
  }
}

class Quiz {
  List<Question> questions;
  List<Answer> answers = [];

  Quiz({required this.questions});

  void addAnswer(Answer answer) {
    this.answers.add(answer);
  }

  int getScoreInPercentage() {
    int totalSCore = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalSCore++;
      }
    }
    return ((totalSCore / questions.length) * 100).toInt();
  }

  int getScoreInPoints() {
    int totalPoints = 0;
    for (Answer answer in answers) {
      totalPoints += answer.getPointsEarned();
    }
    return totalPoints;
  }
}

class Player {
  final String name;
  final int score;

  Player({required this.name, required this.score});
}
