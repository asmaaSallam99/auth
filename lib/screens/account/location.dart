import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Language.dart';
class location extends StatelessWidget {
  location({Key? key}) : super(key: key) {
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  bool usa=true;
  bool ua=false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.grey[100],
          leading:
          IconButton(onPressed: () {
            Navigator.pop(context);
          },
              icon: Icon(
                Icons.arrow_back_ios, size: 40, color: Colors.deepPurple,)),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 12, top: 30, right: 12),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(' location',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      Row(children:
                      [Padding(padding: EdgeInsets.only(left: 0,top: 110,right: 20)),
                        Text('Egypt', style: TextStyle(fontSize: 20),),
                        Padding(padding: EdgeInsets.only(left: 100,top: 50,right: 20)),
                        Checkbox(value:usa,
                          onChanged: (val) {
                         setState(() {
                          usa = val!;
    }
    );
    }
    )
                                ],),
                                Row(children:
                                [Padding(padding: EdgeInsets.only(left: 0,top: 70,right: 20)),
                                Text('Saudi Arabia', style: TextStyle(fontSize: 20,),),
                                Padding(padding: EdgeInsets.only(left: 10,top: 50,right: 50)),
                                Checkbox(value:ua, onChanged: (value){
                                setState((){
                                ua=value! ;
                                });

                                }

    )
                      ],),
                      Padding(padding: EdgeInsets.only(left: 20,top: 50,right: 20)),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            onPrimary: Colors.black
                        ),
                        onPressed: (){},
                        child:Text('Ok',style: TextStyle(fontSize: 20),),
                      )





                    ]
                )
            )
        )


    );
  }





}

//void setState(Null Function() param0) {
//}






