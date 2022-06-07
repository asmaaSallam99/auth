import 'package:flutter/material.dart';
import 'Address.dart';
import 'Condition.dart';
import 'Connect.dart';
import 'Language.dart';
import 'Orders.dart';
import 'location.dart';
import 'log_out.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      //appBar: AppBar(
      // title: Text("profile"),
      //),
      body: Container(
          padding: EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("images/dina.png"),
                ),
                Text(
                  "dina salama",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "dinasalama1652@gmail.com",
                  style: TextStyle(fontSize: 18),
                ),
                ListTile(
                  title: Text("orders"),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,
                        size: 35, color: Colors.deepPurpleAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Orders();
                      }));
                    },
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.black,
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Terms and Condition'),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,
                        size: 35, color: Colors.deepPurpleAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Condition();
                      }));
                    },
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.black,
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Addresses'),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,
                        size: 35, color: Colors.deepPurpleAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Address();
                      }));
                    },
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.black,
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Language'),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,
                        size: 35, color: Colors.deepPurpleAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return language();
                      }));
                    },
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.black,
                  thickness: 1,
                ),
                ListTile(
                  title: Text('delivary location'),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_back_ios_outlined,
                        size: 35, color: Colors.deepPurpleAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return location();
                      }));
                    },
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.black,
                  thickness: 1,
                ),
                ListTile(
                  title: Text('Coneect with me'),
                  trailing: IconButton(
                    icon: Icon(Icons.add_call,
                        size: 35, color: Colors.deepPurpleAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Connect();
                      }));
                    },
                  ),
                ),
                const Divider(
                  height: 2,
                  color: Colors.black,
                  thickness: 1,
                ),
                ListTile(
                  title: Text('logout'),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_back,
                        size: 35, color: Colors.deepPurpleAccent),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return logout();
                      }));
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

  hexColor(String colorhexcode) {}
}
