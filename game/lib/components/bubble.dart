import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';

import '../game.dart';
import '../utils/util.dart';

class Bubble extends PositionComponent
    with HasGameRef<GhostGame>, Hitbox, Collidable {
  static const double _darknessDecreaseRate = 5.0;

  late double _radius;
  double get radius => _radius;
  set radius(double radius) {
    _radius = radius;
    size = Vector2.all(2 * radius);
    recomputePaints();
  }

  Vector2 velocity = Vector2.zero();
  Color color;
  late Paint innerPaint;
  late Paint outerPaint;

  @override
  Bubble(this.color, double radius) : super(priority: 5) {
    anchor = Anchor.center;
    this.radius = radius;
  }

  void recomputePaints() {
    if (radius <= 0) {
      return;
    }

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

    if (gameRef.darkness.isIn(position)) {
      radius -= _darknessDecreaseRate * dt;
      if (radius <= 0) {
        removeFromParent();
        return;
      }
    }

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
