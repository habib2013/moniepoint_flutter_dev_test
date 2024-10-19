import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

import 'package:moniepoint_test/widgets/animationManager/tween_animators.dart';
import 'package:moniepoint_test/widgets/search_bar.dart';
import 'package:moniepoint_test/widgets/positioned_widget.dart';
import 'package:moniepoint_test/widgets/action_buttons.dart';

import '../utils/media_query_utils.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildPositionedWidget(double top, double left, Widget child) {
    return PositionedWidget(
      top: top,
      left: left,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/google_dummy_img.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            buildPositionedWidget(
                getMediaQueryHeight(context,0.04),
            getMediaQueryWidth(context, 0.02) ,
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: AppSearchBar(),
            ),
          )
            ),
            buildPositionedWidget(
              MediaQuery.of(context).size.height * 0.4,
              MediaQuery.of(context).size.width * 0.2,
                appTextPosition('7.8mB')
            ),
            buildPositionedWidget(
              MediaQuery.of(context).size.height * 0.6,
              MediaQuery.of(context).size.width * 0.4,
                appTextPosition('12.8mB')

            ),
            buildPositionedWidget(
              MediaQuery.of(context).size.height * 0.2,
              MediaQuery.of(context).size.width * 0.8,
                appTextPosition('198.8mB')
            ),
            buildPositionedWidget(
              MediaQuery.of(context).size.height * 0.73,
              MediaQuery.of(context).size.width * 0.1,
              transformWidget(transform_child: ActionButtons()),
            ),
            buildPositionedWidget(
              MediaQuery.of(context).size.height * 0.765,
              MediaQuery.of(context).size.width * 0.55,
              transformWidget(transform_child:
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(0.6), // Glassmorphism effect
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.list_outlined, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      'List of Variants',
                      style: TextStyle(fontFamily: 'EuclidSemiBold', color: Colors.white),
                    )
                  ],
                ),
              ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  
  Widget appTextPosition(String appTitle){
    return
      Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xfffc9e12),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Text(appTitle,style: TextStyle(fontFamily: 'EuclidRegular',color: Colors.white)
        ),
      );
  }
}
