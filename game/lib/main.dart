import 'package:flutter/material.dart';

import 'data/data_loader.dart';
import 'theme.dart';
import 'widgets/title_page.dart';
import 'widgets/stage_select_page.dart';
import 'widgets/game_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataLoader.init();

  runApp(
    MaterialApp(
      theme: gameTheme,
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
