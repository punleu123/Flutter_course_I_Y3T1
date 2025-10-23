import 'dart:convert';
import 'dart:io';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);

    if (!file.existsSync()) {
      print('Quiz file not found at path: $filePath');
      throw Exception('Quiz file not found at path: $filePath');
    }

    final content = file.readAsStringSync();
    final data = jsonDecode(content);

    print('Successfully read quiz from: $filePath');
    print('Quiz ID: ${data['id']}');
    print('Number of questions: ${(data['questions'] as List).length}');

    if (data.containsKey('answers')) {
      print(' Number of submissions: ${(data['answers'] as List).length}');
    } else {
      print(' No submissions found in quiz file');
    }

    return Quiz.fromJson(data);
  }

  void writeQuiz(Quiz quiz) {
    try {
      final file = File(filePath);
      final jsonData = quiz.toJson();
      final jsonString = JsonEncoder.withIndent('  ').convert(jsonData);
      file.writeAsStringSync(jsonString);

      print('Successfully wrote quiz to: $filePath');
      print('Quiz ID: ${quiz.getId}');
      print('Number of questions: ${quiz.getQuestions.length}');
      print('Number of answers: ${quiz.getAnswers.length}');
    } catch (e) {
      print('Error writing quiz to file: $e');
      rethrow;
    }
  }

  List<Player> readPlayers() {
    final playersFile = File('data/players.json');

    if (!playersFile.existsSync()) {
      print('No players file found. Starting with empty players list.');
      return [];
    }

    try {
      final content = playersFile.readAsStringSync();
      final data = jsonDecode(content) as List;

      final players =
          data.map((playerJson) => Player.fromJson(playerJson)).toList();
      print(
          'Successfully read ${players.length} players from data/players.json');

      return players;
    } catch (e) {
      print('Error reading players file: $e');
      return [];
    }
  }

  void writePlayers(List<Player> players) {
    try {
      // Create data directory if it doesn't exist
      final dataDir = Directory('data');
      if (!dataDir.existsSync()) {
        dataDir.createSync();
      }

      final playersFile = File('data/players.json');
      final playersData = players.map((player) => player.toJson()).toList();
      final jsonString = JsonEncoder.withIndent('  ').convert(playersData);
      playersFile.writeAsStringSync(jsonString);

      print(
          'Successfully wrote ${players.length} players to data/players.json');
    } catch (e) {
      print('Error writing players file: $e');
    }
  }

  void createDefaultQuiz() {
    final file = File(filePath);
    if (!file.existsSync()) {
      print('Creating default quiz file...');

      final defaultQuiz = Quiz(
        id: 'quiz-001',
        questions: [
          Question(
            id: 'q1',
            title: "3 + 3 = ?",
            choices: ["2", "3", "6"],
            goodChoice: "6",
            point: 50,
          ),
          Question(
            id: 'q2',
            title: "2 + 2 = ?",
            choices: ["2", "4", "5"],
            goodChoice: "4",
            point: 50,
          ),
        ],
      );

      writeQuiz(defaultQuiz);
    }
  }
}
