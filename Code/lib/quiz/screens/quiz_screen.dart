import 'package:flutter/material.dart';
import 'dart:async';

import '../models/questions.dart';
import '../screens/result_screen.dart';
import '../widgets/answer_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  int timerValue = 10;
  Timer? timer;

  void startTimer() {
    timerValue = 10;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerValue > 0) {
          timerValue--;
        } else {
          timer.cancel();
          Future.delayed(Duration(seconds: 1), goToNextQuestion);
        }
      });
    });
  }

  void pickAnswer(int value) {
    timer?.cancel();
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
    Future.delayed(Duration(seconds: 1), goToNextQuestion);
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
      setState(() {
        timerValue = 10;
      });
      startTimer();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: score,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFAFAFA),Color(0xFFF5F5F5),Color(0xFFF0F0F0),Color(0xFFE0E0E0),Color(0xFFD3D3D3),Color(0xFFDCDCDC),Color(0xFFD3D3D3),Color(0xFFC0C0C0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 10, end: timerValue.toDouble()),
                  duration: Duration(seconds: 1),
                  builder: (context, value, child) {
                    return LinearProgressIndicator(
                      value: value / 10,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.lerp(Colors.green, Colors.red, 1 - value / 10)!),
                    );
                  },
                ),
                Text(
                  'Time : $timerValue',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 21,
                  ),
                  textAlign: TextAlign.center,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: selectedAnswerIndex == null
                          ? () => pickAnswer(index)
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: AnswerCard(
                          currentIndex: index,
                          question: question.options[index],
                          isSelected: selectedAnswerIndex == index,
                          selectedAnswerIndex: selectedAnswerIndex,
                          correctAnswerIndex: question.correctAnswerIndex,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
