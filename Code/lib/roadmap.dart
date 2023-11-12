import 'package:flutter/material.dart';
import 'hangman.dart'; 
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

void main() => runApp(Roadmap());

class Roadmap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Roadmap'),
          backgroundColor: Color(0xFFC7161D),
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Use any icon you prefer
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back when the button is pressed
            },
          ),
        ),
        body: ImageScroller(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


class ImageScroller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset('../assets/roadmap_new.png'),
          Padding(
            padding: const EdgeInsets.all(16.0),
          ),
        ],
      ),
    );
  }
}
