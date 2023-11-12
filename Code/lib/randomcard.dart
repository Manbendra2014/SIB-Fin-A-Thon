import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'points.dart';
import 'minigames.dart';
import './homepage/main_homepage.dart';

void main() {
  runApp(CardApp());
}

class CardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/game': (context) => GamePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flipping Fantasia'),
        backgroundColor: Color(0xFFC7161D),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 45,
          width: 250,
          decoration: BoxDecoration(
            color: Color(0xFFC7161D), 
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/game');
            },
            child: Text(
              'Play Game',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}


class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Clash : Game Ground'),
        centerTitle: true,
        backgroundColor: Color(0xFFC7161D),
        automaticallyImplyLeading: false,  // This line hides the automatic back button
      ),
      body: Center(
        child: GameCards(),
      ),
    );
  }
}



class GameCards extends StatefulWidget {
  @override
  _GameCardsState createState() => _GameCardsState();
}

class _GameCardsState extends State<GameCards> with SingleTickerProviderStateMixin {
  List<String> imageOptions = [
    '../assets/blnt.png',
    '../assets/x2.png',
    '../assets/blnt.png',
    '../assets/x2.png'
  ];

  List<String> imagePaths = List.filled(4, '../assets/question.png');
  static bool isAnyCardClicked = false;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    startNewGame(); // Initialize the game

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation has completed, show the pop-up.
        Future.delayed(Duration(seconds: 1), () {
          _showPopup(imagePaths[0]);
        });
      }
    });
  }

  void startNewGame() {
    // Shuffle the image options randomly.
    imageOptions.shuffle();

    _animateCards();

    // Reset the game state.
    isAnyCardClicked = false;
  }

  void _animateCards() {
    setState(() {
      for (int i = 0; i < 4; i++) {
        imagePaths[i] = '../assets/question.png';
      }
    });
  }

  void toggleImage(int index) {
    if (!isAnyCardClicked && imagePaths[index] == '../assets/question.png') {
      // Shuffle the images every time a card is clicked
      imageOptions.shuffle();
      final random = Random();
      final selectedImage = imageOptions[random.nextInt(imageOptions.length)];
      imagePaths[index] = selectedImage;
      isAnyCardClicked = true;
      setState(() {});
      // Show the result popup immediately after a card is clicked
      _showPopup(selectedImage);
    }
  }

  void _showPopup(String selectedImage) {
    String resultText;
    switch (selectedImage) {
      case '../assets/blnt.png':
        resultText = 'Better Luck Next Time.';
        break;
      case '../assets/x2.png':
        resultText = 'Your points have been doubled.';
        Points.x = Points.x * 2;
        break;
      default:
        resultText = 'Unknown Result.';
        break;
    }

    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) {
        return AlertDialog(
          title: Text('Result'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(resultText),
              SizedBox(height: 16),
              Text('Total Points : ${Points.x}'),
              SizedBox(height: 16),
              Center(
                child: Container(
                  height: 25,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFFC7161D), 
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: Text(
                      'Home',
                      style: TextStyle(color: Colors.white,fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(0),
              CardWidget(1),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWidget(2),
              CardWidget(3),
            ],
          ),
        ],
      ),
    );
  }

  Widget CardWidget(int index) {
    return GestureDetector(
      onTap: () => toggleImage(index),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Hero(
          tag: 'cardImage$index',
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Container(
              key: ValueKey<String>(imagePaths[index]),
              width: 175,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePaths[index]),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
