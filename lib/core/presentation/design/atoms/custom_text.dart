import 'package:challenge_keppri/core/presentation/design/tokens/colors.dart';
import 'package:challenge_keppri/core/presentation/design/tokens/styles.dart';
import 'package:flutter/material.dart';

enum TextStyleType {
  bodyLarge,
  bodyMedium,
  bodySmall,
}

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final TextStyleType? styleType;
  final bool? seeAsteric;

  const CustomText(
    this.text, {
    super.key,
    this.textColor,
    this.fontWeight,
    this.textDecoration,
    this.maxLines,
    this.textAlign,
    this.fontSize = 16,
    this.overflow,
    this.height = 1,
    this.styleType = TextStyleType.bodyMedium,
    this.seeAsteric = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines ?? 100,
      overflow: overflow ?? TextOverflow.ellipsis,

      // Llama a la función para obtener el estilo
      text: TextSpan(
          style: styles.textStyle(
            fontWeight: fontWeight,
            fontSize: fontSize,
            textColor: textColor,
            textDecoration: textDecoration,
            height: height,
          ),
          children: [
            TextSpan(text: text),
            if (seeAsteric!)
              TextSpan(
                text: '*',
                style: styles.textStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  textColor: colors.pinkColor,
                  height: height,
                ),
              )
          ]),
    );
  }
}
