import 'package:calorie_calculator/app/initialization/initialization_user.dart';
import 'package:calorie_calculator/app/initialization/pages/date_of_birth.dart';
import 'package:calorie_calculator/app/initialization/pages/gender.dart';
import 'package:calorie_calculator/app/initialization/pages/greetings.dart';
import 'package:calorie_calculator/app/initialization/pages/height.dart';
import 'package:calorie_calculator/app/initialization/pages/pal_factor.dart';
import 'package:calorie_calculator/app/initialization/pages/sleep.dart';
import 'package:calorie_calculator/app/initialization/pages/weight.dart';
import 'package:calorie_calculator/model/user.dart';
import 'package:calorie_calculator/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Initialization extends StatefulWidget {
  @override
  State<Initialization> createState() => _InitializationState();
}

class _InitializationState extends State<Initialization> {
  ///

  PageController pageController = PageController(initialPage: 0); // paging
  int stage = 0; // stage of data input

  InitializationUser user = InitializationUser();

  /// --------------------------------------------------------------------------
  /// region methods
  /// --------------------------------------------------------------------------

  /// Updates user and navigates to next page
  void submitPage(InitializationUser newUser, int nextPage) {
    updateUser(user);
    goToPage(nextPage);
  }

  /// Updates user
  void updateUser(InitializationUser newUser) {
    setState(() => user = newUser);
  }

  /// Increases stage and navigates to next page
  void goToPage(int index) {
    if (stage < index) {
      setState(() => stage++);
    }

    pageController.nextPage(
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }

  /// The initialization pages
  List<Widget> pages(AppProvider prov) {
    return [
      Greetings(() => goToPage(1)),
      Gender(user, (user) => submitPage(user, 2)),
      Height(user, (user) => submitPage(user, 3)),
      Weight(user, (user) => submitPage(user, 4)),
      DateOfBirth(user, (user) => submitPage(user, 5)),
      PalFactor(user, updateUser, () => goToPage(6)),
      Sleep(user, updateUser, () => saveUser(prov)),
    ];
  }

  /// Saves the initialized user values
  void saveUser(AppProvider appProv) {
    User finalUser = User(
      isMale: user.isMale!,
      height: user.height!,
      weight: user.weight!,
      birth: user.birth!,
      palFactor: user.palFactor!,
      sleep: user.sleep!,
    );
    appProv.setUser(finalUser);
  }

  /// --------------------------------------------------------------------------
  /// region build
  /// --------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    AppProvider appProv = context.watch<AppProvider>();

    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: pages(appProv).sublist(0, stage + 1),
        ),
      ),
    );
  }

  /// endregion build
}
