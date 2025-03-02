import 'package:calorie_calculator/app/widgets/info_dialog.dart';
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
    return InfoDialog(info: info, keyWidth: 62, verticalRowPadding: 7);
  }

  /// endregion build
}
