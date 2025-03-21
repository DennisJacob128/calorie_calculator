import 'package:calorie_calculator/content/info.dart';
import 'package:flutter/material.dart';

class WeightDeltaDialog extends StatelessWidget {
  ///

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Text(
          Info.weightDelta,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
        ),
      ),
    );
  }

  /// endregion build
}
