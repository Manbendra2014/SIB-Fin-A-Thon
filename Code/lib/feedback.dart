import 'package:flutter/material.dart';

void main() {
  runApp(ObjectivesPage());
}

class ObjectivesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Feedback and Support Page'),
          backgroundColor: Color(0xFFC7161D),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
        ),
        body: ObjectivesList(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ObjectivesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ObjectiveCard("Customer Care Center", true),
        ObjectiveCard("Internet Banking", true),
        ObjectiveCard("Mobile Banking", true),
        FeedbackInput(),
      ],
    );
  }
}

class ObjectiveCard extends StatefulWidget {
  final String title;
  final bool showButton;
  final bool isOriginal;

  ObjectiveCard(this.title, this.showButton, {this.isOriginal = true});

  @override
  _ObjectiveCardState createState() => _ObjectiveCardState();
}

class _ObjectiveCardState extends State<ObjectiveCard> {
  bool showAdditionalCards = false;
  bool showUpwardArrow = false;
  List<Widget> additionalCards = [];
  bool isFirstPress = true;

  Widget _buildAdditionalCard(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.all(16.0),
      width: 300,
      height: 100,
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  void toggleCards() {
    setState(() {
      if (isFirstPress) {
        additionalCards.clear();
        for (int i = 1; i <= 1; i++) {
          additionalCards.add(_buildAdditionalCard("Customercare@sib"));
        }
        isFirstPress = false;
      } else {
        additionalCards.clear();
        isFirstPress = true;
      }
      showUpwardArrow = !showUpwardArrow;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cardChildren = [
      Text(
        widget.title,
        style: TextStyle(fontSize: 16.0, color: Color(0xFFC7161D)),
      ),
      SizedBox(height: 10),
    ];

    if (showAdditionalCards) {
      for (int i = 1; i <= 2; i++) {
        additionalCards.add(_buildAdditionalCard("Additional Card $i"));
      }
    }

    if (widget.showButton) {
      cardChildren.add(
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: showUpwardArrow
                ? Icon(Icons.arrow_drop_up)
                : Icon(Icons.arrow_drop_down),
            onPressed: toggleCards,
            iconSize: 36.0,
            color: Color(0xFFC7161D),
          ),
        ),
      );
    }

    cardChildren.addAll(additionalCards);

    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: cardChildren,
        ),
      ),
    );
  }
}

class FeedbackInput extends StatefulWidget {
  @override
  _FeedbackInputState createState() => _FeedbackInputState();
}

class _FeedbackInputState extends State<FeedbackInput> {
  final feedbackController = TextEditingController();

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  void submitFeedback() {
    final feedbackText = feedbackController.text;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Feedback Submitted'),
            content: Text('Thank you for your feedback: $feedbackText'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Feedback',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFC7161D)),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TextFormField(
                    controller: feedbackController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFC7161D),
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              onPressed: submitFeedback,
              child: Text(
                'Submit Feedback',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
