import 'package:calorie_calculator/content/info.dart';
import 'package:flutter/material.dart';

class PalFactorDialog extends StatelessWidget {
  ///

  static final Map<String, String> info = Info.palFactor;

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView.separated(
        physics: RangeMaintainingScrollPhysics(),
        shrinkWrap: true,
        itemCount: info.length,
        itemBuilder: (context, index) {
          MapEntry<String, String> entry = info.entries.elementAt(index);

          /// ListTile
          return ListTile(
            horizontalTitleGap: 25,
            contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
            leading: Container(
              width: 62,
              alignment: Alignment.center,
              child: Text(
                entry.key,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            title: Text(entry.value),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 0, thickness: 0.5, indent: 15, endIndent: 15);
        },
      ),
    );
  }

  /// endregion build
}
