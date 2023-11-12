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

import 'package:flutter/material.dart';

void main() {
  runApp(Objectives());
}

class Objectives extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Objectives Page'),
          backgroundColor: Color(0xFFC7161D),
          // Add the leading back button
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Use any icon you prefer
            onPressed: () {
              Navigator.of(context).pop(); // Navigate back when the button is pressed
            },
          ),
        ),
        body: ObjectivesList(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ObjectivesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ObjectiveCard("Phone Recharge", 1, 2, true),
        ObjectiveCard("Gas bill Payment", 2, 3, true),
        ObjectiveCard("DTH Recharge", 2, 4, true),
        ObjectiveCard("Credit Card", 1, 3, true),
        ObjectiveCard("Electricity Bill Payment", 3, 4, true),
        ObjectiveCard("FASTag Recharge", 4, 5, true),
      ],
    );
  }
}

class ObjectiveCard extends StatefulWidget {
  final String title;
  final int numerator;
  final int denominator;
  final bool showButton;
  final bool isOriginal;

  ObjectiveCard(this.title, this.numerator, this.denominator, this.showButton, {this.isOriginal = true});

  @override
  _ObjectiveCardState createState() => _ObjectiveCardState();
}

class _ObjectiveCardState extends State<ObjectiveCard> {
  bool showAdditionalCards = false;
  String buttonText = "Show More";
  List<Widget> additionalCards = [];

  void toggleCards() {
    if (!showAdditionalCards) {
      int newDenominator = widget.denominator;
      for (int i = 1; i <= 3; i++) {
        newDenominator *= 2;
        additionalCards.add(ObjectiveCard(widget.title, widget.numerator, newDenominator, false, isOriginal: false));
      }

      setState(() {
        showAdditionalCards = true;
        buttonText = "Show Less";
      });
    } else {
      setState(() {
        showAdditionalCards = false;
        buttonText = "Show More";
        additionalCards.clear();
      });
    }
  }

  String formatFraction(int numerator, int denominator) {
    return '$numerator/$denominator';
  }

  Future<void> _showRewardPopup(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reward path for "${widget.title}"'),
          content: Container(
            constraints: BoxConstraints(maxHeight: 200),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Step 1 Completion: 100 points'),
                  Text('Step 2 Completion: 250 points'),
                  Text('Step 3 Completion: 500 points'),
                  Text('Step 4 Completion: 1000 points'),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardChildren = [
      Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 20.0, color: Color(0xFFC7161D)),
          ),
          Spacer(),
          if (widget.isOriginal)
            IconButton(
              icon: Icon(Icons.info),
              color: Color(0xFFC7161D),
              onPressed: () {
                _showRewardPopup(context);
              },
            ),
        ],
      ),
      SizedBox(height: 10),
      Container(
        width: 300,
        child: LinearProgressIndicator(
          value: widget.numerator / widget.denominator,
          minHeight: 10,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC7161D)),
          backgroundColor: Colors.grey,
        ),
      ),
      SizedBox(height: 10),
      Text(
        "Progress: ${formatFraction(widget.numerator, widget.denominator)}",
        style: TextStyle(fontSize: 16.0),
      ),
      SizedBox(height: 10),
    ];

    if (showAdditionalCards) {
      cardChildren.addAll(additionalCards);
    }

    if (widget.showButton) {
      cardChildren.add(
        TextButton(
          onPressed: toggleCards,
          child: Text(buttonText),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFFC7161D)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      );
    }

    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: cardChildren,
        ),
      ),
    );
  }
}
