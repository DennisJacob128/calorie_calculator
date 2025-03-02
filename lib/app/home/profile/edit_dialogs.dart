import 'package:calorie_calculator/app/widgets/dialogs.dart';
import 'package:calorie_calculator/model/user.dart';
import 'package:calorie_calculator/provider/app_provider.dart';
import 'package:calorie_calculator/util/extensions.dart';
import 'package:flutter/cupertino.dart';

class EditDialogs {
  ///

  /// Edits gender
  static void editGender(BuildContext c, User user, AppProvider prov) {
    Dialogs.dialog(
      context: c,
      title: 'Are you male or female?',
      buttons: {
        'Male': () => prov.setUser(user..isMale = true),
        'Female': () => prov.setUser(user..isMale = false),
      },
    );
  }

  /// Edits height
  static void editHeight(BuildContext c, User user, AppProvider prov) {
    Dialogs.textField(
      context: c,
      title: 'How tall are you?',
      value: user.height.toString(),
      unit: 'cm',
      digitsOnly: true,
      onSubmit: (height) {
        if (height != '' && height != 0) {
          prov.setUser(user..height = int.parse(height));
        }
      },
    );
  }

  /// Edits weight
  static void editWeight(BuildContext c, User user, AppProvider prov) {
    Dialogs.textField(
      context: c,
      title: 'How much do you weigh?',
      value: user.weight.roundedString(),
      unit: 'kg',
      onSubmit: (weight) => prov.setUser(user..weight = double.parse(weight)),
    );
  }

  /// Edits date of birth
  static void editDateOfBirth(BuildContext c, User user, AppProvider prov) {
    Dialogs.calendar(
      context: c,
      saveFunction: (date) => prov.setUser(user..birth = date),
      initialDate: user.birth,
    );
  }

  /// Edits pal factor
  static void editPalFactor(BuildContext c, User user, AppProvider prov) {
    Dialogs.slider(
      context: c,
      title: 'What\'s your PAL-Factor?',
      min: 12,
      max: 24,
      divisor: 10,
      initialValue: user.palFactor * 10,
      onSubmit: (pal) => prov.setUser(user..palFactor = pal),
    );
  }

  /// Edits sleep
  static void editSleep(BuildContext c, User user, AppProvider prov) {
    Dialogs.slider(
      context: c,
      title: 'How many hours do you sleep?',
      min: 5,
      max: 15,
      divisions: 20,
      initialValue: user.sleep,
      onSubmit: (sleep) => prov.setUser(user..sleep = sleep),
    );
  }
}
