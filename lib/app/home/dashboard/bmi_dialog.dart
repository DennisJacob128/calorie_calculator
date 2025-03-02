import 'package:calorie_calculator/app/widgets/info_dialog.dart';
import 'package:calorie_calculator/content/info.dart';
import 'package:calorie_calculator/model/user.dart';
import 'package:flutter/material.dart';

class BmiDialog extends StatelessWidget {
  ///

  BmiDialog(User user)
    : isMale = user.isMale,
      bmi = user.bmi,
      info = user.isMale ? Info.bmiMale : Info.bmiFemale;

  final bool isMale;
  final double bmi;
  final Map<String, String> info;

  int get bmiClass {
    if (bmi < 17.5 || bmi < 18.5 && isMale) return 0;
    if (bmi < 24 || bmi < 24.9 && isMale) return 1;
    if (bmi < 29 || bmi < 29.9 && isMale) return 2;
    if (bmi < 34 || bmi < 34.9 && isMale) return 3;
    if (bmi < 36.5 || bmi < 29.9 && isMale) return 4;
    return 5;
  }

  Color? getColor(BuildContext context, int index) {
    return bmiClass == index ? Theme.of(context).colorScheme.primary : null;
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InfoDialog(
      info: info,
      keyWidth: 90,
      verticalRowPadding: 5,
      activeRow: bmiClass,
      centerValues: true,
    );
  }

  /// endregion build
}
