import 'package:flutter/material.dart';

import '../theme.dart';
import 'background_container.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BackgroundContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ghost Vs Wonderland',
                style: Theme.of(context).textTheme.headline3,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/stages');
                },
                child: const Text('Play', style: TextStyle(color: fontColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
