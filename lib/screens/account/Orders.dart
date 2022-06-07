import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add.dart';
class Orders extends StatelessWidget {
  // Orders({Key? key, }) : super(key: key) {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey[100],
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 40,color: Colors.deepPurple,)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, top: 50, right: 12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text("Orders",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),),

              ),
              const Divider(
                height: 2,
                color: Colors.black,
                thickness: 1,
              ),
              Padding(padding:EdgeInsets.only(left: 20,top: 50,right: 20)),
              TextButton.icon(
                onPressed: () {

                  // Respond to button press
                },

                icon: Icon(Icons.add, size: 30,color: Colors.deepPurple,),
                label: Text("Add Order",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple)),
              )

            ],

          ),

        ),

      ),
    );
  }


}


