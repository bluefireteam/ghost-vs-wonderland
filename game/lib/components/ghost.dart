import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import '../game.dart';
import 'minion.dart';

class Ghost extends SpriteComponent with HasGameRef<GhostGame> {
  static final Paint _auraPaint = Paint()
    ..color = const Color(0x88FFFFFF)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2.0;

  static const double _size = 400.0;
  static const double _maxSpeed = 450.0;
  static const double _acc = 350.0;
  static const double _auraStrength = 450.0;
  static const double _auraRadius = 120.0;

  // current direction being pressed by the player
  final Vector2 move = Vector2.zero();

  Vector2 speed = Vector2.zero();
  late Timer minionSpawn;

  Ghost() : super(priority: 7) {
    anchor = Anchor.center;
    size = Vector2.all(_size);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('hero.png');

    minionSpawn = Timer(4, callback: _addMinion, repeat: true)..start();
  }

  void _addMinion() {
    gameRef.add(Minion());
  }

  Vector2 computeEffect(Vector2 element) {
    final distance = element - position;
    final l = distance.length;
    if (l > _auraRadius || l == 0) {
      return Vector2.zero();
    }

    final d = l / _auraRadius;
    return distance..scaleTo(_auraStrength / (d * d));
  }

  @override
  void update(double dt) {
    super.update(dt);
    minionSpawn.update(dt);

    final targetSpeed = move.clone()..scaleTo(_maxSpeed);
    final acc = (targetSpeed - speed)..scaleTo(_acc);

    speed += acc * dt;
    position += speed * dt + acc * dt * dt / 2;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle((size / 2).toOffset(), _auraRadius, _auraPaint);
  }
}
