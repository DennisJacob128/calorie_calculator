import 'package:calorie_calculator/model/diet_goal.dart';

class InitializationUser {
  ///

  bool? isMale; // Sex
  int? height; // Height in cm
  double? weight; // Weight in kg
  DateTime? birth; // Date of birth
  double? palFactor; // Pal factor
  double? sleep; // Daily hours of sleep
  DietGoal? dietGoal; // What the user wants to achieve with his diet
  int? weeklyWeightDelta; // How much g weight the user wants to gain/loose
}
