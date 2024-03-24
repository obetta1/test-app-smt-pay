//ignore: unused_import
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils() {
    // init();
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<void> setThemeData(String value) {
    return _sharedPreferences!.setString('themeData', value);
  }

  Future<void> saveToken(String value) {
    return _sharedPreferences!.setString('token', value);
  }

  Future<void> saveUsername(String value) {
    return _sharedPreferences!.setString('username', value);
  }

  Future<void> saveAccessToken(String value) {
    return _sharedPreferences!.setString('accessToken', value);
  }

  Future<void> saveControllerToken(String value) {
    return _sharedPreferences!.setString('controller_token', value);
  }

  Future<void> saveEmail(String value) {
    return _sharedPreferences!.setString('email', value);
  }

  String getToken() {
    try {
      return _sharedPreferences!.getString('token')!;
    } catch (e) {
      return 'primary';
    }
  }

  String getUsername() {
    try {
      return _sharedPreferences!.getString('username')!;
    } catch (e) {
      return 'primary';
    }
  }

  String getAccessToken() {
    try {
      return _sharedPreferences!.getString('accessToken')!;
    } catch (e) {
      return 'primary';
    }
  }

  String getControllerToken() {
    try {
      return _sharedPreferences!.getString('controller_token')!;
    } catch (e) {
      return 'primary';
    }
  }

  String? getEmail() {
    try {
      return _sharedPreferences!.getString('email')!;
    } catch (e) {
      return null;
    }
  }

  String getThemeData() {
    try {
      return _sharedPreferences!.getString('themeData')!;
    } catch (e) {
      return 'primary';
    }
  }
}
