import 'package:challenge_keppri/core/presentation/design/atoms/custom_text.dart';
import 'package:challenge_keppri/core/presentation/design/tokens/colors.dart';
import 'package:challenge_keppri/core/presentation/design/tokens/styles.dart';
import 'package:challenge_keppri/core/presentation/utils/validators.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final bool? enabled;
  final InputValueType? inputValueType;
  final String? hintText;
  final String? suffixIconPath;
  final Function(String)? onChanged;
  final bool? seeAsteric;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.suffixIconPath,
    this.controller,
    this.enabled = true,
    this.inputValueType = InputValueType.text,
    this.hintText,
    this.onChanged,
    this.seeAsteric = false,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode focusNode = FocusNode();
  bool obscureText = false;
  bool? showError;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
    Future.delayed(
      Duration.zero,
      () => {
        _defineObscureTextValue(),
        _addTextControllerListener(),
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

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
        const SizedBox(height: 8),
        Container(
          height: widget.inputValueType == InputValueType.paragraph ? 53 : 48,
          padding: const EdgeInsets.only(left: 16, right: 18),
          alignment: widget.inputValueType == InputValueType.paragraph
              ? Alignment.topLeft
              : Alignment.center,
          decoration: BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: _accentColor())),
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: widget.controller,
            validator: (x) => _validateInput(x ?? ''),
            onChanged: widget.onChanged,
            enabled: widget.enabled,
            textInputAction: TextInputAction.newline,
            inputFormatters: const [],
            style: styles.textStyle(textColor: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                errorStyle:
                    const TextStyle(fontSize: 0.1, color: Colors.transparent),
                hintStyle: styles.textStyle(
                  textColor: colors.disabledTextColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                )),
            keyboardType: _keyboardType(),
            obscureText: obscureText,
            cursorWidth: 1,
            cursorColor: Colors.white,
            maxLines: widget.inputValueType == InputValueType.paragraph ? 4 : 1,
          ),
        ),
        Container(
          height: 20,
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              if (showError ?? false) ...[
                const SizedBox(height: 4),
                CustomText(
                  errorMessage,
                  textColor: Colors.red,
                  fontSize: 12,
                )
              ]
            ],
          ),
        ),
      ],
    );
  }

  void onTapSuffixIcon() {
    obscureText = !obscureText;
    setState(() {});
  }

  Color _accentColor() {
    if (showError ?? false) {
      return Colors.red;
    }
    return focusNode.hasFocus ? Colors.white : colors.borderButtonColor;
  }

  _defineObscureTextValue() {
    setState(() {
      obscureText = (widget.inputValueType == InputValueType.password);
    });
  }

  _validate(String text) {
    switch (widget.inputValueType) {
      case InputValueType.email:
        errorMessage = validateEmail(text);
        break;
      case InputValueType.name:
        errorMessage = validateName(text);
        break;
      case InputValueType.none:
        break;
      case InputValueType.paragraph:
        errorMessage = validateParagraph(text);
        break;
      case InputValueType.text:
      default:
        errorMessage = validateText(text);
        break;
    }
    showError = errorMessage != null;
    return errorMessage;
  }

  _addTextControllerListener() {
    if (widget.controller != null) {
      widget.controller!.addListener(() {});
    }
  }

  String? _validateInput(String x) {
    _validate(x);
    setState(() {});
    return errorMessage;
  }

  _keyboardType() {
    switch (widget.inputValueType) {
      case InputValueType.email:
        return TextInputType.emailAddress;
      case InputValueType.paragraph:
        return TextInputType.multiline;
      case InputValueType.text:
      case InputValueType.name:
      default:
        return TextInputType.text;
    }
  }
}

enum InputValueType {
  text,
  password,
  email,
  name,
  none,
  paragraph,
}
