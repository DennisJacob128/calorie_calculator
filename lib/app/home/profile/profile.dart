import 'package:calorie_calculator/app/home/profile/edit_dialogs.dart';
import 'package:calorie_calculator/app/widgets/default_list.dart';
import 'package:calorie_calculator/app/widgets/pal_factor_dialog.dart';
import 'package:calorie_calculator/app/widgets/weight_delta_dialog.dart';
import 'package:calorie_calculator/model/user.dart';
import 'package:calorie_calculator/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  ///

  static const List<Function> editFunctions = [
    EditDialogs.editGender,
    EditDialogs.editHeight,
    EditDialogs.editWeight,
    EditDialogs.editDateOfBirth,
    EditDialogs.editPalFactor,
    EditDialogs.editSleep,
    EditDialogs.editDietGoal,
    EditDialogs.editWeeklyWeightDelta,
  ];

  void showPal(BuildContext context) {
    showDialog(context: context, builder: (context) => PalFactorDialog());
  }

  void showWeightDelta(BuildContext context) {
    showDialog(context: context, builder: (context) => WeightDeltaDialog());
  }

  void setValue(BuildContext c, User user, AppProvider prov, int index) {
    editFunctions[index](c, user, prov);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    User user = AppProvider.user!;
    AppProvider prov = context.watch<AppProvider>();

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: DefaultList(
        length: user.profileData.length,
        builder: (context, index) {
          MapEntry<String, String> profileData = user.profileData.entries
              .elementAt(index);

          return ListTile(
            onTap: () => editFunctions[index](context, user, prov),

            /// Data key
            title: Row(
              children: [
                Text(profileData.key),
                if (index == 4)
                  IconButton(
                    icon: Icon(Icons.help_outline_rounded),
                    onPressed: () => showPal(context),
                  )
                else if (index == 7)
                  IconButton(
                    icon: Icon(Icons.help_outline_rounded),
                    onPressed: () => showWeightDelta(context),
                  ),
              ],
            ),

            /// Data value
            trailing: Text(
              profileData.value,
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        },
      ),
    );
  }

  /// endregion build
}
