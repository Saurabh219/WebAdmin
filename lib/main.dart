import 'package:flutter/material.dart';
import 'package:webapp/screens/home_screen.dart';

void main() {
  runApp(WebApp());
}


class WebApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xff2A323C),
        )
      ),
      home: HomePage(),
    );
  }
}
