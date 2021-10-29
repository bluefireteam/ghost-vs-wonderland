import 'package:flame/game.dart';
import 'package:flutter/material.dart' show runApp;

import 'components/ghost.dart';

void main() {
  runApp(GameWidget(game: GhostGame()));
}

class GhostGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(Ghost()..position = size / 2);
  }
}
