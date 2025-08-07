import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsViewModel extends BaseViewModel {
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentThemeMode => _currentThemeMode;

  SettingsViewModel() {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('theme_mode') ?? 0;
    _currentThemeMode = ThemeMode.values[themeIndex];
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    if (_currentThemeMode == themeMode) return;

    _currentThemeMode = themeMode;

    // Save to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', themeMode.index);

    // Notify the app about theme change
    notifyListeners();

    // You'll need to implement a way to notify the main app
    // This could be through a service or state management solution
    _notifyAppThemeChange(themeMode);
  }

  void _notifyAppThemeChange(ThemeMode themeMode) {
    // This method will be implemented to communicate with the main app
    // You can use a service, event bus, or state management solution
    // For now, we'll use a simple approach with a global notifier
    ThemeService.instance.changeTheme(themeMode);
  }
}

// Theme Service to manage theme state globally
class ThemeService {
  static final ThemeService _instance = ThemeService._internal();
  static ThemeService get instance => _instance;
  ThemeService._internal();

  final ValueNotifier<ThemeMode> _themeModeNotifier = ValueNotifier(ThemeMode.system);
  ValueNotifier<ThemeMode> get themeModeNotifier => _themeModeNotifier;

  ThemeMode get currentThemeMode => _themeModeNotifier.value;

  void changeTheme(ThemeMode themeMode) {
    _themeModeNotifier.value = themeMode;
  }

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt('theme_mode') ?? 0;
    _themeModeNotifier.value = ThemeMode.values[themeIndex];
  }
}