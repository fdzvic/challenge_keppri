import 'package:challenge_keppri/core/presentation/design/atoms/custom_text.dart';
import 'package:challenge_keppri/core/presentation/design/tokens/colors.dart';
import 'package:challenge_keppri/core/presentation/utils/extension/dimens_extension.dart';
import 'package:flutter/material.dart';

class CustomToggleButtons extends StatefulWidget {
  final String label;
  final bool? seeAsteric;
  final List<bool> isSelected;
  final void Function(int) onPressed;

  const CustomToggleButtons({
    super.key,
    required this.label,
    this.seeAsteric = true,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          widget.label,
          fontWeight: FontWeight.w500,
          fontSize: 16,
          height: 1.5,
          seeAsteric: widget.seeAsteric,
        ),
        const SizedBox(height: 12),
        ToggleButtons(
          borderColor: colors.borderButtonColor,
          selectedBorderColor: colors.borderColor,
          fillColor: colors.buttonSelectedColor,
          color: Colors.white,
          selectedColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16),
          isSelected: widget.isSelected,
          onPressed: widget.onPressed,
          children: [
            SizedBox(
                width: context.width(.45),
                child: const CustomText(
                  "Sí",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(
                width: context.width(.45),
                child: const CustomText(
                  "No",
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ],
    );
  }
}
