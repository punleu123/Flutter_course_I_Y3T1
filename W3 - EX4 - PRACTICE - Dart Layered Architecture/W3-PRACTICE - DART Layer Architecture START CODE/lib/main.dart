import 'dart:io';
import 'ui/quiz_console.dart';
import 'data/quiz_file_provider.dart';

void main() {
  final dataDir = Directory('quiz');
  if (!dataDir.existsSync()) {
    dataDir.createSync();
    print('Created data directory');
  }

  QuizRepository repository = QuizRepository('data/quiz.json');

  QuizConsole console = QuizConsole(repository: repository);

  console.startQuiz();
}
