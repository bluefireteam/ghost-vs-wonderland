import 'package:ghost_vs_wonderland/components/enemy.dart';

class StageData {
  const StageData({
    required this.enemies,
  });

  final List<EnemyType> enemies;
}

const stages = [
  StageData(
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
  StageData(
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
  StageData(
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
