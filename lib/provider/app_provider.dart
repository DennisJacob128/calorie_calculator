import 'dart:convert';

import 'package:calorie_calculator/model/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  ///

  SharedPreferences? _prefs;

  static User? user;

  /// Gets stored values from prefs
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();

    String? storedUser = _prefs!.getString('user');
    if (storedUser != null) {
      user = User.fromJson(json.decode(storedUser) as Map<String, dynamic>);
    }
  }

  /// Sets user
  void setUser(User newUser) {
    user = newUser;
    _prefs?.setString('user', user!.jsonString);

    notifyListeners();
  }
}
