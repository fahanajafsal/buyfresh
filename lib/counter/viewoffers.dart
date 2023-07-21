import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:buyfresh/payment.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api.dart';

class viewoffers extends StatefulWidget {
  const viewoffers({Key? key}) : super(key: key);

  @override
  State<viewoffers> createState() => _viewoffersState();
}

class _viewoffersState extends State<viewoffers> {

  List _loaddata = [];
  late int id;

  _fetchData() async {
    var res = await Api()
        .getData('/api/offer_view');
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loaddata = items;
      });
    } else {
      setState(() {
        _loaddata = [];
        Fluttertoast.showToast(
          msg: "Currently there is no data available",
          backgroundColor: Colors.grey,
        );
      }
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          title: Text(" OFFERS HERE!!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15
          ),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.orange
      ),
      backgroundColor: Colors.white,

      body: ListView.builder(

          itemCount: _loaddata.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            int id = _loaddata[index]['id'];
            return Card(
              child: ListTile(
                leading :Image.network(
                  Api().url + _loaddata[index]['images'],
                  width: 70, fit: BoxFit.fill,),
                title:  Column(
                    children:[ Text(_loaddata[index]['productname'],
                      style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Text(_loaddata[index]['quantity'],
                        style: TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),

                      Text(
                        "Rs : " + _loaddata[index]['price'],
                        style: TextStyle(fontSize: 13),
                      ),

                    ]  ),

                trailing:  Text("OFFER: " +
                    _loaddata[index]['offerdetails'],
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 11,
                      color: Colors.red),),

              ),
            );



          }
      ),

    );
  }
}