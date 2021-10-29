import 'dart:ui';

import 'package:flame/components.dart';

class Ghost extends PositionComponent {
  static const double _radius = 30.0;
  static const double _speed = 300.0;
  static final Paint _paint = Paint()..color = const Color(0xFFFF0000);

  // current direction being pressed by the player
  final Vector2 move = Vector2.zero();

  Ghost() {
    anchor = Anchor.center;
    size = Vector2.all(_radius);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += move * _speed * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset.zero, _radius, _paint);
  }
}
