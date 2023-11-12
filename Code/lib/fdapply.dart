import 'package:flutter/material.dart';
import 'points.dart';
import 'stone_paper_scissor_main.dart';

void main() {
  runApp(MaterialApp(
    home: FdApply(),
  ));
}

class FdApply extends StatefulWidget {
  @override
  _FdApplyState createState() => _FdApplyState();
}

class _FdApplyState extends State<FdApply> {
  bool isDomestic = false;
  bool isOther = false;
  bool isNRE = false;
  bool isNRO = false;
  bool isRFC = false;
  bool isFCNR = false;
  bool isTermsAccepted = false;
  bool formSubmitted = false;
  String selectedFrequency = 'Monthly';

 int depositAmount = 0;
  int awardedPoints = 0;
  
  final nameController = TextEditingController();
  final panController = TextEditingController();
  final depositAmountController = TextEditingController();
  final fdPeriodController = TextEditingController();
  final interestAmountFrequencyController = TextEditingController();
  final interestController = TextEditingController();

  List<String> errorMessages = [];

  int _calculatePoints(int depositAmount) {
  if (depositAmount >= 0 && depositAmount <= 100000) {
    return 1000;
  } else if (depositAmount > 100000 && depositAmount <= 500000) {
    return 5000;
  } else if (depositAmount > 500000 && depositAmount <= 1000000) {
    return 10000;
  } else if (depositAmount > 1000000) {
    return 15000;
  }
  return 0;  // Default case if deposit amount is negative (shouldn't happen with proper validation)
}

  bool _validateName(String name) {
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');  // Regex for name
    if (!regex.hasMatch(name) || name.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validatePAN(String pan) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]{10}$');  // Regex for pan
    if (!regex.hasMatch(pan) || pan.isEmpty) {
      return false;
    }
    return true;
  }

  bool _validateDepositAmount(String depositAmount) {
    // Validation for deposit amount to check for integer only
    if (int.tryParse(depositAmount) == null) {;
      return false;
    }
    return true;
  }

  bool _validateFDPeriod(String fdPeriod) {
    // Validation for fd period to check for integer only
    if (int.tryParse(fdPeriod) == null) {;
      return false;
    }
    return true;
  }

@override
  void initState() {
    super.initState();
    fdPeriodController.addListener(_updateInterestRate);
  }

  void _updateInterestRate() {
    String fdPeriodText = fdPeriodController.text;
    if (fdPeriodText.isEmpty) {
        interestController.text = '0 %';
        return;  // Exit early if the field is empty
    }

    int? fdPeriod = int.tryParse(fdPeriodText);
    String? interestRate;

    if (fdPeriod != null) {
      switch (fdPeriod) {
        case 1:
          interestRate = '4.5 %';
          break;
        case 2:
          interestRate = '5 %';
          break;
        case 3:
          interestRate = '5.5 %';
          break;
        case 4:
          interestRate = '6 %';
          break;
        default:
          if (fdPeriod >= 5 && fdPeriod <= 10) {
            interestRate = '6.5 %';
          }
          break;
      }

      if (interestRate != null) {
        interestController.text = interestRate;
      }
    }
}



  @override
  void dispose() {
    nameController.dispose();
    panController.dispose();
    depositAmountController.dispose();
    fdPeriodController.dispose();
    interestController.dispose();
    super.dispose();
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

  List<String> frequencyOptions = ['Monthly', 'Quarterly', 'Yearly'];

  Widget _buildThankYouMessage() {
  String depositAmountText = depositAmountController.text;
  String fdPeriod = fdPeriodController.text;
  String interestRate = interestController.text;

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
            mainAxisAlignment: MainAxisAlignment.center, // This will center the text vertically
            crossAxisAlignment: CrossAxisAlignment.center, // This will center the text horizontally
            children: [
              Text(
                "Thank you for applying for \n Fixed Deposit.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC7161D),
                ), 
                textAlign: TextAlign.center,// This will center the text horizontally
              ),
              SizedBox(height: 20), // No need for a Container wrapping a SizedBox
              Text(
                'Deposit Amount : ₹ $depositAmountText',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC7161D),
                ),
              ),
              SizedBox(height: 10),
Text(
  'Fixed Deposit Period : $fdPeriod ${fdPeriod == "1" ? "year" : "years"}',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xFFC7161D),
  ),
),

              SizedBox(height: 10),
              Text(
                'Interest Rate : $interestRate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC7161D),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Interest Frequency : $selectedFrequency',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC7161D),
                ),
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
                  'Points Awarded : $awardedPoints',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFC7161D),
                  ),
                  textAlign: TextAlign.center, // This will center the text horizontally
                ),
              ),
              ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder: (context) => MyApp(),    //--------- Card Flip
                    builder: (context) => App(), //--------- Stone Paper Scissor
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


