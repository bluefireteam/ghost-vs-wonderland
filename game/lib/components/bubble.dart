import 'dart:ui';

import 'package:flame/components.dart';

class Bubble extends PositionComponent with HasGameRef {
  Vector2 velocity = Vector2.zero();
  static final _paint = Paint()..color = const Color(0x88FF00FF);

  Bubble(double radius) : super(priority: 5) {
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

    canvas.drawCircle(Offset.zero, width / 2, _paint);
  }
}
