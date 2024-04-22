import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SubTitleTextWidget extends StatelessWidget {
  const SubTitleTextWidget({
    super.key,
    required this.label,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.color,
    this.textDirection = TextDecoration.none,
  });

  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration textDirection;

  @override
  Widget build(BuildContext context) {
    return Text(label,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: textDirection,
          color: color,
          fontStyle: fontStyle,
        ));
  }
}
