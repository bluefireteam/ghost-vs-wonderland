import 'package:flutter/material.dart';

import '../theme.dart';
import 'background_container.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        background: 'assets/images/titlebg.jpg',
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/images/titleheroes.png'),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(height: 48),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/stages');
                    },
                    child:
                        const Text('Play', style: TextStyle(color: fontColor)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset('assets/images/titleenemies.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
