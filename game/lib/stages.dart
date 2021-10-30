import 'package:ghost_vs_wonderland/components/enemy.dart';

class StageData {
  const StageData({
    required this.enemies,
    required this.background,
    required this.seconds,
  });

  final List<EnemyType> enemies;
  final String background;
  final int seconds;
}

const stages = [
  StageData(
    background: 'woods.png',
    seconds: 120,
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
  StageData(
    background: 'woods.png',
    seconds: 120,
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
  StageData(
    background: 'woods.png',
    seconds: 120,
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
];
