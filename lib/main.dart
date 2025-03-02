import 'package:calorie_calculator/calorie_calculator.dart';
import 'package:calorie_calculator/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Prevents landscape
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize provider
  AppProvider appProvider = AppProvider();

  return runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => appProvider)],
      child: CalorieCalculator(),
    ),
  );
}
