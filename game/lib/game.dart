import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

import 'components/clock.dart';
import 'components/darkness.dart';
import 'components/enemy.dart';
import 'components/ghost.dart';
import 'data/data_loader.dart';
import 'data/stages.dart';

class GhostGame extends FlameGame with KeyboardEvents, HasCollidables {
  late final Ghost ghost;
  late final Darkness darkness;
  final StageData stage;
  late final Artboard minionArtBoard;
  late final Artboard pandaArtBoard;
  late final Artboard koalaArtBoard;

  GhostGame(this.stage);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    minionArtBoard = await loadArtboard(RiveFile.asset('assets/minion.riv'));
    pandaArtBoard = await loadArtboard(RiveFile.asset('assets/panda.riv'));
    koalaArtBoard = await loadArtboard(RiveFile.asset('assets/koala.riv'));

    camera.viewport = FixedResolutionViewport(Vector2(1600, 1690));

    add(Background(stage));

    add(darkness = Darkness());

    for (var type in stage.enemies) {
      add(RiveEnemy(enemies[type]!.loadArtboard(this), type));
    }

    add(ghost = Ghost()..position = size / 2);
    add(Clock(stage.seconds));
  }

  void stageClear() async {
    pauseEngine();

    DataLoader.data.clearLevel(stage.id);
    await DataLoader.update();

    overlays.add('stageClear');
  }

  void gameOver() {
    pauseEngine();
    overlays.add('gameOver');
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

class Background extends PositionComponent with HasGameRef<GhostGame> {
  final StageData stage;

  Background(this.stage)
      : super(
          size: Vector2(1600, 1690),
        ) {
    size = Vector2(1600, 1690);
    position = Vector2.all(0);
  }

  @override
  Future<void>? onLoad() async {
    size = Vector2(1600, 1690);
    position = Vector2.all(0);

    final bgskyArtBoard =
        await loadArtboard(RiveFile.asset('assets/bgsky.riv'));

    add(BackgroundSky(bgskyArtBoard));

    add(SpriteComponent(
      sprite: await gameRef.loadSprite(stage.background),
      priority: 0,
    ));
    return super.onLoad();
  }
}

class BackgroundSky extends RiveComponent with HasGameRef<GhostGame> {
  BackgroundSky(Artboard artboard)
      : super(
          artboard: artboard,
          priority: 0,
        );

  SMIInput<double>? _darknessProgress;

  @override
  Future<void>? onLoad() {
    size = Vector2(1600, 1690);
    position = Vector2.all(0);

    final controller = StateMachineController.fromArtboard(
      artboard,
      "progress",
    );

    print(controller);

    if (controller != null) {
      artboard.addController(controller);
      _darknessProgress = controller.findInput<double>('progress');
      _darknessProgress?.value = 0;
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    _darknessProgress?.value = gameRef.darkness.progress * 50;
    super.update(dt);
  }
}
