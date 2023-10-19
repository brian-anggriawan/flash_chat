import 'package:flutter/material.dart';

class IconFlashChat extends StatelessWidget {
  const IconFlashChat({this.iconHeight});

  final double? iconHeight;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Hero(
        tag: 'logo',
        child: Container(
          height: iconHeight,
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
