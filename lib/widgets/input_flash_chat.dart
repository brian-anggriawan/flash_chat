import 'package:flutter/material.dart';

class InputFlashChat extends StatelessWidget {
  const InputFlashChat(
      {required this.onChangedInputFlashChat,
      this.hintText,
      this.borderColor,
      this.obscureText,
      this.keyboardType,
      this.controller});

  final Function(String) onChangedInputFlashChat;
  final String? hintText;
  final Color? borderColor;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) => onChangedInputFlashChat(value),
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor!, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
