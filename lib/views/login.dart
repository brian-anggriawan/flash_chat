import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/icon_flash_chat.dart';
import '../widgets/input_flash_chat.dart';
import '../widgets/button_flash_chat.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _auth = FirebaseAuth.instance;
  bool isProcessLogin = false;
  String email = '';
  String password = '';

  Future<void> loginFirebase() async {
    try {
      setState(() {
        isProcessLogin = true;
      });
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) Navigator.pushNamed(context, '/chat');
      setState(() {
        isProcessLogin = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isProcessLogin,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IconFlashChat(
                iconHeight: 200,
              ),
              SizedBox(
                height: 48,
              ),
              InputFlashChat(
                borderColor: Colors.blue,
                hintText: 'Input your email',
                keyboardType: TextInputType.emailAddress,
                onChangedInputFlashChat: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 8,
              ),
              InputFlashChat(
                borderColor: Colors.blue,
                obscureText: true,
                hintText: 'Input your password',
                onChangedInputFlashChat: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 24,
              ),
              ButtonFlashchat(
                buttonColor: Colors.lightBlueAccent,
                buttonText: 'Log in',
                onPressed: () async {
                  await loginFirebase();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
