import 'package:challenge_keppri/core/presentation/design/tokens/colors.dart';
import 'package:flutter/material.dart';

class CustomStyles {
  TextStyle textStyle(
          {FontWeight? fontWeight,
          double? fontSize,
          Color? textColor,
          TextDecoration? textDecoration,
          double? height,
          FontStyle? fontStyle}) =>
      TextStyle(
          fontFamily: 'Futura',
          fontWeight: fontWeight ?? FontWeight.w400,
          fontStyle: fontStyle,
          fontSize: fontSize,
          color: textColor ?? colors.textColor,
          decoration: textDecoration ?? TextDecoration.none,
          decorationColor: textColor ?? Colors.black,
          height: height);
}

final CustomStyles styles = CustomStyles();
