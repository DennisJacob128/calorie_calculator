import 'package:flutter/material.dart';

class DefaultList extends StatelessWidget {
  ///

  const DefaultList({required this.length, required this.builder});

  final int length;
  final Widget Function(BuildContext, int) builder;

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: RangeMaintainingScrollPhysics(),
      shrinkWrap: true,
      itemCount: length,
      itemBuilder: builder,
      separatorBuilder: (context, index) {
        return Divider(height: 0, thickness: 0.5, indent: 15, endIndent: 15);
      },
    );
  }

  /// endregion build
}
