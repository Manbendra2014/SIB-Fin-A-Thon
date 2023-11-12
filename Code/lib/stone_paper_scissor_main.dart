import 'package:flutter/material.dart';
import 'hangman.dart'; // Import the Hangman game page
import '../quiz/screens/pre_quiz_screen.dart';
import 'points.dart';
import 'sps_game_brain.dart';
import 'constants.dart';
import 'sps_widgets/author.dart';
import 'sps_widgets/modal_bottom.dart';
import 'sps_widgets/navigate_button.dart';
import 'sps_theme/sps_theme.dart';
import 'stone_paper_scissor/game.dart';
import 'stone_paper_scissor/home.dart';
import 'stone_paper_scissor/result.dart';

void main1() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/game': (context) => const Game(),
      },
    );
  }
}
