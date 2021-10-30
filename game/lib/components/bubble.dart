import 'dart:ui';

import 'package:flame/components.dart';

import '../game.dart';

class Bubble extends PositionComponent with HasGameRef<GhostGame> {
  Vector2 velocity = Vector2.zero();
  static final _paint = Paint()..color = const Color(0x88FF00FF);

  Bubble(double radius) : super(priority: 5) {
    anchor = Anchor.center;
    size = Vector2.all(2 * radius);
  }

  late Vector2 acc;

  @override
  void update(double dt) {
    super.update(dt);

    final acc = this.acc = gameRef.ghost.computeEffect(position);
    velocity += acc * dt;
    position += velocity * dt + acc * dt * dt / 2;

    if (gameRef.size.toRect().intersect(size.toRect()).isEmpty) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final p = (size / 2).toOffset();
    canvas.drawCircle(p, width / 2, _paint);
  }
}
