import 'dart:math';

import 'package:flame/components.dart';

import '../game.dart';
import '../utils/util.dart';
import 'bubble.dart';

class EnemyData {
  final Vector2 size;
  final double speed;
  final String sprite;
  final double fireInterval;

  EnemyData({
    required this.size,
    required this.speed,
    required this.sprite,
    required this.fireInterval,
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
    fireInterval: 4,
  ),
};

class Enemy extends SpriteComponent with HasGameRef<GhostGame> {
  Enemy(this.type) : super(priority: 2);

  final random = Random();

  final EnemyType type;

  late Timer bubbleTimer;

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

    bubbleTimer = Timer(data.fireInterval, callback: _fire, repeat: true)
      ..start();

    _chooseTarget();
  }

  void _fire() {
    final color = Bubble.randomColor();
    gameRef.add(Bubble(color, 50)
      ..position = position + size / 2
      ..velocity = (random.nextAscendingVector2() - Vector2.all(0.5)) * 200);
  }

  void _chooseTarget() {
    final area = gameRef.size.x - size.x;
    target = area * random.nextDouble();
  }

  @override
  void update(double dt) {
    super.update(dt);
    bubbleTimer.update(dt);

    final dir = x < target ? 1 : -1;

    position.x += data.speed * dir * dt;

    if ((position.x - target).abs() <= 5) {
      _chooseTarget();
    }
  }
}
