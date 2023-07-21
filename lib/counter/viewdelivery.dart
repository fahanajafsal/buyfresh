import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:buyfresh/order_status.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../api.dart';

class viewdelivery extends StatefulWidget {
  const viewdelivery({Key? key}) : super(key: key);

  @override
  State<viewdelivery> createState() => _viewdeliveryState();
}

class _viewdeliveryState extends State<viewdelivery> {

  List _loaddata = [];
  late String Statusdata = "not delivered";
  late String orderstts = "";

  int id = 6;
  fetchData() async {
  var res = await Api().getData('/api/order_all_view');
  if (res.statusCode == 200) {
  var items = json.decode(res.body)['data'];

  print('itemsvfetchata$items');
  setState(() {
  _loaddata = items;
  });
  }

  else {
  setState(() {
  _loaddata = [];

  });
  }
  }

  _approveData(int id, String orderstts) async {
  print("items${id}");
  var res = await Api().postData('/api/order_status/' + id.toString());



  print("resssssss${json.decode(res.body)}");


  if (res.statusCode == 200) {
    Fluttertoast.showToast(
  msg: "product is delivered",
  );

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
  backgroundColor: Colors.green,
  title: Text(
  'Orders',style: TextStyle(fontSize: 15),
  ),
  ),
  body: Column(children: [
  Expanded(
  child: ListView.builder(
  itemCount: _loaddata.length,

  // itemCount: name.length,
  itemBuilder: (context, int index) {
  return Card(
  color: Colors.white,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
  children: [
  Padding(
  padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns the Column's children to the left
          children: [

  Text("Name : " +
  _loaddata[index]['name'].toString()),
            SizedBox(height: 5),
            Text("Price: " + _loaddata[index]['total_price'].toString()),
            SizedBox(height: 5),
            Text("Product: " + _loaddata[index]['productname'].toString()),
            SizedBox(height: 5),
            Text("Date: " + _loaddata[index]['order_dt']),

  Column(
          children: [
  ElevatedButton(
  onPressed: () async{
  await _approveData(
  _loaddata[index]['id'], orderstts);
  print('completed');
  fetchData();
  setState(() {

  });


  },
  style: ElevatedButton.styleFrom(
  primary: Colors.white,
  ),
  child: _loaddata[index]['order_status'] == "0"
  ? Text("Not delivered",
  style: TextStyle(
  fontSize: 10, color: Colors.red))
          : Text("Delivered",
  style: TextStyle(
  fontSize: 10,
  color: Colors.green)),
  ),
  ])
  ],
  ),
      ],
    ),
  ),
  ],
  ));
  }),
  ),
  ]),
  );
  }
  }

