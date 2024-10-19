
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/app/third_page.dart';
import 'package:moniepoint_test/app/start_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 2;
  final List<Widget> _pages = [
    SearchPage(),
    Container(color: Colors.green,
      child: Center(
        child:
        Text('Second Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),),
    LandingPage(),
     Container(color: Colors.yellow,child: Center(child: Text('Fourth Screen',style: TextStyle(color: Colors.white),),)),
    Container(color: Colors.purple,child: Center(child: Text('Fifth Screen',style: TextStyle(color: Colors.white),),)),
  ];

  bool _isBottomNavVisible = false; // To track if the bottom navigation bar is visible


  @override
  void initState() {
    super.initState();
    // Start the slide-in animation after a delay of 1 second
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _isBottomNavVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _pages[_currentIndex],
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2), // Slide-in animation duration
            curve: Curves.easeInOut, // Use easeInOut curve for smooth animation
            bottom: _isBottomNavVisible ? 20 : -kBottomNavigationBarHeight - 16,
            left: MediaQuery.of(context).size.width * 0.15, // 10% margin from left
            right: MediaQuery.of(context).size.width * 0.15, // 10% margin from right
            child: AnimatedContainer(
              duration: Duration(seconds: 3), // Slide-in animation duration
              width: MediaQuery.of(context).size.width * 0.81, // 80% width
              height: kBottomNavigationBarHeight + 16,
              decoration: BoxDecoration(
                color: Color(0xff2b2b2b), // Background color for the bottom nav
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(FeatherIcons.search, 0),
                  _buildNavItem(Icons.message, 1),
                  _buildNavItem(FeatherIcons.home, 2),
                  _buildNavItem(Icons.heart_broken, 3),
                  _buildNavItem(Icons.person, 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return InkWell(
      onTap: () => _navigateTo(index),
      borderRadius: BorderRadius.circular(30),
      child: Container(
         width: 45,
        height: 45,
      //  padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index ? Color(0xfffc9e12) : Color(0xff22211f),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            icon,
            color: _currentIndex == index ? Colors.white : Colors.white,
          ),
        ),
      ),
    );
  }

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