Widget _buildInputField(
  String title,
  String hintText,
  TextEditingController controller,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          cursorColor: Color(0xFFC7161D),  // This makes the cursor red
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
        if (title == "Fixed Deposit Period")  // Check if this is the Fixed Deposit Period field
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "The period can be from 1 year to 10 years only.",
              style: TextStyle(color: Color(0xFFC7161D),fontWeight: FontWeight.bold),
            ),
          ),
      ],
    ),
  );
}


Widget _buildInterestField(String label) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: TextFormField(
      controller: interestController,  // Use the interestController here
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC7161D)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC7161D)),
        ),
        labelText: label,
        labelStyle: TextStyle(color: Color(0xFFC7161D)),
      ),
    ),
  );
}


Widget _buildDropdownField(String label, String selectedValue, List<String> options) {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Theme(
      data: ThemeData(
        canvasColor: Colors.white,  // This changes the background color of the selected item
      ),
      child: DropdownButtonFormField(
        value: selectedValue,
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedValue = value.toString();
          });
        },
        decoration: InputDecoration(
          labelText: label,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFC7161D)),  // Change the border color when focused
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),  // You can change this color as needed
          ),
          labelStyle: TextStyle(color: Color(0xFFC7161D)),  // Red label color
          hintStyle: TextStyle(color: Color(0xFFC7161D)),  // Red hint text color
        ),
        style: TextStyle(color: Color(0xFFC7161D)),  // Red text color
      ),
    ),
  );
}



  @override
  Widget build(BuildContext context) {
    bool isAnyOptionSelected = isDomestic || isOther || isNRE || isNRO || isRFC || isFCNR;
    return Scaffold(
      appBar: AppBar(
        title: Text('Fixed Deposit Application Form'),
        backgroundColor: Color(0xFFC7161D),
      ),
      body: formSubmitted ? _buildThankYouMessage() : ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),  // Adding padding at the top
            child: Center(
              child: Container(
                height: 30,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(
                    color: Color(0xFFC7161D),  // This adds a red border
                    width: 2,  // This specifies the border width, adjust to your preference
                  ),
                ),
                child: TextButton(
                  onPressed: null,
                  child: Text(
                    "Apply for Fixed Deposit",
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
          Padding(  // Padding for spacing and alignment
            padding: const EdgeInsets.only(top: 15.0, bottom: 10.0, left: 9.0),  // Added left padding
            child: Text(
                "Choose Account Type : ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isAnyOptionSelected ? FontWeight.bold : FontWeight.normal,
                  color: isAnyOptionSelected ? Color(0xFFC7161D) : Colors.black,
                ),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isDomestic,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          isDomestic = value;
                        });
                      }
                    },
                    checkColor: Colors.white,
                    activeColor: Color(0xFFC7161D),
                  ),
                  Text(
                    'Domestic',
                    style: TextStyle(
                      fontWeight: isDomestic ? FontWeight.bold : FontWeight.normal,
            color: isDomestic ? Color(0xFFC7161D) : Colors.black,  // Color changes based on selection
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isNRE,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          isNRE = value;
                        });
                      }
                    },
                    checkColor: Colors.white,
                    activeColor: Color(0xFFC7161D),
                  ),
                  Text('Non - Resident External ( NRE )',
                    style: TextStyle(
                      fontWeight: isNRE ? FontWeight.bold : FontWeight.normal,
            color: isNRE ? Color(0xFFC7161D) : Colors.black,  // Color changes based on selection
                    ),),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isNRO,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          isNRO = value;
                        });
                      }
                    },
                    checkColor: Colors.white,
                    activeColor: Color(0xFFC7161D),
                  ),
                  Text('Non - Resident Ordinary ( NRO )',
                    style: TextStyle(
                      fontWeight: isNRO ? FontWeight.bold : FontWeight.normal,
            color: isNRO ? Color(0xFFC7161D) : Colors.black,  // Color changes based on selection
                    ),),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isFCNR,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          isFCNR = value;
                        });
                      }
                    },
                    checkColor: Colors.white,
                    activeColor: Color(0xFFC7161D),
                  ),
                  Text('Foreign Currency Non - Resident ( FCNR )',
                    style: TextStyle(
                      fontWeight: isFCNR ? FontWeight.bold : FontWeight.normal,
            color: isFCNR ? Color(0xFFC7161D) : Colors.black,  // Color changes based on selection
                    ),),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isRFC,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          isRFC = value;
                        });
                      }
                    },
                    checkColor: Colors.white,
                    activeColor: Color(0xFFC7161D),
                  ),
                  Text('Resident Foreign Currency ( RFC )',
                    style: TextStyle(
                      fontWeight: isRFC? FontWeight.bold : FontWeight.normal,
            color: isRFC ? Color(0xFFC7161D) : Colors.black,  // Color changes based on selection
                    ),),
                ],
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: isOther,
                    onChanged: (bool? value) {
                      if (value != null) {
                        setState(() {
                          isOther = value;
                        });
                      }
                    },
                    checkColor: Colors.white,
                    activeColor: Color(0xFFC7161D),
                  ),
                  Text('Other',
                    style: TextStyle(
                      fontWeight: isOther ? FontWeight.bold : FontWeight.normal,
            color: isOther ? Color(0xFFC7161D) : Colors.black,  // Color changes based on selection
                    ),),
                ],
              ),
            ],
          ),

      _buildInputField("Name", "Enter your name", nameController),
      _buildInputField("PAN Card Number", "Enter your PAN Card Number", panController),
      _buildInputField("Fixed Deposit Period", "Enter your fixed deposit period", fdPeriodController),
      _buildInterestField("Interest"),
      _buildInputField("Deposit Amount", "Enter your deposit amount", depositAmountController),
      _buildDropdownField('Interest Frequency', selectedFrequency, frequencyOptions),

          Row(
  children: <Widget>[
    Checkbox(
      value: isTermsAccepted,
      onChanged: (bool? value) {
        if (value != null) {
          setState(() {
            isTermsAccepted = value;
          });
        }
      },
      checkColor: Colors.white,
      activeColor: Color(0xFFC7161D),
    ),
    Text(
      'Accept all terms and conditions.',
      style: TextStyle(
        color: isTermsAccepted ? Color(0xFFC7161D) : Colors.black,  // color will change based on isTermsAccepted
        fontWeight: isTermsAccepted ? FontWeight.bold : FontWeight.normal,  // fontWeight will change based on isTermsAccepted
      ),
    ),
  ],
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
  String name = nameController.text;
  String pan = panController.text;
  String depositAmountText = depositAmountController.text;
  String fdPeriod = fdPeriodController.text;

  bool isNameValid = _validateName(name);
  if (!isNameValid) {
    _showError('Please enter a valid name.');
    return;  // Exit early if there's an error
  }

  bool isPANValid = _validatePAN(pan);
  if (!isPANValid) {
    _showError('Please enter a valid PAN Card Number.');
    return;  // Exit early if there's an error
  }

  bool isDepositAmountValid = _validateDepositAmount(depositAmountText);
  if (!isDepositAmountValid) {
    _showError('Please enter a Deposit Amount using numbers.');
    return;  // Exit early if there's an error
  }

  bool isFDPeriodValid = _validateFDPeriod(fdPeriod);
  if (!isFDPeriodValid) {
    _showError('Please enter the Fixed Deposit Period using numbers.');
    return;  // Exit early if there's an error
  }

  if (!isTermsAccepted) {
    _showError('Please accept all terms and conditions to proceed.');
    return;  // Exit early if there's an error
  }

  // If all validations pass, update the state to reflect form submission
  if (isDepositAmountValid) {
    int depositAmount = int.parse(depositAmountText);  // parse depositAmountText to int
    awardedPoints = _calculatePoints(depositAmount);  // Now depositAmount is int, no error here
    Points.x += awardedPoints;  // Update the total points
  setState(() {
      formSubmitted = true;  // Update formSubmitted flag
    });
  }
},

      
      child: Text(
        "Submit Fixed Deposit Details",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  ),
),
SizedBox(height: 20),
Container(
  padding: EdgeInsets.symmetric(horizontal: 40),  // Adjust the horizontal padding to center the text block
  child: Align(
    alignment: Alignment.centerLeft,
    child: Text(
      "Note : Applying for Fixed Deposit will result in a reward depending upon your Deposit Amount.",
      style: TextStyle(fontStyle: FontStyle.italic),
      textAlign: TextAlign.left,
    ),
  ),
),
],



  // Closing bracket for children
      ),  // Closing parenthesis for ListView
    );  // Closing parenthesis for Scaffold
  }  // Closing brace for build method
}  // Closing brace for _FdApplyState class