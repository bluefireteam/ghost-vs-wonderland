import 'package:flutter/material.dart';

import 'widgets/title_page.dart';
import 'widgets/stage_select_page.dart';
import 'widgets/game_page.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/title': (_) => const TitlePage(),
        '/stages': (_) => const StageSelectPage(),
        '/game': (context) {
          final stageNumber = ModalRoute.of(context)?.settings.arguments as int;
          return GamePage(stageNumber: stageNumber);
        },
      },
      initialRoute: '/title',
    ),
  );
}
