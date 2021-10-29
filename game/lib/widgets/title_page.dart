import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              child: const Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}
