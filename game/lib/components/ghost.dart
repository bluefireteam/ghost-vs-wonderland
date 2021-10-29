import 'dart:ui';

import 'package:flame/components.dart';

class Ghost extends PositionComponent {
  static const double _radius = 30.0;
  static final Paint _paint = Paint()..color = const Color(0xFFFF0000);

  Ghost() {
    anchor = Anchor.center;
    size = Vector2.all(_radius);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(Offset.zero, _radius, _paint);
  }
}
