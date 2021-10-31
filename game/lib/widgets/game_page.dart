import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../data/stages.dart';
import '../game.dart';
import '../theme.dart';
import 'modal_container.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    Key? key,
    required this.stageNumber,
  }) : super(key: key);

  final int stageNumber;

  @override
  Widget build(BuildContext context) {
    final stage = stages[stageNumber];

    return Scaffold(
      body: Stack(
        children: [
          GameWidget(
            game: GhostGame(stage),
            overlayBuilderMap: {
              'stageClear': (context, game) {
                return Center(
                  child: ModalContainer(
                    width: 400,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Stage clear!',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'You brought darkness into the world!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/stages');
                          },
                          child: const Text('Awesome!',
                              style: TextStyle(color: fontColor)),
                        ),
                      ],
                    ),
                  ),
                );
              },
              'gameOver': (context, game) {
                return Center(
                  child: ModalContainer(
                    width: 400,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Game Over!',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'You failed in the face of good!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/stages');
                          },
                          child: const Text('Okay :(',
                              style: TextStyle(color: fontColor)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            },
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/title');
              },
              icon: const Icon(
                Icons.close,
                size: 32,
                color: backgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
