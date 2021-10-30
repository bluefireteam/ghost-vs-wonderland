import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'save_state.dart';

class DataLoader {
  // TODO: proper state management
  static late SaveState data;

  static Future<void> init() async {
    data = await _loadSaveState();
  }

  static Future<void> update() async {
    await _writeSaveState(data);
  }

  static Future<SaveState> _loadSaveState() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('save_state');
    if (json == null) {
      return SaveState.start();
    }
    return SaveState.fromJson(jsonDecode(json));
  }

  static Future<void> _writeSaveState(SaveState data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('save_state', jsonEncode(data.toJson()));
  }
}
