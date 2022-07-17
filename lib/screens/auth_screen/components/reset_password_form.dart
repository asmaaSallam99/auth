import 'package:flutter/material.dart';
import 'package:homz/components/async_progress_dialog.dart';
import 'package:homz/constants.dart';
import 'package:homz/exceptions/firebase_auth/credential_actions_exceptions.dart';
import 'package:homz/exceptions/firebase_auth/messaged_firebase_auth_exception.dart';
import 'package:homz/services/authentication/authentication_service.dart';
import 'package:logger/logger.dart';

import 'auth_title.dart';

class ResetPasswordForm extends StatefulWidget {
  final Function onBackPressed;

  const ResetPasswordForm(
    this.onBackPressed, {
    Key key,
  }) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailFieldController = TextEditingController();

  @override
  void dispose() {
    emailFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.deepPurple,
            ),
            onPressed: () {
              widget.onBackPressed?.call();
            },
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: AuthTitle(
                      UniqueKey(),
                      'Reset password of ',
                      Colors.purple,
                    )),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.purple,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailFieldController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return kEmailNullError;
                          } else if (!emailValidatorRegExp.hasMatch(value)) {
                            return kInvalidEmailError;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
                              width: 1,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.purple,
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    shape: const StadiumBorder(),
                    child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: Text(
                          kResetPassword,
                          key: UniqueKey(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                    color: Colors.purple,
                    onPressed: sendVerificationEmailButtonCallback,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendVerificationEmailButtonCallback() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final String emailInput = emailFieldController.text.trim();
      bool resultStatus;
      String snackBarMessage;
      try {
        final resultFuture =
            AuthentificationService().resetPasswordForEmail(emailInput);
        resultFuture.then((value) => resultStatus = value);
        resultStatus = await showDialog(
          context: context,
          builder: (context) {
            return AsyncProgressDialog(
              resultFuture,
              message: Text("Sending verification email"),
            );
          },
        );
        if (resultStatus == true) {
          snackBarMessage = "Password Reset Link sent to your email";
        } else {
          throw FirebaseCredentialActionAuthUnknownReasonFailureException(
              message:
                  "Sorry, could not process your request now, try again later");
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
}
