import 'package:flutter/material.dart';
import '../widgets/icon_flash_chat.dart';
import '../widgets/button_flash_chat.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  late AnimationController animationController;
  late Animation animation;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconFlashChat(
                    iconHeight: 60,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                        speed: Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              ButtonFlashchat(
                buttonText: 'Log in',
                buttonColor: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              SizedBox(
                height: 30,
              ),
              ButtonFlashchat(
                buttonText: 'Register',
                buttonColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
