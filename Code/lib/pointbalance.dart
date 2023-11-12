import 'package:flutter/material.dart';
import 'points.dart'; // Import the Points class from the points.dart directory

class CustomTitleAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(width: 16),
              Text(
                'Current Balance',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      titlePadding: EdgeInsets.zero,
      content: Row(
        children: <Widget>[
          Text(
            'Account Balance:',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(width: 8),
          Text(
            'Rs ${Points.x}', // Use Points.x to display the balance
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.green,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'OK',
            style: TextStyle(fontSize: 16.0, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
