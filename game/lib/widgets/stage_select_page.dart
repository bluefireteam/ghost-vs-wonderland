import 'package:flutter/material.dart';

import '../data/data_loader.dart';
import '../data/stages.dart';

class StageSelectPage extends StatelessWidget {
  const StageSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Stage',
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: stages.map((stage) {
                return LevelCard(
                  stage: stage,
                  locked: DataLoader.data.isStageLocked(stage.id),
                  cleared: DataLoader.data.isStageCleared(stage.id),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelCard extends StatelessWidget {
  final StageData stage;
  final bool locked;
  final bool cleared;

  const LevelCard({
    Key? key,
    required this.stage,
    required this.locked,
    required this.cleared,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final card = Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(stage.name),
      ),
    );
    final wrappedCard = locked
        ? card
        : InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/game', arguments: stage.id);
            },
            child: card,
          );
    return Stack(
      alignment: Alignment.center,
      children: [
        wrappedCard,
        if (locked)
          const Icon(
            Icons.lock,
            color: Colors.black,
            size: 32.0,
          ),
        if (cleared)
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.check,
              color: Colors.green,
              size: 16.0,
            ),
          ),
      ],
    );
  }
}
