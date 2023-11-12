import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './homepage/main_homepage.dart'; // Ensure this import is correct
import 'points.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const UserProfilePage());
}

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Profile',
      theme: ThemeData(
        primaryColor: Color(0xFFC7161D), // Changed to red
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pointsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Assume these are your saved values
    _nameController.text = 'Rahul Kumar';
    _phoneController.text = '9517534862';
    _addressController.text = 'India';
    _emailController.text = 'rahul_kumar@gmail.com';
    _pointsController.text = '${Points.x}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Changed to white
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            ); // Navigate to HomePage when the back arrow is pressed
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.white), // Changed to white
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
            },
          ),
        ],
        backgroundColor: Color(0xFFC7161D), // Changed to red
        elevation: 0,
      ),
      body: SingleChildScrollView( // Wrap the content in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('../assets/avatar.jpg'),
              ),
              const SizedBox(height: 20),
              itemProfile('Name', _nameController),
              const SizedBox(height: 20),
              itemProfile('Points', _pointsController),
              const SizedBox(height: 10),
              itemProfile('Phone', _phoneController),
              const SizedBox(height: 10),
              itemProfile('Address', _addressController),
              const SizedBox(height: 10),
              itemProfile('Email', _emailController),
              const SizedBox(height: 20),
              Visibility(
                visible: _isEditing,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFC7161D),
                      padding: const EdgeInsets.all(15),
                    ),
                    child: const Text(
                      'Save Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemProfile(String title, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFC7161D)),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: _isEditing
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              )
            : Text(controller.text),
        leading: Icon(title == 'Name'
            ? CupertinoIcons.person
            : title == 'Phone'
                ? CupertinoIcons.phone
                : title == 'Address'
                    ? CupertinoIcons.location
                    : title == 'Points'
                        ? Icons.star
                        : CupertinoIcons.mail),
        tileColor: Colors.white,
      ),
    );
  }

  void _saveProfile() {
    // You can implement saving the profile information here
    // For now, just updating the saved values locally
    setState(() {
      _isEditing = false;
    });

    // Display a pop-up indicating the profile has been saved
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Saved'),
          content: const Text('Your profile has been saved successfully.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
