import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';

class KTextField extends StatelessWidget {
  const KTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.borderRadius,
    this.isPassword,
    this.prefixIcon,
    this.textInputType,
    this.textInputAction,
  });

  final String hintText;
  final TextEditingController controller;
  final double? borderRadius;
  final bool? isPassword;
  final Icon? prefixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        prefixIcon: prefixIcon,
        hintText: hintText,
        filled: true,
        fillColor: AppColor.grey200,
        isCollapsed: false,
      ),
    );
  }
}

class KTextField2 extends StatelessWidget {
  const KTextField2({
    super.key,
    this.textEditingController,
    required this.hintText,
    this.borderRadius,
    this.isPassword,
    this.prefixIcon,
    this.textInputType,
    this.textInputAction,
    this.maxLines,
    this.minLines,
    this.fillColor,
    this.onSubmit,
  });

  final TextEditingController? textEditingController;
  final String hintText;
  final double? borderRadius;
  final bool? isPassword;
  final Icon? prefixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Function(String value)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: isPassword ?? false,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      onSubmitted: (value) {
        if (onSubmit != null) {
          onSubmit!(value);
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        prefixIcon: prefixIcon,
        hintText: hintText,
        filled: true,
        fillColor: fillColor ?? AppColor.grey200,
        isCollapsed: false,
      ),
    );
  }
}
