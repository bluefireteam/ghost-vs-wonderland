import 'dart:ui';

import 'package:flame/components.dart';
import 'package:ghost_vs_wonderland/theme.dart';

import '../game.dart';

class Clock extends PositionComponent with HasGameRef<GhostGame> {
  static final _paint = Paint()..color = backgroundColor;
  static final _padding = Vector2(30, 5);

  late int _seconds;
  late TextPaint _textPaint;

  late Timer _ticker;

  Clock(int seconds)
      : _seconds = seconds,
        super(priority: 4);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _textPaint = TextPaint(
      config: const TextPaintConfig(
        color: fontColor,
        fontFamily: fontFamily,
        fontSize: 48,
      ),
    );

    size = Vector2(130, 60);

    position = Vector2(20, 20);

    _ticker = Timer(1, callback: _tick, repeat: true)..start();
  }

  void _tick() {
    if (_seconds >= 1) {
      _seconds--;
    } else {
      gameRef.gameOver();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    _ticker.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final rect = toRect();
    canvas.drawRect(rect, _paint);
    _textPaint.render(canvas, '$_seconds', position + _padding);
  }
}
