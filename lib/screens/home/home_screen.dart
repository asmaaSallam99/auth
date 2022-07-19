import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';
import 'components/home_screen_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      floatingActionButton: IconButton(
        onPressed: () {},iconSize: 60,
        icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor.withOpacity(0.3),
          ),
          child: Center(
            child: Icon(
              Icons.camera_alt_rounded,
              color: Theme.of(context).primaryColor,
              size: 40,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: HomeScreenDrawer(),
    );
  }
}
