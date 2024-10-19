import 'package:flutter/material.dart';
import 'package:moniepoint_test/widgets/animationManager/tween_animators.dart';
import 'package:moniepoint_test/app/third_page.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key, required this.onAvatarTap}) : super(key: key);

  final VoidCallback onAvatarTap;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;
  late bool _showText = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    Future.delayed(Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _showText = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          },
          child: SlideTransition(
            position: _offsetAnimation,
            child: Container(
              width: 190,
              height: 43,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: !_showText
                  ? SizedBox()
                  : Row(
                children: [
                  Icon(
                    Icons.place,
                    color: Color(0xFF949798),
                  ),
                  SizedBox(width: 10),
                  FadeTransition(
                    opacity: _fadeAnimation, // Add fade transition
                    child: Text(
                      'Saint Petersburg',
                      style: TextStyle(
                        fontFamily: 'EuclidLight',
                        color: Color(0xFF8E9497),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        transformWidget(
          transform_child: Container(
            height: 50,
            width: 50,
            child: Image.asset('assets/images/app_dp.png'),
          ),
        ),
      ],
    );
  }
}
