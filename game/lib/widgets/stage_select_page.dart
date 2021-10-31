import 'package:flutter/material.dart';
import 'package:ghost_vs_wonderland/theme.dart';

import '../data/data_loader.dart';
import '../data/stages.dart';
import 'background_container.dart';

class StageSelectPage extends StatelessWidget {
  const StageSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundContainer(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select Stage',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 32,
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
          ),
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/title');
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 32,
                color: fontColor,
              ),
            ),
          ),
        ],
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
    final card = Opacity(
      opacity: locked ? 0.6 : 1,
      child: Card(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 30,
            width: 30,
            child: locked
                ? const Icon(
                    Icons.lock,
                    color: fontColor,
                    size: 32.0,
                  )
                : Text(
                    stage.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
          ),
        ),
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
        if (cleared)
          const Positioned(
            top: 8,
            right: 8,
            child: Icon(
              Icons.check,
              color: fontColor,
              size: 16.0,
            ),
          ),
      ],
    );
  }
}
