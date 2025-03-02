import 'package:calorie_calculator/app/widgets/dialog_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dialogs {
  ///

  /// Template
  static void dialog({
    required final BuildContext context, // Context
    required final String title, // Title that is displayed at the top
    required final Map<String, Function()?> buttons, // Buttons
    final Widget? content, // Content that is displayed in the middle
  }) {
    showDialog(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: Text(title),
            content: content,
            actions: [
              /// Buttons
              for (final button in buttons.entries)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    button.value != null ? button.value!() : null;
                  },
                  child: Text(button.key),
                ),
            ],
          ),
    );
  }

  /// Displays a TextField
  static void textField({
    required final BuildContext context, // Context
    required final String title, // Title that is displayed at the top
    final String? value, // Default value text in textField
    final bool? digitsOnly, // If only digits are allowed
    final String? unit, // Unit that is displayed on the right of textField
    required final Function(String) onSubmit, // Function on submit
  }) {
    final TextEditingController textController = TextEditingController(
      text: value,
    );

    Dialogs.dialog(
      context: context,
      title: title,
      buttons: {'Back': () {}, 'Yes': () => onSubmit(textController.text)},
      content: TextField(
        controller: textController,
        autofocus: true,
        decoration: InputDecoration(suffixText: unit),
        onSubmitted: (input) {
          Navigator.pop(context);
          onSubmit(input);
        },
        inputFormatters: [
          if (digitsOnly == true) FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
      ),
    );
  }

  /// Displays a slider
  static void slider({
    required final BuildContext context, // Context
    required final String title, // Title
    required final double min, // Minimal slider value
    required final double max, // Maximal slider value
    final double? initialValue, // Optional initial value
    final int? divisions, // Amount of divisions
    final int? divisor, // Number the actual value is divided by
    required final Function(double) onSubmit, // Submit function
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogSlider(
          title: title,
          min: min,
          max: max,
          initialValue: initialValue,
          divisions: divisions,
          divisor: divisor,
          onSubmit: onSubmit,
        );
      },
    );
  }

  /// Displays a calendar
  static void calendar({
    required final BuildContext context, // Context
    required final Function(DateTime) saveFunction, // Called on save
    final DateTime? initialDate, // Optional initial date
  }) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      saveFunction(date);
    }
  }
}
