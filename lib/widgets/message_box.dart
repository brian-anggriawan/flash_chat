import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox(
      {required this.messageText,
      required this.fontSize,
      required this.chatPosition});

  final String messageText;
  final double fontSize;
  final CrossAxisAlignment chatPosition;

  @override
  Widget build(BuildContext context) {
    final bool isMe = chatPosition == CrossAxisAlignment.end ? true : false;

    BorderRadius borderMessagebox() {
      if (isMe) {
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        );
      } else {
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: chatPosition,
        children: [
          Material(
            color: isMe ? Colors.lightBlueAccent : Colors.white70,
            borderRadius: borderMessagebox(),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                messageText,
                style: TextStyle(
                  fontSize: fontSize,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '5 juni 2023 12:34',
            style: TextStyle(color: Colors.grey, fontSize: 10),
          )
        ],
      ),
    );
  }
}
