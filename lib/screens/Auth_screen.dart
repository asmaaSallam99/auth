import 'package:flutter/material.dart';
import 'package:homz/widgets/Auth_widgets/reset_password_form.dart';
import 'package:homz/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late bool resetPassword;
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
              duration: Duration(seconds: 1),
              left: (resetPassword) ? -MediaQuery.of(context).size.width : 0,
              child: Authform(
                toggleResetPassword,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: (resetPassword) ? 0 : MediaQuery.of(context).size.width,
              child: ResetPasswordForm(),
            ),
          ],
        ),
      ),
    );
  }
}
