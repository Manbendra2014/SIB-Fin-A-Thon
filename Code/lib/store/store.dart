import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import '../homepage/main_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const Store());
}

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mirror + Store',
      theme: ThemeData(
        primaryColor: Colors.transparent,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 4) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  } // Add this line to track the selected index

  final List<String> imageUrls = [
    '../assets/store1.png',
    '../assets/store2.png',
    '../assets/store3.png',
    '../assets/store4.png',
    '../assets/store5.png',
  ];


  Timer? carasouelTmer;

    Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        if (pageNo == 4) {
          pageNo = 0;
        } else {
          pageNo++;
        }
        pageController.animateToPage(
          pageNo,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
      });
    });
  }

  
  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

    @override
  void dispose() {
    carasouelTmer?.cancel();  // Cancel the Timer
    pageController.dispose();  // Dispose the PageController
    _scrollController.dispose();  // Dispose the ScrollController
    super.dispose();
  }


  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
  backgroundColor: Color(0xFFC7161D),
  title: Text(
    'Mirror + Store',
    style: TextStyle(color: Colors.white),
  ),
  leading: IconButton(
  icon: Icon(Icons.arrow_back, color: Colors.white),
  onPressed: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  },
),

  leadingWidth: 25,  // Adjust this value to bring title closer to back arrow
),

body: SafeArea(

        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(
                height: 36.0,
              ),
              SizedBox(
                height: 300,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  onPageChanged: (index) {
                    pageNo = index;
                    setState(() {});
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (ctx, child) {
                        return child!;
                      },
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        onPanDown: (d) {
                          carasouelTmer?.cancel();
                          carasouelTmer = null;
                        },
                        onPanCancel: () {
                          carasouelTmer = getTimer();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 8, left: 8, top: 24, bottom: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage(
                                  imageUrls[index]), // Use the asset path here
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(2.0),
                      child: Icon(
                        Icons.circle,
                        size: 12.0,
                        color: pageNo == index
                            ? Colors.indigoAccent
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              const Padding(
                padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                child: GridB(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        elevation: 0.0,
        selectedIconTheme: IconThemeData(
          size: 22,
          color: Color(0xFFC7161D),
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        selectedLabelStyle: TextStyle(
          color: Color(0xFFC7161D),
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
        iconSize: 19,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 12,
        selectedFontSize: 15,
        selectedItemColor: Color(0xFFC7161D),
        currentIndex:
            _selectedIndex, // use _selectedIndex instead of _pageindex
        onTap: _onItemTapped, // use _onItemTapped instead of onPageChanged
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            activeIcon: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(Icons.store, color: Color(0xFFC7161D)),
            ),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            activeIcon: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(CupertinoIcons.heart_fill, color: Color(0xFFC7161D)),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            activeIcon: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(CupertinoIcons.cart_fill, color: Color(0xFFC7161D)),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bell),
            activeIcon: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(CupertinoIcons.bell_fill, color: Color(0xFFC7161D)),
            ),
            label: 'Notifications',
          ),
        ],
      ),
    ); // <-- This closing parenthesis matches with Scaffold's opening parenthesis
  } // <-- This closing brace matches with the opening brace of the build method
} // <-

class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Receive a 10 % discount on Nike apparel selections.",
      "price": 1000,
      "images": '../assets/nike.jpg'
    },
    {
      "title":
          "Enjoy a 25% discount on your next Expedia booking.",
      "price": 1500,
      "images": '../assets/expedia.png'
    },
    {
      "title": "Enjoy 30% off your next Starbucks treat.",
      "price": 2000,
      "images": '../assets/starbucks.png'
    },
    {
      "title": "Uncover a cozy 15% off on your next IKEA adventure.",
      "price": 2500,
      "images": '../assets/ikea.png'
    },
    {
      "title": "Avail a 5 % discount on your purchases at Amazon.",
      "price": 3000,
      "images": '../assets/amazon.png'
    },
    {
      "title": "Indulge in a 20 % discount on beauty essentials at Sephora.",
      "price": 3500,
      "images": '../assets/sephora.png'
    },
    {
      "title": "Enjoy discounts of up to 15 % on Apple gadgets.",
      "price": 4000,
      "images": '../assets/apple.jpg'
    },
    {
      "title": "Enjoy a 10 % off on all fashion items at Zara.",
      "price": 4500,
      "images": '../assets/zara.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 0.0,
        mainAxisExtent: 310,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          margin: const EdgeInsets.all(4.0), 
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFC7161D), width: 2),
              borderRadius: BorderRadius.circular(
                0.0,
              ),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
    ),
    child: Center(  // This will center the image both horizontally and vertically
        child: Padding(
            padding: index == 2 ? const EdgeInsets.only(top: 10.0) : const EdgeInsets.only(),  // Add padding only for Starbucks image
            child: Image.asset(
                "${gridMap.elementAt(index)['images']}",
                height: 170, // Set the height
                width: 170, // Set the width
                fit: BoxFit.contain,
            ),
        ),
    ),
),
SizedBox(
    height: index == 2 ? 10.0 : 0.0,  // Add padding only for Starbucks item
),

              Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "${gridMap.elementAt(index)['title']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC7161D),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.adjust,
                        color: Color(0xFFFFCC00),
                      ),
                      Text(
                        "${gridMap.elementAt(index)['price']}",
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFCC00),
                              ),
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.heart,
                            color: Color(0xFFC7161D)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon:
                            Icon(CupertinoIcons.cart, color: Color(0xFFC7161D)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              )
            ],
          ),
        );
      },
    );
  }
}
