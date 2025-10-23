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

    return Quiz.fromJson(data);
  }

  void writeQuiz(Quiz quiz) {
    final file = File(filePath);
    final jsonData = quiz.toJson();
    final jsonString = JsonEncoder.withIndent('  ').convert(jsonData);
    file.writeAsStringSync(jsonString);
  }

  List<Player> readPlayers() {
    final playersFile = File('data/players.json');
    final content = playersFile.readAsStringSync();
    final data = jsonDecode(content) as List;

    final players =
        data.map((playerJson) => Player.fromJson(playerJson)).toList();

    return players;
  }

  void writePlayers(List<Player> players) {
    final dataDir = Directory('data');
    if (!dataDir.existsSync()) {
      dataDir.createSync();
    }

    final playersFile = File('data/players.json');
    final playersData = players.map((player) => player.toJson()).toList();
    final jsonString = JsonEncoder.withIndent('  ').convert(playersData);
    playersFile.writeAsStringSync(jsonString);
  }
}
