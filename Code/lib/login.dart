import 'package:flutter/material.dart';
import './homepage/main_homepage.dart';
import 'points.dart';

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(" SIB Mirror +"),
        backgroundColor: Color(0xFFC7161D),
         automaticallyImplyLeading: false,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: (_emailFocusNode.hasFocus || _passwordFocusNode.hasFocus) ? Color(0xFFC7161D) : null,
            ),
          ),
        ),
        child: Padding(  // Add padding at the top
          padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('../assets/banklogoo.png')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    focusNode: _emailFocusNode,
                    cursorColor: Color(0xFFC7161D),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC7161D)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC7161D)),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xFFC7161D)),
                      hintText: 'Enter your email address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email address is empty';
                      }

                      String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp regex = RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return 'Invalid email address';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: TextFormField(
                    focusNode: _passwordFocusNode,
                    cursorColor: Color(0xFFC7161D),  // Set cursor color to red
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC7161D)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFC7161D)),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xFFC7161D)),
                      hintText: 'Enter your password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is empty';
                      }
                      return null;
                    },
                  ),
                ),
                
                Container(
                  height: 45,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Color(0xFFC7161D), borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (_) => HomeScreen()));
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      // Handle forgot password tap
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: Color(0xFFC7161D),
                      ),
                    ),
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