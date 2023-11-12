import 'dart:math';
import 'dart:ui';
import '../minigames/minigames.dart';
import '../login.dart';
import '../store/store.dart';
import './model.dart';
import 'package:flutter/material.dart';
import '../kyc.dart';
import '../fdapply.dart';
import '../userprofile.dart';
import '../moneytransfer.dart';
import '../objectives.dart';
import '../viewbalance.dart';
import '../feedback.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  String username = "Rahul";
  String welcome = "Welcome Back!";
  String value = "1465";
  final controller = ScrollController();

  bool isgoodornot = false;

  void onPageChanged(int index) {
    setState(() {
      _pageindex = index;
    });

    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MakeDashboardItems()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Store()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserProfilePage()),
        );
        break;
      case 4:
        _confirmLogout();
        break;
      default:
        break;
    }
  }

  void _confirmLogout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout Confirmation'),
          content: Text('Do you want to exit the app ?'),
          actions: <Widget>[
            TextButton(
              child: Text('No', style: TextStyle(color: Color(0xFFC7161D))),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Yes', style: TextStyle(color: Color(0xFFC7161D))),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginDemo()),
                ); // Navigate to Login Page
              },
            ),
          ],
        );
      },
    );
  }

  List accounts = [
    MyList(
        title: "Ravi",
        subtitle: "2022-08-21 02:14:12",
        money: "₹ 2000",
        isgood: true),
    MyList(
        title: "Harish",
        subtitle: "2022-07-12 05:07:12",
        money: "₹ 1000",
        isgood: false),
    MyList(
        title: "Naveen",
        subtitle: "2022-05-20 07:12:12",
        money: "₹ 500",
        isgood: true),
    MyList(
        title: "Anthony",
        subtitle: "2022-05-14 03:33:22",
        money: "₹ 3000",
        isgood: true),
    MyList(
        title: "Kavin",
        subtitle: "2022-05-04 01:32:14",
        money: "₹ 700",
        isgood: false)
  ];

  int _pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // Add your logic to open the menu
                  },
                  padding: EdgeInsets.zero,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 150.0), // Adjust left padding here
                  child: Text(
                    "Hello, $username",
                    style: TextStyle(
                      color: Color(0xFFC7161D),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 0.0), // Adjust left padding here
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Stack(
                        children: const [
                          Icon(
                            Icons.notifications_none_outlined,
                            size: 24,
                            color: Color(0xFFC7161D),
                          ),
                          Positioned(
                            child: Icon(
                              Icons.brightness_1,
                              color: Color(0xFFC7161D),
                              size: 9.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(
                    Icons.monetization_on,
                    size: 28,
                    color: Color(0xFFFFCC00),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Credit Card Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFC7161D),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Color.fromRGBO(50, 172, 121, 1),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      Text(
                        "VISA",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "**** **** **** 1234",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2.0),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "CARD HOLDER",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFFCC00),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0),
                          ),
                          Text(
                            "RAHUL KUMAR",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "EXPIRES",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFFCC00),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0),
                          ),
                          Text(
                            "8 / 24",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "CVV",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFFCC00),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0),
                          ),
                          Text(
                            "321",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.0),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _tiles(context, Icons.playlist_add_check, Colors.transparent,
                    Color(0xFFC7161D), Color(0xFFC7161D), "Objectives"),
                _tiles(context, Icons.send, Colors.transparent,
                    Color(0xFFC7161D), Color(0xFFC7161D), "Fund Transfer"),
                _tiles(context, Icons.receipt, Colors.transparent,
                    Color(0xFFC7161D), Color(0xFFC7161D), "Bill Payment"),
                _tiles(
                    context,
                    Icons.account_balance_wallet,
                    Colors.transparent,
                    Color(0xFFC7161D),
                    Color(0xFFC7161D),
                    "View Balance"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _tiles(context, Icons.update, Colors.transparent,
                    Color(0xFFC7161D), Color(0xFFC7161D), "KYC Update"),
                _tiles(context, Icons.account_balance, Colors.transparent,
                    Color(0xFFC7161D), Color(0xFFC7161D), "Fixed Deposit"),
                _tiles(context, Icons.request_page, Colors.transparent,
                    Color(0xFFC7161D), Color(0xFFC7161D), "Loan"),
                _tiles(context, Icons.security, Colors.transparent,
                    Color(0xFFC7161D), Color(0xFFC7161D), "Feedback"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Recent Transactions",
                    style: TextStyle(
                        color: Color(0xFFC7161D),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xFFC7161D),
                          fontSize: 15,
                        ),
                      )),
                ),
              ],
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ScrollConfiguration(
                  behavior: const MaterialScrollBehavior()
                      .copyWith(overscroll: false),
                  child: ListView.builder(
                      controller: controller,
                      shrinkWrap: true,
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        bool isornot = accounts[index].isgood;

                        return ListTile(
                          title: Text(
                            accounts[index].title,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          subtitle: Text(accounts[index].subtitle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 13)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                accounts[index].money,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              isornot == false
                                  ? const Icon(
                                      Icons.arrow_downward_outlined,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      Icons.arrow_upward_outlined,
                                      color: Colors.green,
                                    ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xFFC7161D), // Red color border
                width: 2.0,
              ),
            ),
          ),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              canvasColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              elevation: 0.0,
              selectedIconTheme: IconThemeData(
                size: 22,
                color: Color(0xFFC7161D), // Red color icons
              ),
              unselectedIconTheme: IconThemeData(
                color: Color(0xFFC7161D), // Red color icons
              ),
              selectedLabelStyle: TextStyle(
                color: Color(0xFFC7161D), // Red text for icons
              ),
              unselectedLabelStyle: TextStyle(
                color: Color(0xFFC7161D), // Red text for icons
              ),
              iconSize: 19,
              unselectedItemColor: Colors.black, // Red text for icons
              unselectedFontSize: 12,
              selectedFontSize: 12,
              selectedItemColor: Color(0xFFC7161D),
              currentIndex: 0,
              onTap: onPageChanged,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_esports),
                  label: "Games",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: "Store",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.exit_to_app),
                  label: "Logout",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _tiles(BuildContext context, IconData icon, Color backgroundColor,
    Color iconColor, Color borderColor, String title) {
  Widget tile = Container(
    width: 80,
    child: Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            size: 15,
            color: iconColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );

  if (title == "KYC Update" ||
      title == "Fixed Deposit" ||
      title == "Fund Transfer" ||
      title == "Objectives" ||
      title == "View Balance" ||
      title == "Feedback") {
    return GestureDetector(
      onTap: () {
        if (title == "KYC Update") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KYCUpdateForm()),
          );
        } else if (title == "Fixed Deposit") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FdApply()),
          );
        } else if (title == "Fund Transfer") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MoneyTransfer()),
          );
        } else if (title == "Objectives") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Objectives()),
          );
        } else if (title == "View Balance") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomTitleAlertDialog()),
          );
        }
        else if (title == "Feedback") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ObjectivesPage()),
          );
        }
      },
      child: tile,
    );
  }

  return tile;
}
