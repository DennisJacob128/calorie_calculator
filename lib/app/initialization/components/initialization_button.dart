import 'package:flutter/material.dart';

class InitializationButton extends StatelessWidget {
  ///

  const InitializationButton({
    required this.title,
    required this.onPressed,
    this.width,
  });

  final String title;
  final Function() onPressed;
  final double? width;

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 120,
      child: FilledButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 13),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }

  /// endregion build
}
