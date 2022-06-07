import 'package:flutter/material.dart';

import 'add.dart';
class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
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
                title: Text('Addresses',style: TextStyle(
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
                  Navigator.push(context, MaterialPageRoute(builder: ( context){
                    return Add();}));
                  // Respond to button press
                },

                icon: Icon(Icons.add, size: 30,color: Colors.deepPurple,),
                label: Text("Add Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple)),
              )

            ],

          ),

        ),

      ),
    );
  }
}