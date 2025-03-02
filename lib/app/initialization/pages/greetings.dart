import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_button.dart';
import 'package:flutter/material.dart';

class Greetings extends StatelessWidget {
  ///

  Greetings(this.nextPage);

  final Function() nextPage;

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading: 'Let\'s start with your data',
      action: InitializationButton(title: 'Go', onPressed: nextPage),
    );
  }

  /// endregion build
}
