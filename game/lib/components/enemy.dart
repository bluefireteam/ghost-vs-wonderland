import 'dart:ui';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../game.dart';

class EnemyData {
  final Vector2 size;
  final double speed;
  final String sprite;

  EnemyData({
    required this.size,
    required this.speed,
    required this.sprite,
  });
}

enum EnemyType {
  panda,
}

final enemies = {
  EnemyType.panda: EnemyData(
      size: Vector2(200, 220),
      speed: 50,
      sprite: 'panda.png',
  ),
};

class Enemy extends SpriteComponent with HasGameRef<GhostGame> {
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

    sprite = await gameRef.loadSprite(data.sprite);

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
}
