import 'package:flutter/material.dart';

class Dialogs {
  ///

  /// Shows a calendar
  static void calendar({
    required final Function(DateTime) saveFunction, //  called on save
    final DateTime? initialDate, // optional initial date
    required final BuildContext context, // context
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
