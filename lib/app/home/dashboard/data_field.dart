import 'package:flutter/material.dart';

class DataField extends StatelessWidget {
  ///

  DataField({required this.title, required this.value, this.onTap});

  final String title;
  final String value;
  final Function()? onTap;

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Title
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                ),
              ),

              SizedBox(height: 5),

              /// Value
              Text(
                value,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// endregion build
}
