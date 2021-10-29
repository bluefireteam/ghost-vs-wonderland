import 'package:ghost_vs_wonderland/components/enemy.dart';

class StageData {
  const StageData({
    required this.enemies,
    required this.background,
  });

  final List<EnemyType> enemies;
  final String background;
}

const stages = [
  StageData(
    background: 'woods.png',
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
  StageData(
    background: 'woods.png',
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
  StageData(
    background: 'woods.png',
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
