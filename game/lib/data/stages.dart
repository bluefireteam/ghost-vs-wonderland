import '../components/enemy.dart';

class StageData {
  const StageData({
    required this.id,
    required this.enemies,
    required this.background,
    required this.seconds,
  });

  final int id;
  final List<EnemyType> enemies;
  final String background;
  final int seconds;

  String get name => (id + 1).toString();
}

const stages = [
  StageData(
    id: 0,
    background: 'bgground.png',
    seconds: 120,
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
  StageData(
    id: 1,
    background: 'bgground.png',
    seconds: 120,
    enemies: [
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
      EnemyType.panda,
    ],
  ),
  StageData(
    id: 2,
    background: 'bgground.png',
    seconds: 220,
    enemies: [
      EnemyType.koala,
      EnemyType.koala,
      EnemyType.koala,
    ],
  ),
  StageData(
    id: 3,
    background: 'bgground.png',
    seconds: 220,
    enemies: [
      EnemyType.panda,
      EnemyType.koala,
      EnemyType.koala,
      EnemyType.koala,
      EnemyType.panda,
    ],
  ),
];
