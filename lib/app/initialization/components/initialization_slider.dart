import 'package:calorie_calculator/app/initialization/components/initialization_button.dart';
import 'package:calorie_calculator/util/extensions.dart';
import 'package:flutter/material.dart';

class InitializationSlider extends StatelessWidget {
  ///

  InitializationSlider({
    required this.value,
    required this.min,
    required this.max,
    required this.onChange,
    required this.submit,
    this.divisions,
    this.labelDivisor,
  });

  final double value; // slider value
  final double min; // min value
  final double max; // max value
  final int? divisions; // amount of divisions
  final int? labelDivisor; // number the label is divided by
  final Function(double) onChange; // called onChanged
  final Function() submit; // called on button press

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Slider
        Slider(
          value: value,
          label: (value / (labelDivisor ?? 1)).roundedString(),
          min: min,
          max: max,
          divisions: divisions ?? (max - min).round(),
          onChanged: (value) => onChange(value),
        ),

        SizedBox(height: 50),

        /// Submit button
        InitializationButton(title: 'Okay', onPressed: submit),
      ],
    );
  }

  /// endregion build
}
