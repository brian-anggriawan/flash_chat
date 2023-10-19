import 'package:flutter/material.dart';
import './views/home.dart';
import './views/login.dart';
import './views/register.dart';
import './views/chat.dart';

final Map<String, WidgetBuilder> customRoutes = {
  '/': (context) => Home(),
  '/login': (context) => Login(),
  '/register': (context) => Register(),
  '/chat': (context) => Chat(),
};
