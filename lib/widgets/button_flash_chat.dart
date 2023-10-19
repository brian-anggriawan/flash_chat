import 'package:flutter/material.dart';

class ButtonFlashchat extends StatelessWidget {
  const ButtonFlashchat({this.buttonColor, this.onPressed, this.buttonText});

  final Color? buttonColor;
  final VoidCallback? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: onPressed,
        height: 42,
        minWidth: 200,
        child: Text(
          buttonText.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
