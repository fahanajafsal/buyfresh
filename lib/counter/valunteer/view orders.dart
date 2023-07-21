import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api.dart';



class vieworders extends StatefulWidget {
  var id;

  vieworders({ required this.id});

  //vieworder({Key? key, required int userid}) : super(key: key);

  @override
  State<vieworders> createState() => _viewordersState();
}

class _viewordersState extends State<vieworders> {

  List order = [];
  bool isLoading = false;
  late SharedPreferences localStorage;

  String price='';
  bool _isLoading=false;



  _fetchOrder() async {
    late int id = widget.id;
    localStorage = await SharedPreferences.getInstance();
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
          toolbarHeight: 40,
          backgroundColor: Colors.green.shade200,

          title: Text("products"),
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
                      // final firstWord = order[index]['productname'];
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