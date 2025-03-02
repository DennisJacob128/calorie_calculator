import 'package:calorie_calculator/app/home/dashboard/dashboard.dart';
import 'package:calorie_calculator/app/home/profile/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ///

  static final Map<IconData, Widget> pages = {
    Icons.space_dashboard: Dashboard(),
    Icons.account_circle_rounded: Profile(),
  };

  Icon getIcon(IconData iconData) =>
      Icon(iconData, color: Theme.of(context).colorScheme.onPrimaryContainer);

  int pageIndex = 0;

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Content
      body: pages.values.elementAt(pageIndex),

      /// BottomNavigationBar
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Theme.of(context).colorScheme.onSecondary,
        buttonBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
        height: 60,
        index: pageIndex,
        onTap: (index) => setState(() => pageIndex = index),
        items: pages.keys.map(getIcon).toList(),
      ),
    );
  }

  /// endregion build
}
