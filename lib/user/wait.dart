
  import 'package:buyfresh/counter/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:buyfresh/payment.dart';


class wait extends StatelessWidget {
  const wait({Key? key}) : super(key: key);

  @override  
  Widget build(BuildContext context) {  
    return Center(  
      child: Container(  
        width: 300,  
        height: 200,  
        padding: new EdgeInsets.all(10.0),  
        child: Card(  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(15.0),  
          ),  
          color: Colors.red,  
          elevation: 10,  
          child: Column(  
            mainAxisSize: MainAxisSize.min,  
            children: <Widget>[  
              const ListTile(  
              
                title: Text(  
                  'wait 15 minuts',  
                  style: TextStyle(fontSize: 20)  
                ),  
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(  
                
                child:  Text('OK'),  
                onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>payment_details()));
                },  
              ),  
            ],  
          ),  
        ),  
      )  
    );  
  }  
}