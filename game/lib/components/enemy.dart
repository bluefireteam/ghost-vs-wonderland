import 'dart:ui';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../game.dart';

class EnemyData {
  final Vector2 size;
  final double speed;

  EnemyData({
    required this.size,
    required this.speed,
  });
}

enum EnemyType {
  panda,
}

final enemies = {
  EnemyType.panda: EnemyData(
      size: Vector2.all(100),
      speed: 50,
  ),
};

class Enemy extends PositionComponent with HasGameRef<GhostGame> {
  static final Paint _paint = Paint()..color = Colors.green;

  Enemy(this.type);

  final random = Random();

  final EnemyType type;

  late EnemyData data;
  late double target;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    data = enemies[type]!;

    size = data.size;


    final area = gameRef.size.x - size.x;
    position.x = area * random.nextDouble();
    position.y = gameRef.size.y - size.y;

    _chooseTarget();
  }

  void _chooseTarget() {
    final area = gameRef.size.x - size.x;
    target = area * random.nextDouble();
  }

  @override
  void update(double dt) {
    super.update(dt);

    final dir = x < target
        ? 1 : -1;

    position.x += data.speed * dir * dt;

    if ((position.x - target).abs() <= 5) {
      _chooseTarget();
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }
}
