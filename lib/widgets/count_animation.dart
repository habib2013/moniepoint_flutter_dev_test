import 'dart:async';
import 'package:flutter/material.dart';

import 'package:moniepoint_test/widgets/animationManager/tween_animators.dart';

class CountAnimation extends StatefulWidget {
  @override
  State<CountAnimation> createState() => _CountAnimationState();
}

class _CountAnimationState extends State<CountAnimation> {
  int _numberCount = 0;
  int _numberCount_2 = 0;

  @override
  void initState() {
    super.initState();
    _startCountAnimation();
  }

  void _startCountAnimation() {
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_numberCount < 1034 || _numberCount_2 < 2215) {
        setState(() {
          if (_numberCount < 1034) _numberCount += 1;
          if (_numberCount_2 < 2215) _numberCount_2 += 1;
        });
      } else {
        timer.cancel();
      }
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        transformWidget(
     transform_child:  Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.42,
            padding: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(400)),
              color: Color(0xfffc9e12),
            ),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'BUY',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'EuclidMedium',
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015),
                  Text(
                    _numberCount.toString(),
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontFamily: 'EuclidSemiBold',
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.003),
                  Text(
                    'Offers',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'EuclidMedium',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        transformWidget(transform_child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.45,
          padding: EdgeInsets.only(top: 30),
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            color: Colors.white,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'RENT',
                  style: TextStyle(fontSize: 11, color: Colors.grey,fontFamily: 'EuclidSemiBold',wordSpacing:0.2),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Text(
                  _numberCount_2.toString(),
                  style: TextStyle(fontSize: 40, color: Colors.grey,fontFamily: 'EuclidSemiBold',wordSpacing: 5.5),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.003),
                Text(
                  'Offers',
                  style: TextStyle(color: Colors.grey,fontFamily: 'EuclidMedium',fontSize: 12),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }



}
