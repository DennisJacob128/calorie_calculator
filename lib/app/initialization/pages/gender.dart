import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_button.dart';
import 'package:calorie_calculator/app/initialization/model/initialization_user.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  ///

  Gender(this.user, this.updateUser);

  final InitializationUser user;
  final Function(InitializationUser) updateUser;

  void submit(bool isMale) {
    user.isMale = isMale;
    updateUser(user);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading: 'Are you male or female?',
      action: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InitializationButton(title: 'Male', onPressed: () => submit(true)),

          InitializationButton(title: 'Female', onPressed: () => submit(false)),
        ],
      ),
    );
  }

  /// endregion build
}
