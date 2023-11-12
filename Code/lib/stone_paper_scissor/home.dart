import 'package:flutter/material.dart';
import '../sps_widgets/navigate_button.dart';
import '../sps_widgets/author.dart';
import '../sps_widgets/modal_bottom.dart';
import '../constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 12, child: Image.asset('images/background.png')),
            NavigateButton(
              onPressed: () => Navigator.pushNamed(context, '/game'),
              
              title: 'Play',
              
            ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  ModalBottom(context);
                },
                child: const Text(
                  "Instructions",
                  style: kMeduimTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Author()
          ],
        ),
      ),
    );
  }
}
