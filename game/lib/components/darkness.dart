import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';

import '../game.dart';

class Darkness extends PositionComponent with HasGameRef<GhostGame> {
  late Paint paint;
  double progress = 0;

  Darkness() : super(priority: 2);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size.x = gameRef.size.x;

    increase(0);
  }

  void increase(double ammount) {
    progress += ammount;

    size.y = progress * gameRef.size.y;

    final rect = size.toRect();

    paint = Paint()
      ..shader = Gradient.linear(
        Offset(0, max(0, rect.bottom - 200)),
        Offset(0, rect.bottom),
        const [
          Color(0xFF000000),
          Color(0x00000000),
        ],
      );

    if (progress >= 1) {
      gameRef.stageClear();
    }
  }

  bool isIn(Vector2 element) => element.y <= size.y;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final rect = size.toRect();
    canvas.drawRect(rect, paint);
  }
}
