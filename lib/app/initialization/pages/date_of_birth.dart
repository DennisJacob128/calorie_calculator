import 'package:calorie_calculator/app/initialization/components/initialization_page.dart';
import 'package:calorie_calculator/app/initialization/model/initialization_user.dart';
import 'package:calorie_calculator/app/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateOfBirth extends StatelessWidget {
  ///

  DateOfBirth(this.user, this.updateUser) {
    String dateString =
        user.birth != null ? DateFormat('dd.MM.yyyy').format(user.birth!) : '';
    controller = TextEditingController(text: dateString);
  }

  final InitializationUser user;
  final Function(InitializationUser) updateUser;

  late final TextEditingController controller;

  void submit(DateTime birth) {
    user.birth = birth;
    updateUser(user);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return InitializationPage(
      heading: 'When where you born?',
      action: SizedBox(
        width: 200,
        child: TextField(
          readOnly: true,
          textAlign: TextAlign.center,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide()),
          ),
          onTap: () => Dialogs.calendar(context: context, saveFunction: submit),
        ),
      ),
    );
  }

  /// endregion build
}
