import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_text_field.dart';
import 'package:calorie_calculator/app/initialization/model/initialization_user.dart';
import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  ///

  Height(this.user, this.updateUser);

  final InitializationUser user;
  final Function(InitializationUser) updateUser;

  void submit(String height) {
    user.height = int.parse(height);
    updateUser(user);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading: 'How tall are you?',
      action: InitializationTextField(
        value: user.height?.toString(),
        label: 'Height',
        unit: 'cm',
        digitsOnly: true,
        onSubmit: submit,
      ),
    );
  }

  /// endregion build
}
