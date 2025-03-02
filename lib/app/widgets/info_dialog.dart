import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  ///

  InfoDialog({
    required this.info,
    required this.keyWidth,
    required this.verticalRowPadding,
    this.activeRow,
    this.centerValues,
  });

  final Map<String, String> info;
  final double keyWidth;
  final double verticalRowPadding;
  final int? activeRow;
  final bool? centerValues;

  Color? getColor(BuildContext context, int index) {
    return activeRow == index ? Theme.of(context).colorScheme.primary : null;
  }

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
            contentPadding: EdgeInsets.symmetric(
              vertical: verticalRowPadding,
              horizontal: 20,
            ),

            /// Keys
            leading: Container(
              width: keyWidth,
              alignment: Alignment.center,
              child: Text(
                entry.key,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: getColor(context, index),
                ),
              ),
            ),

            /// Values
            title: Text(
              entry.value,
              textAlign: centerValues == true ? TextAlign.center : null,
              style: TextStyle(color: getColor(context, index)),
            ),
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
