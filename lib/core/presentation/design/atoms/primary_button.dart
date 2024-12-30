import 'package:challenge_keppri/core/presentation/design/atoms/custom_text.dart';
import 'package:challenge_keppri/core/presentation/design/tokens/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.buttonType = ButtonType.primary,
    this.icon,
    this.enabled = true,
    this.height,
    this.width,
    this.textColor,
    this.borderColor,
    this.isLoading = false,
    this.fontSizeText,
    this.buttonPadding,
    this.focusNode,
  });

  final String text;
  final Function onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final ButtonType buttonType;
  final Widget? icon;
  final bool enabled;
  final double? height;
  final double? width;
  final bool? isLoading;
  final double? fontSizeText;
  final EdgeInsetsGeometry? buttonPadding;
  final FocusNode? focusNode;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        color: _getBackgroundColor(widget.buttonType),
        border: Border.all(
          color: widget.focusNode?.hasFocus ?? false
              ? Colors.white
              : widget.borderColor ?? _getBorderColor(widget.buttonType),
        ),
      ),
      child: TextButton(
        focusNode: widget.focusNode,
        onPressed: widget.enabled && widget.isLoading == false
            ? () => widget.onPressed()
            : null,
        style: ButtonStyle(
          padding: WidgetStateProperty.all(widget.buttonPadding ??
              const EdgeInsets.symmetric(horizontal: 10)),
          minimumSize: WidgetStateProperty.all(Size(
            widget.width ?? 160,
            widget.height ?? 50,
          )),
        ),
        child: Row(
          mainAxisAlignment: widget.icon != null
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.isLoading!)
              const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(color: Colors.white),
              )
            else
              CustomText(widget.text,
                  textColor:
                      widget.textColor ?? _getTextColor(widget.buttonType),
                  fontWeight: FontWeight.w700,
                  fontSize: widget.fontSizeText ?? 16),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.primary:
        return widget.backgroundColor ??
            (widget.enabled
                ? colors.primaryButtonColor
                : colors.disabledPrimaryButtonColor);
      case ButtonType.secondary:
        return widget.backgroundColor ??
            (widget.enabled ? Colors.green : Colors.grey);
      default:
        return widget.backgroundColor ??
            (widget.enabled ? Colors.blue : Colors.grey);
    }
  }

  Color _getBorderColor(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.primary:
        return widget.borderColor ?? Colors.black;
      case ButtonType.secondary:
        return widget.borderColor ?? Colors.black;
      default:
        return widget.borderColor ?? Colors.black;
    }
  }

  Color _getTextColor(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.primary:
        return widget.textColor ?? colors.primaryColor;
      case ButtonType.secondary:
        return widget.textColor ?? Colors.black;
      default:
        return widget.textColor ?? Colors.white;
    }
  }
}

enum ButtonType { primary, secondary }
