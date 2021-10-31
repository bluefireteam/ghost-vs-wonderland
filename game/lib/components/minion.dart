import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';

import '../game.dart';
import 'bubble.dart';

class Minion extends RiveComponent
    with HasGameRef<GhostGame>, Hitbox, Collidable {
  final Vector2 move = Vector2.zero();

  final speed = 250;

  Minion(Artboard artboard)
      : super(
          artboard: artboard,
          priority: 7,
        ) {
    anchor = Anchor.center;
    size = Vector2.all(100);
    addHitbox(HitboxRectangle(relation: Vector2(0.8, 0.8)));
  }

  @override
  Future<void>? onLoad() async {
    final controller = SimpleAnimation('Animation 1');
    artboard.addController(controller);

    final area = gameRef.size.x - size.x;
    final random = Random();
    angle = pi/2;
    position.x = area * random.nextDouble();
    return super.onLoad();
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

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if (other is Bubble) {
      shouldRemove = true;
      // TODO should we add more effects here?
    }
  }
}
