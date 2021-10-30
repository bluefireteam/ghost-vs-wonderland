import 'package:flame/components.dart';
import 'package:ghost_vs_wonderland/game.dart';

import 'dart:math';
import 'dart:ui';

class Darkness extends PositionComponent with HasGameRef<GhostGame> {

  late Paint paint;
  double _progress = 0;

  Darkness(): super(priority: 6);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size.x = gameRef.size.x;

    increase(0);
  }

  void increase(double ammount) {
    _progress += ammount;

    size.y = _progress * gameRef.size.y;

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

    if (_progress >= 1) {
      gameRef.stageClear();
    }
  }


  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final rect = size.toRect();
    canvas.drawRect(rect, paint);
  }
}
