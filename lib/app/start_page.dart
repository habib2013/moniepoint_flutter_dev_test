import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moniepoint_test/utils/media_query_utils.dart';
import 'package:moniepoint_test/widgets/count_animation.dart';
import 'package:moniepoint_test/widgets/animationManager/expanding_rollout_animation.dart';
import 'package:moniepoint_test/widgets/top_bar.dart';

import 'package:user_profile_avatar/user_profile_avatar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with TickerProviderStateMixin {
  int _numberCount = 0;
  int _numberCount_2 = 0;
  Timer? _countTimer;
  late final AnimationController controller;
  late final AnimationController controller_2;
  late final Animation<Offset> offsetAnimation;
  late final Animation<Offset> offsetAnimation_2;


  late AnimationController _controller;
  late Animation<double> _animation;




  @override
  void initState() {
    super.initState();
    inAppSlideAnimation();
  }


  inAppSlideAnimation() {
    // Initialize the first AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    // Initialize other AnimationControllers
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    controller_2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    offsetAnimation = Tween<Offset>(
      begin: Offset(0, 2.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    offsetAnimation_2 = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller_2, curve: Curves.easeInOut));

    controller.forward();
    controller_2.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
      }
    });

    controller_2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
      }
    });

    _startCountAnimation();
  }

  void _startCountAnimation() {
    _countTimer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (_numberCount < 1034 || _numberCount_2 < 2215) {
        if (mounted) {
          setState(() {
            if (_numberCount < 1034) _numberCount += 1;
            if (_numberCount_2 < 2215) _numberCount_2 += 1;
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    controller.dispose();
    controller_2.dispose();
    _countTimer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFf8f4ee), // Hexadecimal color for blue
                Color(0xFFfad5aa), // Hexadecimal color for green
                Color(0xFFffffff), // Hexadecimal color for green
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
               TopBar(onAvatarTap: (){}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                greetings(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              CountAnimation(),
              // SizedBox(height: 10),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Slide_transition(),
            ],
          ),
        ),


      ),
    );
  }


  Widget Slide_transition(){
   return
     SlideTransition(
      position: offsetAnimation,
      child: Container(
        child: Column(
          children: [

            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white, // White color for the border
                      width: 6, // Thickness of the border
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/images/001.webp'),
                  ),
                ),

                // glow start
              
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child:
                    ExpandingRolloutAnimation(
                     text: 'Gladkova St, 25 ',
                    //  rollingWidth: getMediaQueryWidth(context,0.78) ,
                      rollingWidth: 310,
                    )
                  ),
               
                // glow end

              ],
            ),
            SizedBox(height: 5),
            otherApartments()
          ],
        ),
      ),
    );
  }


  Widget greetings(){
    return
      Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi, Marina',style: TextStyle(fontSize: 22,fontFamily: 'EuclidRegular',color: Color(0xffa99984) ),),
          // AnimatedContainer(
          //   duration: Duration(milliseconds: 500),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SlideTransition(
          //         position: Tween<Offset>(
          //           begin: Offset(0, 0.5), // Start from a lower position
          //           end: Offset.zero, // Slide up to the original position
          //         ).animate(CurvedAnimation(
          //           parent: controller, // Your animation controller
          //           curve: Curves.easeInOut, // Customize the curve as needed
          //         )),
          //         child: Text(
          //           "Let's select your",
          //           style: TextStyle(
          //             fontSize: 29,
          //             fontFamily: 'EuclidMedium',
          //             color: Color(0xff000000),
          //             fontWeight: FontWeight.w400,
          //           ),
          //         ),
          //       ),
          //       SlideTransition(
          //         position: Tween<Offset>(
          //           begin: Offset(0, 0.5), // Start from a lower position
          //           end: Offset.zero, // Slide up to the original position
          //         ).animate(CurvedAnimation(
          //           parent: controller, // Your animation controller
          //           curve: Curves.easeInToLinear, // Customize the curve as needed
          //         )),
          //         child: Text(
          //           "perfect place",
          //           style: TextStyle(
          //             fontSize: 29,
          //             fontFamily: 'EuclidMedium',
          //             color: Color(0xff000000),
          //             fontWeight: FontWeight.w400,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          ClipRect(
            child: Align(
              alignment: Alignment.topLeft, // Reveal from bottom to top
              heightFactor: _animation.value, // Control the reveal height
              child: const Text(
                "Let's select your",
                style: TextStyle(
                  fontSize: 31,
                  fontFamily: 'EuclidRegular',
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 3), // Optional spacing
          // Second text reveal animation (Bottom to Top)
          ClipRect(
            child: Align(
              alignment: Alignment.topLeft, // Reveal from bottom to top
              heightFactor: _animation.value, // Control the reveal height
              child: const Text(
                "perfect place",
                style: TextStyle(
                  fontSize: 31,
                  fontFamily: 'EuclidRegular',
                  color: Color(0xff000000),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget otherApartments(){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.47,
                height: MediaQuery.of(context).size.width * 0.87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white, // White color for the border
                    width: 5, // Thickness of the border
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/002.webp',
                    fit: BoxFit.cover, // Ensure the image fills the container
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child:
                  ExpandingRolloutAnimation(
                    text: 'Gladkova St, 25 ',
                  //  rollingWidth: getMediaQueryWidth(context,0.33) ,
                    rollingWidth: 145 ,
                  )
              ),
            ],
          ),



          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: MediaQuery.of(context).size.width * 0.435,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white, // White color for the border
                        width: 5, // Thickness of the border
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/003.webp',
                        fit: BoxFit.cover, // Ensure the image fills the container
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child:
                      ExpandingRolloutAnimation(
                        text: 'Monnify Ave, 25 ',
                       // rollingWidth: getMediaQueryWidth(context,0.33) ,
                        rollingWidth: 145 ,
                      )
                  ),
                ],
              ),


              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.47,
                    height: MediaQuery.of(context).size.width * 0.435,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white, // White color for the border
                        width: 5, // Thickness of the border
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        'assets/images/002.webp',
                        fit: BoxFit.cover, // Ensure the image fills the container
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child:
                      ExpandingRolloutAnimation(
                        text: 'Gubina St, 28 ',
                      //  rollingWidth: getMediaQueryWidth(context,0.33),
                        rollingWidth: 145,
                      )
                  ),
                ],
              )


            ],
          ),
        ],
      );
  }


}
