import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_slider.dart';
import 'package:calorie_calculator/app/initialization/model/initialization_user.dart';
import 'package:calorie_calculator/app/widgets/pal_factor_dialog.dart';
import 'package:flutter/material.dart';

class PalFactor extends StatelessWidget {
  ///

  PalFactor(this.user, this.updateUser, this.submit);

  final InitializationUser user;
  final Function(InitializationUser) updateUser;
  final Function() submit;

  void change(double pal) {
    user.palFactor = pal / 10;
    updateUser(user);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading: 'What\'s your PAL-Factor?',
      headingInfo: PalFactorDialog(),
      action: InitializationSlider(
        value: (user.palFactor ?? 1.2) * 10,
        min: 12,
        max: 24,
        labelDivisor: 10,
        onChange: change,
        submit: submit,
      ),
    );
  }

  /// endregion build
}
