import 'package:calorie_calculator/model/diet_goal.dart';
import 'package:test/test.dart';

void main() {
  test('enum values', () {
    expect(DietGoal.loose.goal, 'loose');
    expect(DietGoal.gain.goal, 'gain');
    expect(DietGoal.maintain.goal, 'maintain');
  });

  test('fromString', () {
    expect(DietGoal.fromString('loose'), DietGoal.loose);
    expect(DietGoal.fromString('gain'), DietGoal.gain);
    expect(DietGoal.fromString('maintain'), DietGoal.maintain);
    expect(() => DietGoal.fromString('bulk'), throwsA(isA<StateError>()));
  });
}
