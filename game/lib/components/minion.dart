import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:ghost_vs_wonderland/components/bubble.dart';
import 'package:ghost_vs_wonderland/game.dart';

class Minion extends SpriteComponent with HasGameRef<GhostGame>, Hitbox, Collidable {
  final Vector2 move = Vector2.zero();

  final speed = 250;

  Minion() : super(priority: 7) {
    anchor = Anchor.center;
    size = Vector2.all(100);
    addHitbox(HitboxRectangle(relation: Vector2(0.8, 0.8)));
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
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is Bubble) {
      shouldRemove = true;
      // TODO should we add more effects here?
    }
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
