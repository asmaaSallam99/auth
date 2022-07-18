import 'package:flutter/material.dart';
import 'package:homz/components/async_progress_dialog.dart';
import 'package:homz/exceptions/firebase_auth/messaged_firebase_auth_exception.dart';
import 'package:homz/exceptions/firebase_auth/signin_exceptions.dart';
import 'package:homz/exceptions/firebase_auth/signup_exceptions.dart';
import 'package:homz/services/authentication/authentication_service.dart';
import 'package:logger/logger.dart';

import '../../../constants.dart';
import 'auth_title.dart';

class AuthForm extends StatefulWidget {
  final Function toggleResetPassword;

  const AuthForm(
    this.toggleResetPassword, {
    Key key,
  }) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool hidePassword, hideConfirmPassword, loginMode;

  @override
  void initState() {
    super.initState();
    hidePassword = hideConfirmPassword = loginMode = true;
  }

  static final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmPasswordCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: (loginMode)
                    ? AuthTitle(UniqueKey(), 'login into', Colors.purple)
                    : AuthTitle(UniqueKey(), 'Create', Colors.purple),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.purple),
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (_emailCtrl.text.isEmpty) {
                          return kEmailNullError;
                        } else if (!emailValidatorRegExp
                            .hasMatch(_emailCtrl.text)) {
                          return kInvalidEmailError;
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.purple,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                        labelText: 'Email',
                        hintText: 'example@abc.com',
                        labelStyle: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.purple,
                      ),
                      validator: (text) {
                        if (text.isEmpty) {
                          return kPassNullError;
                        } else if (text.length < 8) {
                          return kShortPassError;
                        }
                        return null;
                      },
                      controller: _passwordCtrl,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.purple,
                        ),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: Icon(
                            (hidePassword)
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.purple,
                          ),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 1,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.purple,
                            width: 3,
                          ),
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                        focusedErrorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 3,
                          ),
                        ),
                        labelText: 'password',
                        hintText: '********',
                        labelStyle: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.bounceOut,
                      height: (loginMode) ? 0 : 70,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: (loginMode) ? 0 : 1,
                        child: TextFormField(
                          controller: _confirmPasswordCtrl,
                          style: const TextStyle(
                            color: Colors.purple,
                          ),
                          obscureText: hideConfirmPassword,
                          validator: (value) {
                            if (loginMode) return null;
                            if (_confirmPasswordCtrl.text.isEmpty) {
                              return kPassNullError;
                            } else if (_confirmPasswordCtrl.text !=
                                _passwordCtrl.text) {
                              return kMatchPassError;
                            } else if (_confirmPasswordCtrl.text.length < 8) {
                              return kShortPassError;
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.purple,
                            ),
                            suffix: InkWell(
                              onTap: () {
                                setState(() {
                                  hideConfirmPassword = !hideConfirmPassword;
                                });
                              },
                              child: Icon(
                                (hideConfirmPassword)
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.purple,
                              ),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 1,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.purple,
                                width: 3,
                              ),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 3,
                              ),
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 3,
                              ),
                            ),
                            labelText: 'Confirm Password',
                            hintText: '********',
                            labelStyle: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                            hintStyle: const TextStyle(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: loginMode,
                replacement: const SizedBox(
                  height: 10,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: const Text(
                      kResetPassword,
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    onPressed: () {
                      widget.toggleResetPassword?.call();
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  shape: const StadiumBorder(),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: (loginMode)
                        ? Text(
                            'login',
                            key: UniqueKey(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Register',
                            key: UniqueKey(),
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  color: Colors.purple,
                  onPressed: () {
                    if (!loginMode) {
                      signUpButtonCallback();
                    } else {
                      signInButtonCallback();
                    }
                  },
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: (loginMode)
                    ? FlatButton(
                        key: UniqueKey(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'don\'t have an account',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            loginMode = !loginMode;
                          });
                        },
                      )
                    : FlatButton(
                        key: UniqueKey(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Already have an account',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            loginMode = !loginMode;
                          });
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInButtonCallback() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final AuthenticationService authService = AuthenticationService();
      bool signInStatus = false;
      String snackBarMessage;
      try {
        final signInFuture = authService.signIn(
          email: _emailCtrl.text.trim(),
          password: _passwordCtrl.text.trim(),
        );
        //signInFuture.then((value) => signInStatus = value);
        signInStatus = await showDialog(
          context: context,
          builder: (context) {
            return AsyncProgressDialog(
              signInFuture,
              message: Text("Signing in to account"),
              onError: (e) {
                snackBarMessage = e.toString();
              },
            );
          },
        );
        if (signInStatus == true) {
          snackBarMessage = "Signed In Successfully";
        } else {
          if (snackBarMessage == null) {
            throw FirebaseSignInAuthUnknownReasonFailure();
          } else {
            throw FirebaseSignInAuthUnknownReasonFailure(
                message: snackBarMessage);
          }
        }
      } on MessagedFirebaseAuthException catch (e) {
        snackBarMessage = e.message;
      } catch (e) {
        snackBarMessage = e.toString();
      } finally {
        Logger().i(snackBarMessage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackBarMessage),
          ),
        );
      }
    }
  }

  Future<void> signUpButtonCallback() async {
    if (_formKey.currentState.validate()) {
      // goto complete profile page
      final AuthenticationService authService = AuthenticationService();
      bool signUpStatus = false;
      String snackBarMessage;
      try {
        final signUpFuture = authService.signUp(
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );
        signUpFuture.then((value) => signUpStatus = value);
        signUpStatus = await showDialog(
          context: context,
          builder: (context) {
            return AsyncProgressDialog(
              signUpFuture,
              message: Text("Creating new account"),
            );
          },
        );
        if (signUpStatus == true) {
          snackBarMessage =
              "Registered successfully, Please verify your email id";
        } else {
          throw FirebaseSignUpAuthUnknownReasonFailureException();
        }
      } on MessagedFirebaseAuthException catch (e) {
        snackBarMessage = e.message;
      } catch (e) {
        snackBarMessage = e.toString();
      } finally {
        Logger().i(snackBarMessage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackBarMessage),
          ),
        );
        if (signUpStatus == true) {
          Navigator.pop(context);
        }
      }
    }
  }
}
