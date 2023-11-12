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
  runApp(viewbalance());
}

class viewbalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Title AlertDialog Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomTitleAlertDialog();
              },
            );
          },
          child: Text("Show Custom Title AlertDialog"),
        ),
      ),
    );
  }
}

class CustomTitleAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              
              SizedBox(width: 16),
              Text(
                'Current Balance',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      titlePadding: EdgeInsets.zero,
      content: Row(
        children: <Widget>[
          Text(
            'Account Balance:',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(width: 8),
          
          Text(
            'Rs 2,00,000',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'OK',
            style: TextStyle(fontSize: 16.0, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
