import 'package:flutter/material.dart';

import 'package:buyfresh/login.dart';
import 'package:buyfresh/register.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HELLO THERE !",style: TextStyle(fontSize:30),),
              SizedBox(height: 20,),
              Align(alignment: Alignment.center,),
              SizedBox(height: 35,),
              Image.asset("images/welcome.jpg" ,width: 600, height:350,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),primary: Colors.blueAccent,fixedSize: Size(350, 57)),
              child: Text("Login",style: TextStyle(fontSize: 18,color: Colors.white),)),
              SizedBox(height: 35,),
              ElevatedButton(onPressed: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>()));
              },
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),primary: Colors.blueAccent,fixedSize: Size(350, 57)),
                  child: Text("Sign Up",style: TextStyle(fontSize: 18,color: Colors.white),)),

            ],
          ),
        ),
          
        );

  }
}