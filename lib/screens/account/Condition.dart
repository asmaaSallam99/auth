import 'package:flutter/material.dart';
import 'User.dart';

class Condition extends StatelessWidget {
  const Condition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 40,
              color: Colors.deepPurple,
            )),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: const [
              ListTile(
                title: Text(
                  "Terms and Condition",
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                ),
              ),
              Divider(
                height: 40,
                color: Colors.black,
                thickness: 1.7,
              ),
              ListTile(
                  contentPadding: EdgeInsets.all(3.0),
                  title: Text(
                    "By using a site and an application with shop, you agree to"
                    " be bound by these terms and conditions. Contacting you or informing you of any "
                    "changes made to the terms and conditions.We welcome all of your comments"
                    "on any of the policies or The rules we list below",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
