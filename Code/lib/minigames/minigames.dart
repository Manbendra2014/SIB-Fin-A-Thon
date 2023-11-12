import 'package:flutter/material.dart';
import '../hangman.dart';
import '../quiz/screens/pre_quiz_screen.dart';
import '../roadmap.dart';
import '../leaderboard.dart';

class MakeDashboardItems extends StatefulWidget {
  const MakeDashboardItems({Key? key}) : super(key: key);

  @override
  _MakeDashboardItemsState createState() => _MakeDashboardItemsState();
}

class _MakeDashboardItemsState extends State<MakeDashboardItems> {
  Card makeDashboardItem(String title, String img, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: index == 2
              ? const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [Color(0xFFC7161D), Colors.white],
                )
              : const LinearGradient(
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(3.0, -1.0),
                  colors: [Color(0xFFC7161D), Colors.white],
                ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            // Handle onTap based on the index
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HangmanGame()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PreQuizScreen()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaderBoardScreen()),
                );
                break;
              case 3:
Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Roadmap()),
                );
                break;
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  img,
                  height: 60,
                  width: 100,
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Games'),
        backgroundColor: Color(0xFFC7161D),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),  // Use any icon you prefer
          onPressed: () {
            Navigator.of(context).pop();  // Navigate back when the button is pressed
          },
        ),
      ),
      backgroundColor: Colors.white,  // Set the background color to white
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.0,  // Aspect ratio for the top elements
              padding: const EdgeInsets.all(2),
              children: [
                makeDashboardItem("Hangman", "../assets/hangman.jpg", 0),
                makeDashboardItem("Quiz", "../assets/quiz.jpg", 1),
                makeDashboardItem(
                    "Leaderboards", "../assets/leaderboards.png", 2),
                makeDashboardItem(
                    "Journey Roadmap", "../assets/roadmap.png", 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
