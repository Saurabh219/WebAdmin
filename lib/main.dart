import 'package:flutter/material.dart';
import 'package:webapp/app_config.dart';
import 'package:webapp/screens/home_screen.dart';
import 'package:webapp/screens/login_screen.dart';

void main() {
  runApp(WebApp());
}


class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colores().mainDarkColor(1),
        )
      ),
      home: LoginPage(),
    );
  }
}
