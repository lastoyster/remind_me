import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage(); // Renamed _switch to _box for clarity
  final _key = 'isDarkMode';  // Renamed _key for better readability

  bool _loadThemeStatus() {  // Renamed _themeStatus for better readability
    final value = _box.read(_key);
    return value is bool ? value : false; // Check if value is a boolean, else use false as default
  }

  void _saveThemeStatus(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }

  ThemeMode get theme => _loadThemeStatus() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    final newThemeMode = _loadThemeStatus() ? ThemeMode.light : ThemeMode.dark;
    Get.changeThemeMode(newThemeMode);
    _saveThemeStatus(! _loadThemeStatus()); // Update the stored value
  }
}
