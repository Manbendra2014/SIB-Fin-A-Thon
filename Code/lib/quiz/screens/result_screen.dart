import 'package:flutter/material.dart';
import '../models/questions.dart';
import '../screens/quiz_screen.dart';
import '../screens/pre_quiz_screen.dart';  // Import the PreQuizScreen
import '../../minigames/minigames.dart';  // Import the mini games screen
import '../../homepage/main_homepage.dart';  // Import the home screen
import '../widgets/next_button.dart';
import '../../points.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  void updatePoints(BuildContext context) {
    // Assuming `submitted` is a global variable
    Points.x += score * 5;
  }

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = questions.length;
    final int incorrect = totalQuestions - score;
    final double correctPercentage = (score / totalQuestions) * 100;
    final double incorrectPercentage = (incorrect / totalQuestions) * 100;

    final int awardedPoints = score * 5;  // 5 points for each correct answer

    updatePoints(context);  // Call the function to update points

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC7161D),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MakeDashboardItems()),  // Navigate to mini games screen
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),  // Navigate to home screen
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 1000),
          Text(  // Updated text widget
            'Your Score : $awardedPoints Points',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: score / totalQuestions,
                  color: Colors.green,
                  backgroundColor: Colors.red,
                ),
              ),
              Column(
                children: [
                  Text(
                    '$score Correct (${correctPercentage.round()}%)',
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '$incorrect Incorrect (${incorrectPercentage.round()}%)',
                    style: const TextStyle(fontSize: 20, color: Colors.red),
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreQuizScreen()),  // Navigate to PreQuizScreen
              );
            },
            child: Container(
              height: 45,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xFFC7161D),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Try Again',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}