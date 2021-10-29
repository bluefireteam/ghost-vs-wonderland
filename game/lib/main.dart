import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'components/ghost.dart';
import 'components/enemy.dart';

void main() {
  runApp(GameWidget(game: GhostGame()));
}

class GhostGame extends FlameGame with KeyboardEvents {
  late final Ghost ghost;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(Enemy(EnemyType.panda));
    add(Enemy(EnemyType.panda));

    add(ghost = Ghost()..position = size / 2);
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (event is! RawKeyDownEvent) {
      return KeyEventResult.handled;
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyW)) {
      ghost.move.y = -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyS)) {
      ghost.move.y = 1;
    } else {
      ghost.move.y = 0;
    }

    if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      ghost.move.x = -1;
    } else if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      ghost.move.x = 1;
    } else {
      ghost.move.x = 0;
    }

    return KeyEventResult.handled;
  }
}
