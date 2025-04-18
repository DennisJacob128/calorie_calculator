import 'dart:convert';

import 'package:age_calculator/age_calculator.dart';
import 'package:calorie_calculator/model/diet_goal.dart';
import 'package:calorie_calculator/model/user.dart';
import 'package:test/test.dart';

void main() {
  late User male;
  late User female;

  setUp(() {
    male = User(
      isMale: true,
      height: 150,
      weight: 60.0,
      birth: DateTime(2003, 02, 01),
      palFactor: 1.5,
      sleep: 10,
      dietGoal: DietGoal.maintain,
      weeklyWeightDelta: 200,
    );

    female = User(
      isMale: false,
      height: 150,
      weight: 60.5,
      birth: DateTime(2003, 02, 01),
      palFactor: 1.5,
      sleep: 10.5,
      dietGoal: DietGoal.maintain,
      weeklyWeightDelta: 200,
    );
  });

  test('fromJson', () {
    const Map<String, dynamic> json = {
      'isMale': true,
      'height': 150,
      'weight': 60.0,
      'birth': '01.02.2003',
      'palFactor': 1.5,
      'sleep': 10.0,
      'dietGoal': 'maintain',
      'weeklyWeightDelta': 200,
    };
    User jsonUser = User.fromJson(json);

    expect(jsonUser.isMale, true);
    expect(jsonUser.height, 150);
    expect(jsonUser.weight, 60);
    expect(jsonUser.birth, DateTime(2003, 02, 01));
    expect(jsonUser.palFactor, 1.5);
    expect(jsonUser.sleep, 10);
    expect(jsonUser.dietGoal, DietGoal.maintain);
    expect(jsonUser.weeklyWeightDelta, 200);
  });

  test('age', () {
    expect(male.age, AgeCalculator.age(male.birth).years);
  });

  test('metabolicRate', () {
    expect(male.metabolicRate, closeTo(1488, 0.9));
    expect(female.metabolicRate, closeTo(1402, 0.9));
  });

  test('overallRate', () {
    expect(male.overallRate, closeTo(1892, 0.9));
    expect(female.overallRate, closeTo(1766, 0.9));
  });

  test('dailyRate', () {
    expect(male.dailyRate, closeTo(1892, 0.9));
    expect(female.dailyRate, closeTo(1766, 0.9));

    male.dietGoal = DietGoal.loose;
    female.dietGoal = DietGoal.gain;

    expect(male.dailyRate, closeTo(1672, 0.9));
    expect(female.dailyRate, closeTo(1986, 0.9));
  });

  test('dailyCalorieDelta', () {
    expect(male.dailyCalorieDelta, 0);

    male.dietGoal = DietGoal.loose;
    expect(male.dailyCalorieDelta, -220);

    male.dietGoal = DietGoal.gain;
    expect(male.dailyCalorieDelta, 220);
  });

  test('dietGoalString', () {
    expect(male.dietGoalString, 'Maintain');

    male.dietGoal = DietGoal.loose;
    expect(male.dietGoalString, 'Loose');

    male.dietGoal = DietGoal.gain;
    expect(male.dietGoalString, 'Gain');
  });

  test('bmi', () {
    expect(male.bmi, closeTo(26.6, 0.1));
    expect(female.bmi, closeTo(26.8, 0.1));
  });

  test('profileData', () {
    expect(male.profileData, {
      'Sex': 'Male',
      'Height': '150 cm',
      'Weight': '60 kg',
      'Date of Birth': '01.02.2003',
      'PAL-Factor': '1.5',
      'Hours of Sleep': '10 hours',
      'Diet goal': 'Maintain weight',
    });

    female.dietGoal = DietGoal.gain;
    expect(female.profileData, {
      'Sex': 'Female',
      'Height': '150 cm',
      'Weight': '60.5 kg',
      'Date of Birth': '01.02.2003',
      'PAL-Factor': '1.5',
      'Hours of Sleep': '10.5 hours',
      'Diet goal': 'Gain weight',
      'Gain weight per week': '200 g',
    });
  });

  test('jsonString', () {
    String maleJson = json.encode({
      'isMale': true,
      'height': 150,
      'weight': 60.0,
      'birth': '01.02.2003',
      'palFactor': 1.5,
      'sleep': 10.0,
      'dietGoal': 'maintain',
      'weeklyWeightDelta': 200,
    });
    expect(male.jsonString, maleJson);

    female.dietGoal = DietGoal.gain;
    String femaleJson = json.encode({
      'isMale': false,
      'height': 150,
      'weight': 60.5,
      'birth': '01.02.2003',
      'palFactor': 1.5,
      'sleep': 10.5,
      'dietGoal': 'gain',
      'weeklyWeightDelta': 200,
    });
    expect(female.jsonString, femaleJson);
  });
}
