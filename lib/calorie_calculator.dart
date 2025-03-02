import 'package:calorie_calculator/app/home/home.dart';
import 'package:calorie_calculator/app/initialization/inifialization.dart';
import 'package:calorie_calculator/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalorieCalculator extends StatelessWidget {
  ///

  static final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    context.watch<AppProvider>();

    return MaterialApp(
      title: 'Calorie Calculator',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldKey,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF83DA85),
          brightness: Brightness.dark,
        ),
      ),
      home: AppProvider.user == null ? Initialization() : Home(),
    );
  }

  /// endregion build
}
