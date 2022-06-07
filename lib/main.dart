import 'package:flutter/material.dart';
import 'package:homz/screens/Auth_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'homz',
      theme: ThemeData(
        fontFamily: 'MontserratAlternates',
        primarySwatch: Colors.purple,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthScreen(),
    );
  }
}
