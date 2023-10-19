import 'package:flash_chat/widgets/input_flash_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/message_box.dart';

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _Chat();
}

class _Chat extends State<Chat> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  String message = '';
  late User loggedInUser;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  void sendMessage() async {
    if (message.trim() != '') {
      await _fireStore.collection('mymessages').add({
        'text': message,
        'sender': loggedInUser.email,
        'destination': 'ivovounder@gmail.com'
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loggedInUser.email!,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _fireStore.collection('mymessages').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs.reversed;
                    List<Widget> messageWidget = [];
                    for (var message in messages) {
                      messageWidget.add(
                        MessageBox(
                          messageText: message['text'],
                          chatPosition: message['sender'] == loggedInUser.email
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          fontSize: 15,
                        ),
                      );
                    }
                    return Expanded(
                      child: ListView(
                        reverse: true,
                        children: messageWidget,
                      ),
                    );
                  }
                  return Text('Has not a message');
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: InputFlashChat(
                      controller: messageTextController,
                      onChangedInputFlashChat: (value) async {
                        setState(() {
                          message = value;
                        });
                      },
                      borderColor: Colors.lightBlueAccent,
                      hintText: 'Write your message',
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Material(
                    color: Colors.lightBlueAccent,
                    elevation: 5,
                    borderRadius: BorderRadius.circular(30),
                    child: MaterialButton(
                      onPressed: () {
                        sendMessage();
                        messageTextController.clear();
                      },
                      minWidth: 10,
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListChat {
  ListChat({
    required this.message,
    required this.sender,
  });

  ListChat.fromJson(Map<String, Object?> json)
      : this(
          message: json['rated']! as String,
          sender: json['sender']! as String,
        );

  final String message;
  final String sender;

  Map<String, Object?> toJson() {
    return {
      'message': message,
      'sender': sender,
    };
  }
}
