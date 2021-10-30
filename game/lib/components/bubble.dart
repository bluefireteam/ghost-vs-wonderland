import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

import '../game.dart';
import '../utils/util.dart';

class Bubble extends PositionComponent
    with HasGameRef<GhostGame>, Hitbox, Collidable {
  Vector2 velocity = Vector2.zero();
  late Paint innerPaint;
  late Paint outerPaint;

  Bubble(Color color, double radius) : super(priority: 5) {
    anchor = Anchor.center;
    size = Vector2.all(2 * radius);

    innerPaint = Paint()
      ..shader = Gradient.radial(
        Vector2.all(radius).toOffset(),
        radius,
        [
          color.withAlpha(50),
          color.withAlpha(150),
        ],
      );

    outerPaint = Paint()
      ..color = color.withAlpha(200)
      ..maskFilter = const MaskFilter.blur(BlurStyle.outer, 20);

    addHitbox(HitboxCircle());
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
    final radius = width / 2;

    canvas.drawCircle(p, radius, innerPaint);
    canvas.drawCircle(p, radius, outerPaint);
  }

  static Color randomColor() {
    return [
      const Color(0xFFFF0000),
      const Color(0xFF00FF00),
      const Color(0xFF0000FF),
    ].sample();
  }
}
