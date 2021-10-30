import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'components/darkness.dart';
import 'components/enemy.dart';
import 'components/ghost.dart';
import 'stages.dart';

class GhostGame extends FlameGame with KeyboardEvents {
  late final Ghost ghost;
  late final Darkness darkness;
  final StageData stage;

  GhostGame(this.stage);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.viewport = FixedResolutionViewport(Vector2(1600, 1690));

    add(
      SpriteComponent(
        sprite: await loadSprite(stage.background),
        priority: 0,
      ),
    );

    add(darkness = Darkness());

    for (var type in stage.enemies) {
      add(Enemy(type));
    }

    add(ghost = Ghost()..position = size / 2);
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isDown = event is RawKeyDownEvent;
    final w = LogicalKeyboardKey.keyW;
    final a = LogicalKeyboardKey.keyA;
    final s = LogicalKeyboardKey.keyS;
    final d = LogicalKeyboardKey.keyD;
    final move = ghost.move;

    if (event.logicalKey == w) {
      if (isDown) {
        move.y = -1;
      } else if (keysPressed.contains(s)) {
        move.y = 1;
      } else {
        move.y = 0;
      }
    } else if (event.logicalKey == s) {
      if (isDown) {
        move.y = 1;
      } else if (keysPressed.contains(w)) {
        move.y = -1;
      } else {
        move.y = 0;
      }
    } else if (event.logicalKey == a) {
      if (isDown) {
        move.x = -1;
      } else if (keysPressed.contains(d)) {
        move.x = 1;
      } else {
        move.x = 0;
      }
    } else if (event.logicalKey == d) {
      if (isDown) {
        move.x = 1;
      } else if (keysPressed.contains(a)) {
        move.x = -1;
      } else {
        move.x = 0;
      }
    }

    return KeyEventResult.handled;
  }
}
