import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';

import '../game.dart';
import '../utils/util.dart';
import 'bubble.dart';

class EnemyData {
  final Vector2 size;
  final double speed;
  final double fireInterval;
  final double rateOfFire;
  final Artboard Function(GhostGame) loadArtboard;

  EnemyData({
    required this.size,
    required this.speed,
    required this.fireInterval,
    required this.rateOfFire,
    required this.loadArtboard,
  });
}

enum EnemyType {
  panda,
  koala,
}

final enemies = {
  EnemyType.panda: EnemyData(
    size: Vector2(200, 220),
    speed: 50,
    fireInterval: 4,
    rateOfFire: 1,
    loadArtboard: (game) => game.pandaArtBoard,
  ),
  EnemyType.koala: EnemyData(
    size: Vector2(200, 220),
    speed: 50,
    fireInterval: 4,
    rateOfFire: 2,
    loadArtboard: (game) => game.koalaArtBoard,
  ),
};

class RiveEnemy extends RiveComponent with HasGameRef<GhostGame> {
  RiveEnemy(Artboard artboard, this.type) : super(artboard: artboard, priority: 2);

  final random = Random();

  final EnemyType type;

  late Timer bubbleTimer;

  late EnemyData data;
  late double target;

  late final SimpleAnimation desperate;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    data = enemies[type]!;

    size = data.size;

    final area = gameRef.size.x - size.x;
    position.x = area * random.nextDouble();
    position.y = gameRef.size.y - size.y;

    bubbleTimer = Timer(data.fireInterval, callback: _fire, repeat: true)
      ..start();

    _chooseTarget();


    // animation
    final walk = SimpleAnimation('Walk');
    artboard.addController(walk);

    desperate = SimpleAnimation('Desperate', autoplay: false);
    artboard.addController(desperate);
  }

  void _fire() {
    final color = Bubble.randomColor();
    for (var i = 0; i < data.rateOfFire; i++) {
      gameRef.add(Bubble(color, 50)
          ..position = position + size / 2
          ..velocity = (random.nextAscendingVector2() - Vector2.all(0.5)) * 200);
    }
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

    if(gameRef.darkness.progress > 0.65) {
      desperate.isActive = true;
    }
  }
}
