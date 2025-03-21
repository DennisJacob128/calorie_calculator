import 'package:calorie_calculator/app/initialization/components/initialization_button.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/model/initialization_user.dart';
import 'package:calorie_calculator/model/diet_goal.dart';
import 'package:flutter/material.dart';

class DietGoalPage extends StatelessWidget {
  ///

  DietGoalPage(this.user, this.updateUser, this.skipWeightDelta);

  final InitializationUser user;
  final Function(InitializationUser) updateUser;
  final Function() skipWeightDelta;

  void submit(DietGoal dietGoal) {
    user.dietGoal = dietGoal;
    updateUser(user);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading: 'What do you want to achieve with your diet?',
      action: Column(
        children: [
          InitializationButton(
            title: 'Loose Weight',
            width: 190,
            onPressed: () => submit(DietGoal.loose),
          ),
          SizedBox(height: 15),

          InitializationButton(
            title: 'Gain Weight',
            width: 190,
            onPressed: () => submit(DietGoal.gain),
          ),
          SizedBox(height: 15),

          InitializationButton(
            title: 'Maintain Weight',
            width: 190,
            onPressed: skipWeightDelta,
          ),
        ],
      ),
    );
  }

  /// endregion build
}
