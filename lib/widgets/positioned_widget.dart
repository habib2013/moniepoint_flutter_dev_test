import 'package:flutter/material.dart';

class PositionedWidget extends StatelessWidget {
  const PositionedWidget({
    Key? key,
    required this.top,
    required this.left,
    required this.child,
  }) : super(key: key);

  final double top;
  final double left;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: child,
    );
  }
}
