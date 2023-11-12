import 'package:flutter/material.dart';
import '../../minigames/minigames.dart';
import '../../homepage/main_homepage.dart';
import 'quiz_screen.dart'; // Ensure this import is correct


class PreQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pre Quiz Screen'),
        backgroundColor: Color(0xFFC7161D),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => MakeDashboardItems()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => HomeScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => QuizScreen()),
            );
          },
          child: Container(
            height: 45,
            width: 250,
            decoration: BoxDecoration(
                color: Color(0xFFC7161D),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(
              child: Text(
                'Start Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
