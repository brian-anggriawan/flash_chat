import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/icon_flash_chat.dart';
import '../widgets/input_flash_chat.dart';
import '../widgets/button_flash_chat.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool isProcessRegiter = false;
  String email = '';
  String password = '';

  Future registerFirebase() async {
    try {
      setState(() {
        isProcessRegiter = true;
      });
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (context.mounted) Navigator.pushNamed(context, '/chat');
      setState(() {
        isProcessRegiter = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isProcessRegiter,
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
                keyboardType: TextInputType.emailAddress,
                hintText: 'Input your email',
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
                hintText: 'Input your password',
                obscureText: true,
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
                buttonColor: Colors.blue,
                buttonText: 'Register',
                onPressed: () async {
                  await registerFirebase();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
