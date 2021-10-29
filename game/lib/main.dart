import 'package:flame/game.dart';
import 'package:flutter/material.dart' show runApp;

void main() {
  runApp(GameWidget(game: GhostGame()));
}

class GhostGame extends FlameGame {}
