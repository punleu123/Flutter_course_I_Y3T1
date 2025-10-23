import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    Map<String, Player> player = {};

    while (true) {
      stdout.write('Your name: ');
      String? name = stdin.readLineSync();

      if (name == null || name.isEmpty) {
        print('\n--- Quiz Finished ---');
        break;
      }
      Quiz quiz = Quiz(questions: this.quiz.questions);

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.point} point)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          quiz.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }
      int score = quiz.getScoreInPercentage();
      int point = quiz.getScoreInPoints();

      print('$name, your score in percentage: $score %');
      print('$name, your score in points: $point\n');

      //overwrite
      player[name] = Player(name: name, score: point);
      // Show all players' last scores
      for (var entry in player.values) {
        print('Player: ${entry.name}, Score: ${entry.score} points');
      }
      print('');
    }
  }
}
