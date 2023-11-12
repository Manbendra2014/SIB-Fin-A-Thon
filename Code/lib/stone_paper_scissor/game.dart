import 'package:flutter/material.dart';
import 'package:game/homepage/main_homepage.dart';
import '../sps_game_brain.dart';
import 'result.dart';
import '../sps_widgets/navigate_button.dart';
import '../constants.dart';
import 'dart:math';
import '../main.dart';
import '../homepage/main_homepage.dart';
import '../homepage/home_theme.dart';

enum Choice {
  rock,
  paper,
  scissors,
  empty,
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  Choice selectedChoice = Choice.empty;

  int randomChoice() {
    return Random().nextInt(3) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Your Choice'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: kLargeTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          GameBrain gameBrain = GameBrain(
                            choice: Choice.rock,
                            aiChoice: randomChoice(),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                winnerText: gameBrain.checkWinner(),
                                aiImage: gameBrain.getAiImageChoice(),
                                humanImage: kRock,
                              ),
                            ),
                          );
                        },
                        child: Image.asset(kRock),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          GameBrain gameBrain = GameBrain(
                            choice: Choice.paper,
                            aiChoice: randomChoice(),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                winnerText: gameBrain.checkWinner(),
                                aiImage: gameBrain.getAiImageChoice(),
                                humanImage: kPaper,
                              ),
                            ),
                          );
                        },
                        child: Image.asset(kPaper),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          GameBrain gameBrain = GameBrain(
                            choice: Choice.scissors,
                            aiChoice: randomChoice(),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                winnerText: gameBrain.checkWinner(),
                                aiImage: gameBrain.getAiImageChoice(),
                                humanImage: kScissors,
                              ),
                            ),
                          );
                        },
                        child: Image.asset(kScissors),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NavigateButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileApp(),
                    ),
                  );
                },              title: 'Home',
            )
          ],
        ),
      ),
    );
  }
}
