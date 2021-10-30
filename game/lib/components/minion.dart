import 'dart:math';

import 'package:flame/components.dart';
import 'package:ghost_vs_wonderland/game.dart';

class Minion extends SpriteComponent with HasGameRef<GhostGame> {
  final Vector2 move = Vector2.zero();

  final speed = 50;

  Minion() : super(priority: 7) {
    anchor = Anchor.center;
    size = Vector2.all(100);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('minion.png');


    final area = gameRef.size.x - size.x;
    final random = Random();

    position.x = area * random.nextDouble();
  }

  @override
  void update(double dt) {
    super.update(dt);

    y += speed * dt;

    if (y >= gameRef.size.y) {
      shouldRemove = true;
      gameRef.darkness.increase(0.1);
    }
  }
}
