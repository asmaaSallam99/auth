import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class logout extends StatelessWidget {
  const logout({Key? key}) : super(key: key);


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
        height: MediaQuery.of(context).size.height,
    width: double.infinity,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Column(
    children: [
    Column(
    children: [
    Text ("Logout", style: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    ),),
    SizedBox(height: 20,),
    Padding(padding:EdgeInsets.all(6.0)),
    Text("Do you want to logout ? ",style: TextStyle(
    fontSize: 20,
    color: Colors.deepPurple,
    ),),

      Padding(padding: EdgeInsets.all(20.0)),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue.shade100,
            onPrimary: Colors.deepPurple
        ),
        onPressed: (){},
        child:Text('Ok',style: TextStyle(fontSize: 20),),
      ),
      Padding(padding: EdgeInsets.all(20.0)),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.blue.shade100,
            onPrimary: Colors.deepPurple
        ),
        onPressed: (){},
        child:Text('Cancel',style: TextStyle(fontSize: 20),),
      )


    ]
    )
    ]
    )
    ]
    )
    )
    );

  }
}