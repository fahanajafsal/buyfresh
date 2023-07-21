import 'package:buyfresh/counter/payment_details.dart';
import 'package:buyfresh/user/payment1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:buyfresh/payment.dart';
import 'package:buyfresh/user/wait.dart';

class order_status extends StatefulWidget {
  const order_status({Key? key}) : super(key: key);

  @override
  State<order_status> createState() => _order_statusState();
}

class _order_statusState extends State<order_status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('order_status'),
        toolbarHeight: 50,
        backgroundColor: Colors.redAccent,
      ),


     body: SingleChildScrollView(
       child: Column(
        children: [
          Padding(padding: EdgeInsets.all(8),
          child:Text(
            'choose your delivery option ! ',
     
          style:TextStyle(fontSize: 28.0)
          ),
          ),
          SizedBox(height: 20,),
     
          Card(
       color: Colors.white,
       child: Column(
         children: [
        RadioListTile(
            title: Text(
              'wait',
              style: TextStyle(color: Colors.redAccent, fontSize: 20),
            ),
            value: 'wait',
            groupValue: order_status,
            onChanged: (value) {
              setState(() {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>wait()));
                order_status = value.toString();
              });
            }),
        RadioListTile(
            title: Text(
              'Home delivery',
              style: TextStyle(color: Colors.redAccent, fontSize: 20),
            ),
            value: 'home',
            groupValue: order_status,
            onChanged: (value) {
              setState(() {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>payment1()));
                order_status = value.toString();
              });
            }),
        
        
            
         ],
       ),
     ),
     




        ]
    ),
     )
    );
  }

  String ? order_status;
}