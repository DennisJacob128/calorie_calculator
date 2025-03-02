import 'dart:convert';
import 'dart:math';

import 'package:age_calculator/age_calculator.dart';
import 'package:calorie_calculator/util/extensions.dart';
import 'package:intl/intl.dart';

class User {
  ///

  User({
    required this.isMale,
    required this.height,
    required this.weight,
    required this.birth,
    required this.palFactor,
    required this.sleep,
  });

  User.fromJson(Map<String, dynamic> json)
    : this.isMale = json['isMale'] as bool,
      this.height = json['height'] as int,
      this.weight = json['weight'] as double,
      this.birth = DateFormat(dateFormat).parse(json['birth'] as String),
      this.palFactor = json['palFactor'] as double,
      this.sleep = json['sleep'] as double;

  bool isMale; // Sex
  int height; // Height in cm
  double weight; // Weight in kg
  DateTime birth; // Date of birth
  double palFactor; // Pal factor
  double sleep; // Daily hours of sleep

  static final String dateFormat = 'dd.MM.yyyy';

  int get age => AgeCalculator.age(birth).years;

  double get metabolicRate =>
      isMale
          ? 66.47 + 13.7 * weight + 5 * height - 6.8 * age
          : 655.1 + 9.6 * weight + 1.8 * height - 4.7 * age;

  int get overallRate {
    double pal = (sleep * 0.95 + (24 - sleep) * palFactor) / 24;
    return (metabolicRate * pal).round();
  }

  double get bmi => weight / pow(height / 100, 2);

  Map<String, String> get profileData => {
    'Sex': isMale ? 'Male' : 'Female',
    'Height': '$height cm',
    'Weight': '${weight.roundedString()} kg',
    'Date of birth': DateFormat(dateFormat).format(birth),
    'PAL-Factor': palFactor.roundedString(),
    'Hours of sleep': '${sleep.roundedString()} hours',
  };

  String get jsonString => json.encode({
    'isMale': isMale,
    'height': height,
    'weight': weight,
    'birth': DateFormat(dateFormat).format(birth),
    'palFactor': palFactor,
    'sleep': sleep,
  });
}
