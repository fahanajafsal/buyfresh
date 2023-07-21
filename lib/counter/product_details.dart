import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';

class product_details extends StatefulWidget {
  var id;

  product_details({ required this.id});


  @override
  State<product_details> createState() => _product_detailsState();
}

class _product_detailsState extends State<product_details> {
//
// List name=['Apple','Rice','mango','sugar','orange','onion','tomato','chocolate','shampoo','sugar','orange','onion','tomato','chocolate','shampoo'];
// List quantity=['kg','kg','kg','kg','kg','kg','kg','kg','kg','kg','kg','kg','kg','kg'];
// List totalprice=["110","80","510","200","600",'220','110','400','170',"200","600",'220','110','400','170'];


  List order = [];

  bool isLoading = false;
  late SharedPreferences localStorage;

  String price='';
  bool _isLoading=false;



  _fetchOrder() async {
    late int id = widget.id;
    // int? userid;
    // late int userid;
    localStorage = await SharedPreferences.getInstance();
    // user_id = (localStorage.getInt('user_id') ?? 0);
    // print("id${user_id}");
    var res = await Api()
        .getData('/api/singleorder/'+id.toString());
    if (res.statusCode == 200) {
      var body = json.decode(res.body);

      var items = json.decode(res.body)['data'];
      print("order Items${items}");
      setState(() {
        order = items;
      });
    } else {
      order = [];
      Fluttertoast.showToast(
        msg:"Currently there is no data available",
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    _fetchOrder();
  }
  @override



  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
        title:Text(' product_details'),

          toolbarHeight: 40,
        backgroundColor: Colors.pink,
        
      ),


body: 
        Column(
          children: [
            Expanded(
              child: ListView.builder(

                  shrinkWrap: true,
                  itemCount:order.length,
                  itemBuilder: (BuildContext context, int index){
                    int orderid=order[index]['id'];

                    return Card(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                    children: [

                    CircleAvatar(
                      backgroundColor: Colors.white,

                      radius: 50,

                    child: Image(image: NetworkImage(Api().url+ order[index]['images'])),

                    ),
                    SizedBox(width: 30,),

                          Column(
                            children: [
                              Text(order[index]['productname'].toString()),
                              SizedBox(height: 8,),

                              Text("Quantity : "+order[index]['quantity'].toString()),
                              SizedBox(height: 8,),
                              Text("Rs : "+order[index]['total_price'].toString()),



                            ],
                          ),




                    ],
                    ),
                    ]

                    ),



                    );


                  }
              ),



            ),
          ]

        )
    );
  }
}

 


    
  
