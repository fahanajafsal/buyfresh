import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class orders extends StatefulWidget {
  const orders({Key? key}) : super(key: key);

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {

  List order = [];
  late SharedPreferences prefs;
  bool isLoading = false;







  _fetchOrder() async {

    prefs = await SharedPreferences.getInstance();
    int? userid = prefs.getInt('user_id');
    print(userid);

    var res = await Api()
        .getData('/api/singleorder/'+userid.toString());
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
    /*prefs = await SharedPreferences.getInstance();
    int? userid = prefs.getInt('user_id');
    print(userid);
    // print('c_id ${Category}');
    var res = await Api().getData('api/order_all_view/');
    print(json.decode(res.body));
    print('success');

    // late int id = widget.id;



    if (res.statusCode == 200) {
      var body = json.decode(res.body);

      var items = json.decode(res.body)['data'];
      print("order Items${items}");
      setState(() {
        print('hello');
        order = items;


      });
    } else {
      order = [];
      Fluttertoast.showToast(
        msg:"Currently there is no data available",
        backgroundColor: Colors.grey,
      );
    }*/
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
        backgroundColor: Colors.greenAccent,

        title: Text("My orders"),
      ),
      body:

        Padding(
          padding: const EdgeInsets.all(20.0),
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
                            radius: 45,

                            child: Image(image: NetworkImage(Api().url+ order[index]['images'])),
                          ),
                       SizedBox(width: 20,),
                        Column(
                          children: [

                            Text(order[index]['productname'].toString(),),
                            SizedBox(height: 8,),

                            Text("delivered on "+order[index]['order_dt'].toString(),style: TextStyle(fontSize: 11)),
                            SizedBox(height: 8,),

                          ],
                            ),


                          ],
                        ),




                        ],
                    ),

                  );

              }
            ),
        )
    );
  }
}