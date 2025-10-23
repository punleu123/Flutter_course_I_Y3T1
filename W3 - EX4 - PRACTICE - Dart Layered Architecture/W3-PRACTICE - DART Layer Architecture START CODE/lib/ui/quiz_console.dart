import 'dart:io';
import '../domain/quiz.dart';
import '../data/quiz_file_provider.dart';

class QuizConsole {
  final QuizRepository repository;
  List<Player> players = [];

  QuizConsole({required this.repository}) {
    players = repository.readPlayers();
  }

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    Quiz quiz;
    quiz = repository.readQuiz();
    repository.writeQuiz(quiz);

    while (true) {
      stdout.write('Your name: ');
      String? name = stdin.readLineSync()?.trim().toUpperCase();

      if (name == null || name.isEmpty) {
        repository.writePlayers(players);
        print('\n--- Quiz Finished ---');
        break;
      }

      Quiz playerQuiz = Quiz(
        id: '${quiz.getId}-${DateTime.now().millisecondsSinceEpoch}',
        questions: quiz.getQuestions,
        answers: [],
      );

      for (var question in playerQuiz.getQuestions) {
        print(
            'Question: ${question.getTitle} - ( ${question.getPoint} points)');
        print('Choices: ${question.getChoices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync()?.trim();

        if (userInput != null && userInput.isNotEmpty) {
          // Create answer with question ID reference
          Answer answer = Answer(
            questionId: question.getId,
            answerChoice: userInput,
          );
          playerQuiz.addAnswer(answer);
          print('No answer entered. Skipping question.');
        }

        int scorePercentage = playerQuiz.getScoreInPercentage();
        int scorePoints = playerQuiz.getScoreInPoints();

        print('$name, your score in percentage: $scorePercentage %');
        print('$name, your score in points: $scorePoints %\n');
        repository.writeQuiz(playerQuiz);

        players.removeWhere((player) => player.getName == name);
        Player newPlayer = Player(name: name, score: scorePoints);
        players.add(newPlayer);

        // Save players
        repository.writePlayers(players);

        // Show all players' last scores using getters
        print('--- All Players Scores ---');
        for (var player in players) {
          print('Player: ${player.getName} Score:${player.getScore}');
        }
        print('');
      }
    }
  }
}
