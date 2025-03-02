import 'package:flutter/material.dart';

class InitializationPage extends StatelessWidget {
  ///

  InitializationPage({this.heading, this.headingWidget, required this.action});

  final String? heading;
  final Widget? headingWidget;
  final Widget action;

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Message
        if (headingWidget != null)
          headingWidget!
        else
          Text(
            heading!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),

        SizedBox(height: 60),

        /// Action
        action,
      ],
    );
  }

  /// endregion build
}
