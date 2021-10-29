import 'dart:ui';

import 'package:flame/components.dart';

class Bubble extends PositionComponent with HasGameRef {
  Vector2 velocity = Vector2.zero();

  Bubble(double radius) {
    anchor = Anchor.center;
    size = Vector2.all(2 * radius);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;

    if (gameRef.size.toRect().intersect(size.toRect()).isEmpty) {
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()..color = const Color(0x88FF00FF);
    canvas.drawCircle(Offset.zero, width / 2, paint);
  }
}
