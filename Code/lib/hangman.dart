import 'package:flutter/material.dart';
import 'points.dart'; // Import the Points class from points.dart
import 'minigames/minigames.dart';

void main() {
  runApp(MaterialApp(
    home: HangmanGame(),
  ));
}

class HangmanGame extends StatefulWidget {
  @override
  _HangmanGameState createState() => _HangmanGameState();
}

class _HangmanGameState extends State<HangmanGame> {
  String wordToGuess = "TRANSACTION"; // Replace with the actual word to guess
  Set<String> guessedLetters = Set();
  int hangmanImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    String displayedWord = wordToGuess
        .split('')
        .map((letter) => guessedLetters.contains(letter) ? letter : '_')
        .join(' ');
    // Points.x += 10;

    bool isGameOver = !displayedWord.contains('_');
    if(isGameOver){
      Points.x = Points.x + 10;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Hangman'),
        backgroundColor: Color(0xFFC7161D),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isGameOver)
              Column(
                children: [
                  Text(
                    'Congratulations',
                    style: TextStyle(fontSize: 20, color: Color(0xFFC7161D)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _tryAgain,
                        child: Text('Try Again'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: _playOtherGames,
                        child: Text('Play Other Mini Games'),
                      ),
                    ],
                  ),
                ],
              )
            else
              Column(
                children: [
                  Text(
                    "Word to Guess: $displayedWord",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    '../assets/hangman_$hangmanImageIndex.png',
                    height: 200,
                  ),
                ],
              ),
            SizedBox(height: 20),
            if (!isGameOver && displayedWord != wordToGuess)
              AlphabetKeyboard(
                guessedLetters: guessedLetters,
                handleButtonPress: handleButtonPress,
              ),
          ],
        ),
      ),
    );
  }

  void handleButtonPress(String letter) {
    if (guessedLetters.contains(letter)) return;

    setState(() {
      guessedLetters.add(letter);
      if (!wordToGuess.contains(letter)) {
        hangmanImageIndex++;
        if (hangmanImageIndex >= 6) {
          _showGameOverAndNavigate();
        }
      }
    });
  }

  void _tryAgain() {
    setState(() {
      guessedLetters.clear();
      hangmanImageIndex = 0;
    });
  }

  void _playOtherGames() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MakeDashboardItems()),
    );
  }

  void _showGameOverAndNavigate() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('You lost the game!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _tryAgain();
              },
              child: Text('Try Again'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _playOtherGames();
              },
              child: Text('Play Other Mini Games'),
            ),
          ],
        );
      },
    );
  }

  void _showWinDialog() {
    // Show a dialog when the user wins and update points.x
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations'),
          content: Text('You won the game!'),
          actions: [
            TextButton(
              onPressed: () {
                // Points.updatePoints(5);
                Navigator.pop(context);
                // Points.updatePoints(5);
                _tryAgain();
                // Points.updatePoints(100);
                // Points.updatePoints(5); // Add 5 points
              },
              child: Text('Play Again'),
            ),
            TextButton(
              onPressed: () {
                // Points.updatePoints(5);
                Navigator.pop(context);
                // Points.updatePoints(5);
                _playOtherGames();
              },
              child: Text('Play Other Mini Games'),
            ),
          ],
        );
      },
    );
  }
}

class AlphabetKeyboard extends StatelessWidget {
  final List<String> alphabet = List.generate(26, (index) {
    return String.fromCharCode('A'.codeUnitAt(0) + index);
  });

  final Set<String> guessedLetters;
  final Function(String) handleButtonPress;

  AlphabetKeyboard(
      {required this.guessedLetters, required this.handleButtonPress});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: alphabet
          .map(
            (letter) => HangmanKeyboardButton(
              letter: letter,
              onPressed: () => handleButtonPress(letter),
              isUsed: guessedLetters.contains(letter),
            ),
          )
          .toList(),
    );
  }
}

class HangmanKeyboardButton extends StatefulWidget {
  final String letter;
  final VoidCallback onPressed;
  bool isUsed;

  HangmanKeyboardButton(
      {required this.letter, required this.onPressed, required this.isUsed});

  @override
  _HangmanKeyboardButtonState createState() => _HangmanKeyboardButtonState();
}

class _HangmanKeyboardButtonState extends State<HangmanKeyboardButton> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor = widget.isUsed ? Colors.grey : Color(0xFFC7161D);

    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: widget.isUsed
            ? null
            : () {
                setState(() {
                  widget.isUsed = true;
                });
                widget.onPressed();
              },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        ),
        child: Text(widget.letter),
      ),
    );
  }
}