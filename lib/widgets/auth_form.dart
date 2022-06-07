import 'package:flutter/material.dart';
import 'package:homz/screens/categories.dart';
import 'package:homz/widgets/auth_titel.dart';

class Authform extends StatefulWidget {
  final Function? toggleResetPassword;

  const Authform(
    this.toggleResetPassword, {
    Key? key,
  }) : super(key: key);

  @override
  _AuthformState createState() => _AuthformState();
}

class _AuthformState extends State<Authform> {
  late bool hidePassword, hideConfirmPassword, loginmode;
  @override
  void initState() {
    super.initState();
    hidePassword = hideConfirmPassword = loginmode = true;
  }

  static final _formKey = GlobalKey<FormState>();

  TextEditingController _passwordCtrl = TextEditingController();
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
                child: (loginmode)
                    ? Authtitel(UniqueKey(), 'login into', Colors.purple)
                    : Authtitel(UniqueKey(), 'Creat', Colors.purple),
              ),
              Form(
                key: _formKey,
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
                            color: Colors.white,
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
                        if (text!.isNotEmpty && text.length > 6)
                          return null;
                        else
                          return 'Password must be greater than 6';
                      },
                      controller: _passwordCtrl,
                      obscureText: hidePassword,
                      decoration: InputDecoration(
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
                      duration: Duration(milliseconds: 900),
                      curve: Curves.bounceOut,
                      height: (loginmode) ? 0 : 70,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 400),
                        opacity: (loginmode) ? 0 : 1,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.purple,
                          ),
                          obscureText: hideConfirmPassword,
                          validator: (text) {
                            if (text!.isNotEmpty && text == _passwordCtrl.text)
                              return null;
                            else
                              return 'password not matched';
                          },
                          decoration: InputDecoration(
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
                visible: loginmode,
                replacement: const SizedBox(
                  height: 10,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    child: const Text(
                      'reset Password',
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
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  shape: StadiumBorder(),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: (loginmode)
                        ? Text(
                            'login',
                            key: UniqueKey(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            'Register',
                            key: UniqueKey(),
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  color: Colors.purple,
                  onPressed: () {
                    if (!loginmode) {
                      if (_formKey.currentState!.validate()) {}
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Categories()));
                    }
                  },
                ),
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 400),
                child: (loginmode)
                    ? FlatButton(
                        key: UniqueKey(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                            loginmode = !loginmode;
                          });
                        },
                      )
                    : FlatButton(
                        key: UniqueKey(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Alredy have an account',
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
                            loginmode = !loginmode;
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
}
