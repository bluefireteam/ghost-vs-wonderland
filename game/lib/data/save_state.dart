import 'dart:math';

import 'package:json_annotation/json_annotation.dart';

part 'save_state.g.dart';

@JsonSerializable()
class SaveState {
  int currentLevel;

  SaveState({required this.currentLevel});

  SaveState.start() : currentLevel = -1;

  bool isStageLocked(int stage) {
    final nextLevel = currentLevel + 1;
    return stage > nextLevel;
  }

  bool isStageCleared(int stage) {
    return stage <= currentLevel;
  }

  void clearLevel(int stage) {
    currentLevel = max(stage, currentLevel);
  }

  factory SaveState.fromJson(Map<String, dynamic> json) {
    return _$SaveStateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SaveStateToJson(this);
}
