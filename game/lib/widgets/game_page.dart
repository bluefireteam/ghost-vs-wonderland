import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:ghost_vs_wonderland/stages.dart';

import '../game.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    Key? key,
    required this.stageNumber,
  }) : super(key: key);

  final int stageNumber;

  @override
  Widget build(BuildContext context) {
    final stage = stages[stageNumber];

    return GameWidget(
        game: GhostGame(stage),
    );
  }
}
