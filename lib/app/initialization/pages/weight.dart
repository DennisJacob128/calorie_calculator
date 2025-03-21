import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_text_field.dart';
import 'package:calorie_calculator/app/initialization/model/initialization_user.dart';
import 'package:flutter/material.dart';

class Weight extends StatelessWidget {
  ///

  Weight(this.user, this.updateUser);

  final InitializationUser user;
  final Function(InitializationUser) updateUser;

  void submit(String weight) {
    user.weight = double.parse(weight);
    updateUser(user);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading: 'How much do you weigh?',
      action: InitializationTextField(
        value: user.weight?.toString(),
        label: 'Weight',
        unit: 'kg',
        doubleOnly: true,
        onSubmit: submit,
      ),
    );
  }

  /// endregion build
}
