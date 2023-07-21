import 'dart:convert';

import 'package:buyfresh/user/detailproducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:buyfresh/api.dart';
import 'package:buyfresh/godown/detailpage.dart';


class products extends StatefulWidget {
  int id;

  products({required this.id});

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  List _loaddata=[];
  fetchData() async {
    int id=widget.id;
    var res = await Api()
        .getData('/api/category_product_view/'+id.toString());
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loaddata = items;

      });
    } else {
      setState(() {
        _loaddata = [];
        /*  Fluttertoast.showToast(
          msg:"Currently there is no data available",
          backgroundColor: Colors.grey,
        );*/
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
    var size=MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('products',),
        ),
        body: Stack(
            children: [
              Container(
                // height: size.height * .45,
                  decoration: BoxDecoration(
                    color: Colors.white,)
              ),
              SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: GridView.builder(

                                  itemCount: _loaddata.length,
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                                      crossAxisCount: 2,
                                      crossAxisSpacing: 4.0,
                                      mainAxisSpacing: 4.0
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    return  Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0,17),
                                                blurRadius: 14,
                                                spreadRadius: -23
                                            )
                                          ]
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            int id=_loaddata[index]['id'];

                                            Navigator.push(context,MaterialPageRoute(builder: (context)=>detailproducts(
                                                id:id
                                            )));

                                          },
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [

                                              Container(
                                                height: size.height*.13,
                                                width: size.width*.30,
                                                child: Image.network(Api().url+_loaddata[index]['images'],
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.topCenter,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(_loaddata[index]['productname'],textAlign: TextAlign.center,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),




                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },





                                )
                            )
                          ] )
                  )
              )
            ] )));
  }
}