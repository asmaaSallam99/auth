import 'package:homz/screens/auth_screen/Auth_screen.dart';
import 'package:homz/screens/home/home_screen.dart';
import 'package:homz/services/authentication/authentication_service.dart';
import 'package:flutter/material.dart';

class AuthenticationWrapper extends StatelessWidget {
  static const String routeName = "/authentication_wrapper";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthenticationService().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return AuthScreen();
        }
      },
    );
  }
}
