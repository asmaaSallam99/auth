import 'package:flutter/material.dart';

import 'components/auth_form.dart';
import 'components/reset_password_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool resetPassword;

  @override
  void initState() {
    super.initState();
    resetPassword = false;
  }

  void toggleResetPassword() {
    setState(() {
      resetPassword = !resetPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: (resetPassword) ? -MediaQuery.of(context).size.width : 0,
              child: AuthForm(
                toggleResetPassword,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              left: (resetPassword) ? 0 : MediaQuery.of(context).size.width,
              child: ResetPasswordForm(toggleResetPassword),
            ),
          ],
        ),
      ),
    );
  }
}
