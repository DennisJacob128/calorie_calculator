import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InitializationTextField extends StatelessWidget {
  ///

  InitializationTextField({
    this.value,
    required this.label,
    this.unit,
    this.digitsOnly,
    required this.onSubmit,
  });

  final String? value;
  final String label;
  final String? unit;
  final bool? digitsOnly;
  final Function(String) onSubmit;

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,

      /// TextField
      child: TextField(
        controller: TextEditingController(text: value ?? ''),
        onSubmitted: onSubmit,

        autofocus: true,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide()),
          suffixText: unit,
          labelText: label,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          if (digitsOnly == true) FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }

  /// endregion build
}
