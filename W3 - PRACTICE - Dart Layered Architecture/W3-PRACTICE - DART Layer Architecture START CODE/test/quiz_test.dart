import 'package:test/test.dart';
import '../lib/domain/quiz.dart';

void main() {
  test('My first test', () {
    // Simple example
    int x = 2 + 2;
    expect(x, equals(4));
  });

  test('Score calculation should be correct', () {
    // Arrange: create quiz questions
    var q1 = Question(
      title: 'Capital of France?',
      choices: ['Paris', 'London', 'Rome'],
      goodChoice: 'Paris',
      point: 10,
    );

    var q2 = Question(
      title: '2 + 2 = ?',
      choices: ['2', '4', '5'],
      goodChoice: '4',
      point: 50,
    );

    var quiz = Quiz(questions: [q1, q2]);

    // Act: add correct answers
    quiz.addAnswer(Answer(question: q1, answerChoice: 'Paris'));
    quiz.addAnswer(Answer(question: q2, answerChoice: '4'));

    // Assert: check points and percentage
    expect(quiz.getScoreInPoints(), equals(60));
    expect(quiz.getScoreInPercentage(), equals(100));
  });
}
