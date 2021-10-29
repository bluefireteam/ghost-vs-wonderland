import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class Ghost extends PositionComponent {
  static const double _radius = 30.0;
  static const double _maxSpeed = 350.0;
  static const double _acc = 250.0;

  static final Paint _paint = Paint()..color = const Color(0xFFFF0000);

  // current direction being pressed by the player
  final Vector2 move = Vector2.zero();

  Vector2 speed = Vector2.zero();

  Ghost() {
    anchor = Anchor.center;
    size = Vector2.all(_radius);
  }

  @override
  void update(double dt) {
    super.update(dt);

    final targetSpeed = move.clone()..scaleTo(_maxSpeed);
    final acc = (targetSpeed - speed)..scaleTo(_acc);

    speed += acc * dt;
    position += speed * dt + acc * dt * dt / 2;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset.zero, _radius, _paint);
  }
}
