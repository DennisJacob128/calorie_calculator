import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_text_field.dart';
import 'package:calorie_calculator/app/initialization/model/initialization_user.dart';
import 'package:calorie_calculator/app/widgets/weight_delta_dialog.dart';
import 'package:flutter/material.dart';

class WeeklyWeightDelta extends StatelessWidget {
  ///

  WeeklyWeightDelta(this.user, this.updateUser);

  final InitializationUser user;
  final Function(InitializationUser) updateUser;

  void submit(String weightDelta) {
    user.weeklyWeightDelta = int.parse(weightDelta);
    updateUser(user);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading:
          'How much weight do you want to ${user.dietGoal!.name} per week?',
      headingInfo: WeightDeltaDialog(),
      action: InitializationTextField(
        label: 'Weight',
        unit: 'g',
        digitsOnly: true,
        onSubmit: submit,
      ),
    );
  }

  /// endregion build
}
