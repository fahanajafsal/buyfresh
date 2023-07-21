import 'dart:convert';

import 'package:buyfresh/godown/vieworder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:buyfresh/counter/product_details.dart';

import '../../api.dart';

class vorder extends StatefulWidget {
  //

  // gorder({required this.id});

  @override
  State<vorder> createState() => _vorderState();
}

class _vorderState extends State<vorder> {

  List _loaddata = [];
  late int id;
  fetchData() async {
    var res = await Api().getData('/api/select_view');
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];

      print("v items${items}");
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
        backgroundColor: Colors.green,
        title: Text(
          'Orders',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(children: [
                                Text("name : " +
                                    _loaddata[index]['name'].toString()),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Total Amount : " +
                                    _loaddata[index]['total_price'].toString()),
                                SizedBox(
                                  height: 5,
                                ),
                              ]),
                              SizedBox(
                                width: 60,
                              ),
                              Column(children: [
                                ElevatedButton(
                                  onPressed: () {
                                    id = _loaddata[index]['user_id'];

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => vieworder(
                                                  id: id,
                                                )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      fixedSize: Size(90, 35)),
                                  child: const Text("products",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ),
                              ])
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
