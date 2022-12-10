import 'package:flutter/material.dart';

import '../../utils/ui_helpers.dart';

class SMCardItem extends StatelessWidget {
  
  final Widget child;
  final Color color;
  final Color splashColor;
  final Function() onTap;
  const SMCardItem({super.key, required this.child, 
  required this.color, required this.splashColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.all(15.0),
      child: Material(
        color: color,
        elevation: 10.0,
        borderRadius: BorderRadius.circular(15.0),
        shadowColor: shadowColor(context),
        child: InkWell(
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(15.0),
          // ignore: unnecessary_null_comparison
          onTap: onTap == null ? doNothing : () => onTap(),
          child: child,
        ),
      ),);
  }
}