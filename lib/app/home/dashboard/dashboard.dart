import 'package:calorie_calculator/app/home/dashboard/bmi_dialog.dart';
import 'package:calorie_calculator/app/home/dashboard/data_field.dart';
import 'package:calorie_calculator/model/diet_goal.dart';
import 'package:calorie_calculator/model/user.dart';
import 'package:calorie_calculator/provider/app_provider.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  ///

  void showBmi(BuildContext context, User user) {
    showDialog(context: context, builder: (context) => BmiDialog(user));
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    User user = AppProvider.user!;

    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        padding: EdgeInsets.symmetric(horizontal: 3),
        physics: RangeMaintainingScrollPhysics(),
        children: [
          DataField(title: 'Daily Target', value: '${user.dailyRate} kcal'),

          DataField(
            title: 'BMI',
            value: user.bmi.toStringAsFixed(2),
            onTap: () => showBmi(context, user),
          ),

          if (user.dietGoal != DietGoal.maintain)
            DataField(title: 'Overall Rate', value: '${user.overallRate} kcal'),

          DataField(
            title: 'Metabolic Rate',
            value: '${user.metabolicRate.round()} kcal',
          ),
        ],
      ),
    );
  }

  /// endregion build
}
