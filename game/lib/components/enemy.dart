import 'dart:ui';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:ghost_vs_wonderland/main.dart';

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

  final EnemyType type;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final data = enemies[type]!;

    size = data.size;

    final random = Random();

    final area = gameRef.size.x - size.x;
    position.x = area * random.nextDouble();
    position.y = gameRef.size.y - size.y;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }
}
