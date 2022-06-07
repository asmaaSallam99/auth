import 'package:flutter/material.dart';
import 'package:homz/widgets/auth_titel.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                  duration: Duration(milliseconds: 400),
                  child: Authtitel(
                    UniqueKey(),
                    'Reset password of ',
                    Colors.purple,
                  )),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.purple,
                    ),
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
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.purple,
                    ),
                    // obscureText: hidePassword,
                    decoration: InputDecoration(
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            // hidePassword = !hidePassword;
                          });
                        },
                        child: Icon(
                            // (hidePassword)
                            Icons.visibility

                            // color: Colors.white,
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
                ],
              )),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  shape: StadiumBorder(),
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      child: Text(
                        'Reset Password',
                        key: UniqueKey(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                  color: Colors.purple,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
