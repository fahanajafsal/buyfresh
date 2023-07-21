import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../homescreen.dart';

class feedback3 extends StatefulWidget {
  const feedback3({Key? key}) : super(key: key);

  @override
  State<feedback3> createState() => _feedback3State();
}

class _feedback3State extends State<feedback3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/tick.png",
                height: 400,
                width: 100,
                alignment: Alignment.center,),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Your feedback was done successfully",
                  textAlign: TextAlign.center, selectionColor: Colors.blue,),
              ),


              ElevatedButton(onPressed: () {

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homescreen()));
              },
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                    primary: Colors.blue,
                    fixedSize: Size(200, 50)),
                child: Text("OK", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}