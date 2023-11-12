import 'package:flutter/material.dart';
import 'randomcard.dart';
import 'points.dart';
import 'dart:math';
import 'stone_paper_scissor_main.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: MoneyTransfer(),
  ));
}

class MoneyTransfer extends StatefulWidget {
  @override
  _MoneyTransferState createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransfer> {
  bool formSubmitted = false;
  int awardedPoints = 0;
  bool acceptTerms = false;
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund Transfer'),
        backgroundColor: Color(0xFFC7161D),
      ),
      body: formSubmitted
          ? ThankYouPage(awardedPoints: awardedPoints)
          : ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Container(
                      height: 30,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          color: Color(0xFFC7161D),
                          width: 2,
                        ),
                      ),
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          "Send Money Instantly",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC7161D),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                _buildInputField("Name", "Enter Name"),
                _buildInputField("Bank", "Enter Bank Name"),
                _buildInputField("Account Number", "Enter Account Number"),
                _buildAmountInputField("Amount", "Enter Amount"),
                _buildInputField("Remarks", "Enter Remark"),
                _buildAcceptTermsCheckbox(),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 45,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xFFC7161D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: _continueButtonPressed,
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    height: 45,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color(0xFFC7161D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Note: Money transfer will reward depending upon your transaction amount.",
                      style: TextStyle(fontStyle: FontStyle.italic),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void _continueButtonPressed() {
    if (acceptTerms) {
      int amount = int.tryParse(amountController.text) ?? 0;

      if (amount <= 1000) {
        awardedPoints = 10;
      } else if (amount > 1000 && amount <= 10000) {
        awardedPoints = 100;
      } else if (amount >= 10000 && amount < 25000) {
        awardedPoints = 250;
      } else if (amount >= 25000 && amount < 50000) {
        awardedPoints = 500;
      } else if (amount >= 50000 && amount < 75000) {
        awardedPoints = 750;
      } else if (amount >= 75000 && amount < 100000) {
        awardedPoints = 1000;
      } else if (amount >= 100000) {
        awardedPoints = 2000;
      } else {
        awardedPoints = 0; // Reset points to 0 for invalid input
      }

      Points.x += awardedPoints;

      setState(() {
        formSubmitted = true;
      });
    }
  }

  Widget _buildInputField(String title, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: Color(0xFFC7161D),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC7161D)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC7161D)),
              ),
              labelText: title,
              labelStyle: TextStyle(color: Color(0xFFC7161D)),
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountInputField(String title, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: amountController,
            cursorColor: Color(0xFFC7161D),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC7161D)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFC7161D)),
              ),
              labelText: title,
              labelStyle: TextStyle(color: Color(0xFFC7161D)),
              hintText: hintText,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptTermsCheckbox() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          CustomCheckBox(
            value: acceptTerms,
            onChanged: (bool? value) {
              setState(() {
                acceptTerms = value ?? false;
              });
            },
          ),
          Text(
            "Accept terms and conditions",
            style: TextStyle(color: Color(0xFFC7161D)),
          ),
        ],
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  CustomCheckBox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: Color(0xFFC7161D),
    );
  }
}

class ThankYouPage extends StatelessWidget {
  final int awardedPoints;

  ThankYouPage({
    required this.awardedPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                  color: Color(0xFFC7161D),
                  width: 2,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Money Transferred Successfully",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC7161D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Handle button press
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text(
                      'Points Awarded: $awardedPoints',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFC7161D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Transaction ID - 1486 3796 2403",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFC7161D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final random = Random();
                final randomNumber = random.nextInt(2);

                if (randomNumber == 0) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CardApp()));
                } else {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => App()));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFC7161D),
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Play minigame for 2x points',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
