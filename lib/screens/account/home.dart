import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 // List<String> list=['images/dina.png','images/image2.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
       appBar: AppBar(
        backgroundColor: Colors.cyan[900],
       title:Text("Shop App",style: TextStyle(
        color: Colors.white,
      ),
       ),
           actions: <Widget>[
             new IconButton(icon:Icon( Icons.youtube_searched_for_sharp,size: 30,),
               onPressed: (){

               },
             )

         ],
       )
    );
  }
}
