import 'package:test/test.dart';
import '../lib/domain/quiz.dart';

void main() {
  test('My first test', () {
    // Simple example
    int x = 2 + 2;
    expect(x, equals(4));
  });

  test(
    'Add player and check the submissions scores are valid',
    () {
      // Arrange
      var players = <String, Player>{};

      // Act: Add players
      players['ronan'] = Player(name: 'Alice', score: 80);
      players['peee'] = Player(name: 'Bob', score: 90);

      // Assert: Check if players are added correctly
      expect(players.length, equals(2));
      expect(players['ronan']?.score, equals(80));
      expect(players['peee']?.score, equals(90));

      // Act: Overwrite Alice's score
      players['ronan'] = Player(name: 'ronan', score: 95);

      // Assert: Check if Alice's score is updated
      expect(players['ronan']?.score, equals(95));
    },
  );
}
