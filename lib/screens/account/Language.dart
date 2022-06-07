import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class language extends StatelessWidget {
  language({Key? key}) : super(key: key) {}
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  bool usa = true;
  bool ua = false;
  @override
  Widget build(BuildContext context) {
    // var FontAwesomeIcons;
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
            padding: EdgeInsets.only(left: 12, top: 50, right: 12),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: 0, top: 110, right: 20)),
                      // Icon(MyFlutterApp.mood,size: 20,color: Colors.blue,),

                      Text(
                        'Arabic',
                        style: TextStyle(fontSize: 30),
                      ),
                      Checkbox(
                          value: usa,
                          onChanged: (val) {
                            setState(() {
                              usa = val!;
                            });
                          })
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.only(left: 0, top: 70, right: 20)),
                      Text(
                        'English',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Checkbox(
                          value: ua,
                          onChanged: (val) {
                            setState(() {
                              ua = val!;
                            });
                          })
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, onPrimary: Colors.black),
                    onPressed: () {},
                    child: Text(
                      'Ok',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]))));
  }

  // void setState(Null Function() param0) {}

}

void setState(Null Function() param0) {}
