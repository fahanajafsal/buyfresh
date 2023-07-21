import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buyfresh/counter/cregister.dart';
import 'package:buyfresh/counter/valunteer/vregister.dart';
import 'package:buyfresh/register.dart';

import 'godown/gregister.dart';

class choose extends StatefulWidget {
  const choose({Key? key}) : super(key: key);

  @override
  State<choose> createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(


        body:  Container(
        height: 400,

        child:Padding(
        padding:const EdgeInsets.all(20),
    child: GridView(

    children: [

      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
        },
        child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/user.png",height: 70,),
              Text("User",style: TextStyle(color: Colors.black,fontSize: 20),)
            ],
          ),
        ),
      ),

    GestureDetector(
    onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>cregister()));
    },

    child:  Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),

    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset("images/counter.png",height: 80,),
    Text("counter",style: TextStyle(color: Colors.black,fontSize: 20),)
    ],
    ),
    ),
    ),


    GestureDetector(
    onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>gregister()));
    },
    child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),

    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset("images/inventory.png",height: 80,),
    Text("goddown",style: TextStyle(color: Colors.black,fontSize: 20),)
    ],
    ),
    ),
    ),
    GestureDetector(
    onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>vregister()));
    },
    child: Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white,),

    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Image.asset("images/volunteer.png",height: 80,),
    Text("volunteer",style: TextStyle(color: Colors.black,fontSize: 20),)
    ],
    ),
    ),
    ),
      ],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
    )
    )
    )
    );
  }
}