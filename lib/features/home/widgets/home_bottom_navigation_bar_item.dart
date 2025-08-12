import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomeBottomNavigationBarItem extends BottomNavigationBarItem {
  HomeBottomNavigationBarItem({
    required String iconPath,
    required String activeIconPath,
    required bool isSelected,
  }) : super(
         icon: AnimatedSwitcher(
           duration: const Duration(milliseconds: 400),
           transitionBuilder: (child, animation) {
             return ScaleTransition(scale: animation, child: child);
           },
           child:
               isSelected
                   ? SvgPicture.asset(
                     activeIconPath,
                     fit: BoxFit.scaleDown,
                     key: ValueKey(activeIconPath),
                   )
                   : SvgPicture.asset(
                     iconPath,
                     fit: BoxFit.scaleDown,
                     key: ValueKey(iconPath),
                   ),
         ),
         label: '',
       );
}
