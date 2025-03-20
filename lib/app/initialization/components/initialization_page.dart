import 'package:flutter/material.dart';

class InitializationPage extends StatelessWidget {
  ///

  InitializationPage({
    required this.heading,
    this.headingInfo,
    required this.action,
  });

  final String heading;
  final Widget? headingInfo;
  final Widget action;

  /// Displays headingInfo dialog
  void showInfoDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => headingInfo!);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Heading
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                heading,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              /// Info dialog button
              if (headingInfo != null)
                IconButton(
                  onPressed: () => showInfoDialog(context),
                  icon: Icon(Icons.help_outline_rounded),
                ),
            ],
          ),

          SizedBox(height: 60),

          /// Action
          action,
        ],
      ),
    );
  }

  /// endregion build
}
