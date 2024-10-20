import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:moniepoint_test/widgets/animationManager/tween_animators.dart';

class AppSearchBar extends StatelessWidget {

   AppSearchBar({Key? key}) : super(key: key);
   final TextEditingController _controller = TextEditingController(text: 'Saint Petersburg');


   @override
  Widget build(BuildContext context) {
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
        
        transformWidget(
          transform_child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: 40,  // Consistent height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5, spreadRadius: 2),
              ],
            ),
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(FeatherIcons.search, size: 20),
                border: InputBorder.none,
                hintText: 'Search location...',
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              ),
            ),
          ),
        ),
        
        
        SizedBox(width: 15),
        transformWidget(
          transform_child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5, spreadRadius: 2),
              ],
            ),
            child: Icon(FeatherIcons.sliders, size: 20),
          ),
        ),
      ],
    );
  }
}
