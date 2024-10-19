import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:moniepoint_test/utils/colorUtils.dart';

import 'animationManager/tween_animators.dart';

class ActionButtons extends StatefulWidget {
   ActionButtons({Key? key}) : super(key: key);

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  int? selectedIndex;
  OverlayEntry? overlayEntry;
  late double left, top;

  @override
  void dispose() {

    overlayEntry?.remove();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                _showPopover(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white.withOpacity(0.6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Icon(Icons.wallet_outlined, color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(FeatherIcons.send, color: Colors.white),
            ),
          ],
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.3),

      ],
    );
  }

  void _showPopover(BuildContext context,{double? newPosition}) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.security_sharp, 'name': 'Cosy Oreos'},
      {'icon': Icons.wallet, 'name': 'Price'},
      {'icon': Icons.shopping_bag, 'name': 'Infrastructure'},
      {'icon': FeatherIcons.database, 'name': 'Without any layer'},
    ];

    if (overlayEntry != null) {

      overlayEntry?.remove();
      overlayEntry = null;
      return;
    }

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    top = offset.dy;
    left = offset.dx;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: left - 5,
        top: newPosition ?? top - 110,
        child:
        reverseTransformWidget(
          transformChild: Card(
            elevation: 1,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: items.asMap().map((index, item) {
                  return MapEntry(
                    index,
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        width: 150,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        color:  Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(item['icon'], color:  item['name'] == 'Price' ? Colors.amber : ColorUtils.BG_TEXT_COLOR, size: 18),
                            SizedBox(width: 5),
                            Text(
                              item['name'],
                              style: TextStyle(
                                fontFamily: 'EuclidRegular',
                                color: item['name'] == 'Price' ? Colors.amber :  ColorUtils.BG_TEXT_COLOR,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).values.toList(),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(overlayEntry!);
  }
}
