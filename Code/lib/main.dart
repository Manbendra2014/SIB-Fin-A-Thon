import 'package:flutter/material.dart';
import 'userprofile.dart'; // Import the user profile page
import 'points.dart';
import './homepage/main_homepage.dart';

void main() {
  // runApp(ProfileApp());
    runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(), // Use HomePage as the initial route
      debugShowCheckedModeBanner: false,
    );
  }
}
