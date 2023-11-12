import 'package:flutter/material.dart';
import 'points.dart';
import 'dart:core';
import 'stone_paper_scissor_main.dart';

void main() {
  runApp(MaterialApp(
    home: KYCUpdateForm(),
    debugShowCheckedModeBanner: false,
  ));
}

class KYCUpdateForm extends StatefulWidget {
  @override
  _KYCUpdateFormState createState() => _KYCUpdateFormState();
}

class _KYCUpdateFormState extends State<KYCUpdateForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bankAccountNoController = TextEditingController();
  final TextEditingController bankBranchNameController =
      TextEditingController();
  final TextEditingController panDocumentNoController = TextEditingController();
  final TextEditingController panNameController = TextEditingController();
  final TextEditingController aadharDocumentNoController =
      TextEditingController();
  final TextEditingController aadharNameController = TextEditingController();
  final TextEditingController voterIdController = TextEditingController();

  bool submitted = false;
  bool acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KYC Updation Form", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFC7161D),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: submitted ? _buildThankYouMessage() : _buildKYCForm(),
      ),
    );
  }

  Widget _buildKYCForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 30,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
              border: Border.all(
                color: Color(0xFFC7161D), // This adds a red border
                width:
                    2, // This specifies the border width, adjust to your preference
              ),
            ),
            child: TextButton(
              onPressed: null,
              child: Text(
                "Update KYC",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC7161D),
                ),
              ),
            ),
          ),
        ),
        Divider(),
        _buildInputField("Name", "Enter your name", nameController),
        _buildInputField("Bank Account Number",
            "Enter your bank account number", bankAccountNoController),
        _buildInputField("Bank Branch Name", "Enter your bank branch name",
            bankBranchNameController),
        _buildInputField("Name in PAN Card", "Enter your name as in PAN Card",
            panNameController),
        _buildInputField("PAN Card Number", "Enter your PAN Card Number",
            panDocumentNoController),
        _buildInputField("Name in Aadhar Card",
            "Enter your name as in Aadhar Card", aadharNameController),
        _buildInputField("Aadhar Card Number", "Enter your Aadhar Card Number",
            aadharDocumentNoController),
        _buildInputField(
            "Voter ID Number", "Enter your Voter ID Number", voterIdController),
        Row(
          children: [
            Checkbox(
              value: acceptTerms,
              onChanged: (bool? value) {
                setState(() {
                  acceptTerms = value ?? false;
                });
              },
              activeColor: Color(0xFFC7161D), // This makes the tick mark red
            ),
            Text(
              "Accept the Terms and Conditions.",
              style: TextStyle(
                color: acceptTerms ? Color(0xFFC7161D) : Colors.black,
                fontWeight: acceptTerms ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Center(
          child: Container(
            height: 45,
            width: 250,
            decoration: BoxDecoration(
              color: Color(0xFFC7161D),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: _submitKYCDetails,
              child: Text(
                "Submit Updated Details",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Note : Updating the KYC details will result in a reward of 500 points.",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildInputField(
    String title,
    String hintText,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: TextFormField(
        controller: controller,
        cursorColor: Color(0xFFC7161D), // This makes the cursor red
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$title is empty';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildThankYouMessage() {
    return Center(
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
                color: Color(0xFFC7161D), // This will add red border
                width: 2, // Adjust border width to your preference
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // This will center the text vertically
              crossAxisAlignment: CrossAxisAlignment
                  .center, // This will center the text horizontally
              children: [
                Text(
                  "Thank you for updating all your KYC details.",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC7161D),
                  ),
                  textAlign: TextAlign
                      .center, // This will center the text horizontally
                ),
                SizedBox(
                    height: 20), // No need for a Container wrapping a SizedBox
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
                    'Points Awarded : 500',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC7161D),
                    ),
                    textAlign: TextAlign
                        .center, // This will center the text horizontally
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => MyApp(),    //--------- Card Flip
                        builder: (context) =>
                            App(), //--------- Stone Paper Scissor
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC7161D),
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Play minigame for 500 points',
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
        ],
      ),
    );
  }

  void _showError(String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(error),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void _submitKYCDetails() {
    String name = nameController.text;
    String panNo = panDocumentNoController.text;
    String panName = panNameController.text;
    String aadharNo = aadharDocumentNoController.text;
    String aadharName = aadharNameController.text;
    String bankAccountNo = bankAccountNoController.text;
    String bankBranchName = bankBranchNameController.text;
    String voterId = voterIdController.text;

    if (name.isEmpty || !RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
      _showError("Please enter a valid name.");
      return;
    }
    if (panNo.isEmpty || !RegExp(r'^[a-zA-Z0-9]{10}$').hasMatch(panNo)) {
      _showError("Please enter a valid PAN Card Number.");
      return;
    }
    if (aadharNo.isEmpty || !RegExp(r'^\d{12}$').hasMatch(aadharNo)) {
      _showError("Please enter a valid Aadhar Card Number.");
      return;
    }
    if (bankAccountNo.isEmpty ||
        !RegExp(r'^\d{8,12}$').hasMatch(bankAccountNo)) {
      _showError("Please enter a valid Bank Account Number.");
      return;
    }
    if (bankBranchName.isEmpty ||
        !RegExp(r'^[a-zA-Z ]+$').hasMatch(bankBranchName)) {
      _showError("Please enter a valid Bank Branch Name.");
      return;
    }
    if (voterId.isEmpty || !RegExp(r'^[a-zA-Z0-9]{10}$').hasMatch(voterId)) {
      _showError("Please enter a valid Voter ID Number.");
      return;
    }
    if (panNo == voterId) {
      _showError("PAN Card Number and Voter ID Number cannot be the same.");
      return;
    }
    if (bankAccountNo == panNo) {
      _showError("Bank Account Number and PAN Card Number cannot be the same.");
      return;
    }
    if (bankAccountNo == aadharNo) {
      _showError(
          "Bank Account Number and Aadhar Card Number cannot be the same.");
      return;
    }
    if (panName != aadharName) {
      _showError("Names in PAN Card and Aadhar Card do not match.");
      return;
    }

    if (!acceptTerms) {
      _showError("Please accept the Terms and Conditions.");
      return;
    }

    setState(() {
      submitted = true;
      Points.x += 500;
    });
  }
}
