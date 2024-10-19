import 'package:flutter/material.dart';

Widget transformWidget({required Widget transform_child}){
  return
    TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(seconds: 1),
      builder: (context, value, child) {
        return Transform.scale(
            scale: value,
            child:
            transform_child
        );
      },
    );
}

Widget reverseTransformWidget({required Widget transformChild}) {
  return TweenAnimationBuilder<double>(
    tween: Tween(begin: 0.1, end: 0.9),
    duration: Duration(seconds: 3),
    builder: (context, value, child) {
      return Transform(
        transform: Matrix4.identity()
          ..scale(value)
          ..translate(5 * (3 - value), 2 * (3 - value)),
        alignment: Alignment.bottomLeft,
        child: transformChild,
      );
    },
  );
}


Widget rugRolloutAnimation({required Widget child}) {
  return TweenAnimationBuilder<double>(
    tween: Tween(begin: 0.0, end: 1.0),
    duration: Duration(seconds: 4),
    builder: (context, value, _) {
      return ClipRect(
        child: Align(
          alignment: Alignment.centerLeft,
          widthFactor: value,
          child: child,
        ),
      );
    },
  );
}
