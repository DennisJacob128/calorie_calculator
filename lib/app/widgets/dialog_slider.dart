import 'package:flutter/material.dart';

/// AlertDialog with a slider
class DialogSlider extends StatefulWidget {
  ///

  DialogSlider({
    required this.title,
    required this.min,
    required this.max,
    this.initialValue,
    this.divisions,
    this.divisor,
    required this.onSubmit,
  });

  final String title; // Title
  final double min; // Minimal slider value
  final double max; // Maximal slider value
  final double? initialValue; // Optional initial value
  final int? divisions; // Amount of divisions
  final int? divisor; // Number the actual value is divided by
  final Function(double) onSubmit; // Called on submit

  @override
  State<DialogSlider> createState() => _DialogSliderState();
}

class _DialogSliderState extends State<DialogSlider> {
  ///

  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue ?? widget.min;
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Container(
        height: 15,
        margin: EdgeInsets.only(top: 20),

        /// Slider
        child: Slider(
          value: _value,
          label: (_value / (widget.divisor ?? 1)).toString(),
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions ?? (widget.max - widget.min).round(),
          onChanged: (value) => setState(() => _value = value),
        ),
      ),
      actions: [
        /// Buttons
        for (int i = 0; i < 2; i += 1)
          TextButton(
            onPressed: () {
              if (i == 1) widget.onSubmit(_value / (widget.divisor ?? 1));
              Navigator.pop(context);
            },
            child: Text(i == 0 ? 'Back' : 'Yes'),
          ),
      ],
    );
  }

  /// endregion build
}
