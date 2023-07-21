import 'dart:convert';

import 'package:buyfresh/godown/vieworder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:buyfresh/counter/product_details.dart';

import '../api.dart';
import 'products_catagories.dart';

class gorder extends StatefulWidget {

 //

 // gorder({required this.id});

  @override
  State<gorder> createState() => _gorderState();
}

class _gorderState extends State<gorder> {


  List _loaddata=[];
  late int id;
  fetchData() async {

    var res = await Api()
        .getData('/api/order_alls_view');
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];

      print(items);
      setState(() {
        _loaddata = items;


      });

    } else {
      setState(() {
        _loaddata = [];

      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Orders',),
      ),

      body:
      Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _loaddata.length,


                  itemBuilder: (context,int index) {

                    return Card(

                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [


                                  Column(
                                      children: [

                                        Text("Name : "+_loaddata[index]['name'].toString()),
                                        SizedBox(height: 5,),
                                        Text("Total Amount : "+_loaddata[index]['total_price'].toString()),

                                        SizedBox(height: 5,),


                                      ]
                                  ),

                                  SizedBox(width: 60,),
                                  Column(
                                      children:[

                                        ElevatedButton(onPressed: ()
                                        {
                                          id=_loaddata[index]['user_id'];


                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>vieworder(  id: id,)));

                                        },
                                          style: ElevatedButton.styleFrom(primary: Colors.greenAccent,fixedSize: Size(90, 35)),
                                          child: const Text("products",style: TextStyle(
                                              fontSize: 12,color: Colors.white
                                          )),),






                                      ]
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                    );
                  }
              ),






            ),


          ]

      ),


    );





  }



}
