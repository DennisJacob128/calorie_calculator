import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_slider.dart';
import 'package:calorie_calculator/app/initialization/model/initialization_user.dart';
import 'package:flutter/material.dart';

class Sleep extends StatelessWidget {
  ///

  Sleep(this.user, this.updateUser, this.submit);

  final InitializationUser user;
  final Function(InitializationUser) updateUser;
  final Function() submit;

  void change(double sleep) {
    user.sleep = sleep;
    updateUser(user);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading: 'How many hours do you sleep?',
      action: InitializationSlider(
        value: user.sleep ?? 5,
        min: 5,
        max: 15,
        divisions: 20,
        onChange: change,
        submit: submit,
      ),
    );
  }

  /// endregion build
}
