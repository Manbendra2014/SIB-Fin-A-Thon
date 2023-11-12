import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LeaderBoardScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class LeaderBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
        backgroundColor: Color(0xFFC7161D),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back when the back button is pressed
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4CAF50), // Green
                  Color(0xFF009688), // Teal
                  Color(0xFF2196F3), // Blue
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF009688), // Teal
                          Color(0xFF2196F3), // Blue
                          Color(0xFF3F51B5), // Yellow
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFFC7161D), // Red
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                'Rankings',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                '',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        WinnerContainer(
                          url: '../assets/avatar.jpg',
                          winnerName: 'Rahul',
                          height: 120,
                          rank: '2',
                          points: '4500 points',
                          backgroundColor: Colors.amber, // James' background color is golden
                        ),
                        WinnerContainer(
                          isFirst: true,
                        ),
                        WinnerContainer(
                          winnerName: 'Sofiya',
                          url: '../assets/3.jpg',
                          height: 120,
                          rank: '3',
                          points: '3000 points',
                          textColor: Colors.blue, // Sofiya's text color is blue
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF009688), // Teal
                          Color(0xFF2196F3), // Blue
                          Color(0xFF3F51B5), // Yellow
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 360.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          color: Colors.white,
                        ),
                        child: GridView.count(
                          crossAxisCount: 1,
                          childAspectRatio: 3.5,
                          children: [
                            ContestantList(
                              url: '../assets/8.jpg',
                              name: 'Shona',
                              rank: '4',
                              points: '2800 points',
                            ),
                            ContestantList(
                              url: '../assets/9.jpg',
                              name: 'Emily',
                              rank: '5',
                              points: '2500 points',
                            ),
                            ContestantList(
                              url: '../assets/7.jpg',
                              name: 'Josheph',
                              rank: '6',
                              points: '2153 points',
                            ),
                            ContestantList(
                              url: '../assets/10.jpg',
                              rank: '7',
                              name: 'Kristine',
                              points: '1800 points',
                            ),
                            ContestantList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  MoreInfoButton(), // Added More Info button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WinnerContainer extends StatelessWidget {
  final bool isFirst;
  final String? winnerPosition;
  final String? url;
  final String? winnerName;
  final String? rank;
  final double? height;
  final String? points;
  final Color? textColor;
  final Color? backgroundColor;

  WinnerContainer({
    Key? key,
    this.isFirst = false,
    this.winnerPosition,
    this.winnerName,
    this.rank,
    this.height,
    this.url,
    this.points,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF009688), // Teal
                      Color(0xFF2196F3), // Blue
                      Color(0xFF3F51B5), // Yellow
                    ],
                  ),
                  border: Border.all(
                    color: Colors.amber,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    height: height ?? 150.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: backgroundColor ?? Colors.white, // Set background color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                if (isFirst)
                  Image.asset(
                    '../assets/taj.png',
                    height: 70.0,
                    width: 105.0,
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 15.0),
                  child: ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF009688), // Teal
                            Color(0xFF2196F3), // Blue
                            Color(0xFF3F51B5), // Yellow
                          ],
                        ),
                        border: Border.all(
                          color: Colors.amber,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: ClipOval(
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            url ?? '../assets/5.jpg',
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 115.0, left: 45.0),
                  child: Container(
                    height: 20.0,
                    width: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        rank ?? '1',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 150.0,
            child: Container(
              width: 100.0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      winnerName ?? 'Emma Aria',
                      style: TextStyle(
                        color: textColor ?? Colors.red,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      points ?? '5000 points',
                      style: TextStyle(
                        color: textColor ?? Colors.red,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContestantList extends StatelessWidget {
  final String? url;
  final String? name;
  final String? rank;
  final String? points;

  ContestantList({
    Key? key,
    this.url,
    this.name,
    this.rank,
    this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 5.0,
        top: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF009688), // Teal
              Color(0xFF2196F3), // Blue
              Color(0xFF3F51B5), // Yellow
            ],
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        rank ?? '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        url ?? '../assets/4.jpg',
                        height: 60.0,
                        width: 60.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? 'Name',
                        style: TextStyle(color: Colors.red),
                      ),
                      Text(
                        '@${name ?? 'Name'}',
                        style: TextStyle(color: Colors.red, fontSize: 12.0),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        points ?? '1234 points',
                        style: TextStyle(color: Colors.red),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MoreInfoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                contentTextStyle: TextStyle(color: Color(0xFFC7161D)),
                title: Text(
                  'About Leaderboards',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    bulletText('The 1st place in the leaderboard would earn 2000 points'),
                    bulletText('The 2nd place in the leaderboard would earn 1000 points'),
                    bulletText('The 3rd place in the leaderboard would earn 500 points'),
                    bulletText('Others that place in the top 10 would earn 100 points each'),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFC7161D),
                    ),
                    child: Text(
                      'Return',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFC7161D),
        ),
        child: Text(
          'More Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget bulletText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('•', style: TextStyle(fontSize: 16)),
          SizedBox(width: 8),
          Flexible(
            child: Text(text, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
