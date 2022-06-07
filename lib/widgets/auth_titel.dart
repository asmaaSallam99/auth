import 'package:flutter/material.dart';

class Authtitel extends StatelessWidget {
  final String title;
  final Color titleColor;
  const Authtitel(key, this.title, this.titleColor) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            const Text('your account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ))
          ],
        ));
  }
}
