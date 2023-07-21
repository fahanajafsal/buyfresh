import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class cart extends StatelessWidget {
  const cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(
       title: Text("Cart"),
       
      backgroundColor: Colors.black12,
      
      
       ),

       body: ListView(
        children: [
          Container(
            height: 700,
            padding: EdgeInsets.only(top:15),
            decoration: BoxDecoration(

              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )
            ),

            child: Column(
              children: [
                
              ],
            ),
          )
        ],
       ),
    );
  }
}