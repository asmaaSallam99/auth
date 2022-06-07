import 'package:flutter/material.dart';
class Add extends StatelessWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
   Add({Key? key}) : super(key: key);
  final items = ['القاهرة', 'الجيزة', 'الاسكندرية','الغربية','كفر الشيخ','البحيرة','المنوفية','القليوبية','الشرقية','الساحل الشمالي','طنطا'];
  String? value;

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
        }, icon: Icon(Icons.arrow_back_ios, size: 40, color: Colors.deepPurple,)),
      ),
      body: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Column(
                        children: [

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40
                            ),
                            child: Column(
                              children: [
                                makeInput(label: "Address"),
                                makeInput(label: "First Name"),
                                makeInput(label: "Phone Number"),
                                makeInput(label: "Phone Number"),


                              ],
                            ),
                          ),

                        ]


                    ),
                    Column(
                      children: [
                        Column(
                         children: [

                     Padding(
                        padding: EdgeInsets.only(left: 10, top: 10, right: 300),

                        child: DropdownButton<String>(
                          value: value,
                          iconSize: 30,
                          icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                          isExpanded: true,
                          items: items.map(buildMenuItem).toList(),
                           onChanged: (value) =>
                              setState(() => this.value = value),

                        )
                     ),
                           Padding(
                             padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                             child: Container(
                               padding: EdgeInsets.only(top: 3,left: 3),
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(40),
                                   border: Border(
                                       bottom: BorderSide(color: Colors.black),
                                       top: BorderSide(color: Colors.black),
                                       right: BorderSide(color: Colors.black),
                                       left: BorderSide(color: Colors.black)
                                   )
                               ),
                               child: MaterialButton(
                                 minWidth: double.infinity,
                                 height:60,
                                 onPressed: (){},
                                 color: Colors.indigoAccent[400],
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(40)
                                 ),
                                 child: Text("Add Address",style: TextStyle(
                                     fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70
                                 ),),
                               ),
                             ),
                           ),
                  ],

                ),

              ]

          )
    ]
      )
    ]),
    )
    );
  }
    DropdownMenuItem<String> buildMenuItem(String item)=>DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 30),
      ),
    );

  setState(String? Function() param0) {}
  }


  Widget makeInput({label, obsureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87
        ),),
        SizedBox(height: 1,),
        TextField(
          obscureText: obsureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
            ),
          ),
        ),
        SizedBox(height: 4,)

      ],
    );
  }
