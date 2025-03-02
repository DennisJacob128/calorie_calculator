import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/components/initialization_slider.dart';
import 'package:calorie_calculator/app/initialization/initialization_user.dart';
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
      headingWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              'What\'s your PAL-Factor?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            /// PAL factor helper
            IconButton(
              onPressed:
                  () => showDialog(
                    context: context,
                    builder: (context) => PalFactorDialog(),
                  ),
              icon: Icon(Icons.help_outline_rounded),
            ),
          ],
        ),
      ),
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
