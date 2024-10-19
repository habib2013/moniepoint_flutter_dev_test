import 'package:flutter/material.dart';

class ExpandingRolloutAnimation extends StatefulWidget {
  final String text;
  final double rollingWidth;

  const ExpandingRolloutAnimation({Key? key, required this.text,required this.rollingWidth}) : super(key: key);

  @override
  _ExpandingRolloutAnimationState createState() => _ExpandingRolloutAnimationState();
}

class _ExpandingRolloutAnimationState extends State<ExpandingRolloutAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      duration: Duration(seconds: 5), // Adjust the duration for speed
      vsync: this,
    );


    _widthAnimation = Tween<double>(begin: 0.0, end: widget.rollingWidth).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Adjust the curve for smoothness
      ),
    );
   WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Expanding Container
              Container(
                width: _widthAnimation.value,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10), // Added horizontal padding
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0), // Added horizontal padding
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(0.3), // Glassmorphism effect
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: _widthAnimation.value >= widget.rollingWidth
                    ? Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'EuclidLight',
                  ),
                  textAlign: TextAlign.center,
                )
                    : null,
              ),

              Positioned(
                left: _widthAnimation.value - 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 9),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(300)),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
