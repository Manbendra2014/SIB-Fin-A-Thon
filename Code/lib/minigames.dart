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
import 'stone_paper_scissor_main.dart';
import 'randomcard.dart';

void main() {
  runApp(MaterialApp(
    home: MiniGamesPage(),
  ));
}

class MiniGamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Games'),
        backgroundColor: Color(0xFFC7161D),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display the current points
              Text(
                'Points: ${Points.x}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              MiniGameButton(
                imageAsset: '../assets/quiz1.jpg',
                label: 'Quiz!',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreQuizScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              MiniGameButton(
                imageAsset: '../assets/hangman.png',
                label: 'Hangman',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HangmanGame(),
                    ),
                  );
                },
              ),
              SizedBox(height: 8),
              MiniGameButton(
                imageAsset: '../assets/cw.jpg',
                label: 'RockPaperScissor',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardApp(),    //--------- Card Flip
                      // builder: (context) =>
                          // App(), //--------- Stone Paper Scissor
                    ),
                  );
                },
              ),
              // Add more MiniGameButton widgets for additional games
            ],
          ),
        ),
      ),
    );
  }
}

class MiniGameButton extends StatelessWidget {
  final String imageAsset;
  final String label;
  final VoidCallback onPressed;

  MiniGameButton({
    required this.imageAsset,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          padding: EdgeInsets.all(0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imageAsset,
              height: 140,
              width: 140,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
