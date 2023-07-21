import 'dart:convert';

import 'package:buyfresh/user/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:buyfresh/api.dart';
import 'package:buyfresh/godown/products_catagories.dart';


class categories extends StatefulWidget {

  const categories({Key? key}) : super(key: key);

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  List _loaddata=[];
  late int id;
  fetchData() async {
    var res = await Api()
        .getData('/api/category_all_view');
    if (res.statusCode == 200) {
      var items = json.decode(res.body)['data'];
      print(items);
      setState(() {
        _loaddata = items;

      });
    } else {
      setState(() {
        _loaddata = [];
        /* Fluttertoast.showToast(
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
          backgroundColor: Colors.green,
          title: Text('categories',),
        ),
        body: Stack(
            children: [
              Container(
                // height: size.height * .55,
                  decoration: BoxDecoration(
                    color: Colors.green,)
              ),
              SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: _loaddata.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0
                                  ),
                                  itemBuilder: (BuildContext context, int index) {

                                    return  GestureDetector(
                                      onTap: (){

                                        id=_loaddata[index]['id'];
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>products(id:id)));
                                      },
                                      child: Container(
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
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [

                                              Container(
                                                height: size.height*.13,
                                                width: size.width*.32,
                                                child: Image.network(Api().url+_loaddata[index]['images'],
                                                  fit: BoxFit.cover,
                                                  alignment: Alignment.topCenter,
                                                ),
                                              ),
                                              Spacer(),
                                              Text(_loaddata[index]['categoryname'],textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),




                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },


                                  // Container(
                                  //   padding: EdgeInsets.all(20),
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(15),
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //             offset: Offset(0,17),
                                  //             blurRadius: 14,
                                  //             spreadRadius: -23
                                  //         )
                                  //       ]
                                  //   ),
                                  //   child: Material(
                                  //     color: Colors.transparent,
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //
                                  //       },
                                  //       child: Column(
                                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //         children: [
                                  //           Container(
                                  //       height: size.height*.25,
                                  //         width: size.width*.30,
                                  //
                                  //
                                  //           child: Image.asset('images/grapes.jpg',
                                  //             fit: BoxFit.cover,
                                  //             alignment: Alignment.topCenter,
                                  //           ),
                                  //       ),
                                  //           Spacer(),
                                  //           Text('grapes',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  //
                                  //
                                  //
                                  //
                                  //         ],
                                  //       ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  //
                                  //
                                  // Container(
                                  //   padding: EdgeInsets.all(20),
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(15),
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //             offset: Offset(0,17),
                                  //             blurRadius: 14,
                                  //             spreadRadius: -23
                                  //         )
                                  //       ]
                                  //   ),
                                  //   child: Material(
                                  //     color: Colors.transparent,
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //
                                  //       },
                                  //       child: Column(
                                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //         children: [
                                  //       Container(
                                  //       height: size.height*.25,
                                  //         width: size.width*.30,
                                  //           child:
                                  //           Image.asset('images/stbry.jpg',
                                  //               fit: BoxFit.cover,
                                  //             alignment: Alignment.topCenter,
                                  //           ),
                                  //       ),
                                  //           Spacer(),
                                  //           Text('strawberry',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  //
                                  //
                                  //
                                  //
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Container(
                                  //   padding: EdgeInsets.all(20),
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(15),
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //             offset: Offset(0,17),
                                  //             blurRadius: 14,
                                  //             spreadRadius: -23
                                  //         )
                                  //       ]
                                  //   ),
                                  //   child: Material(
                                  //     color: Colors.transparent,
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //
                                  //       },
                                  //       child: Column(
                                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //         children: [
                                  //           Container(
                                  //
                                  //       height: size.height*.25,
                                  //         width: size.width*.30,
                                  //         child:
                                  //           Image.asset('images/mango.jpg',
                                  //               fit: BoxFit.cover,
                                  //             alignment: Alignment.topCenter,
                                  //           ),
                                  //           ),
                                  //           Spacer(),
                                  //           Text('mango',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  //
                                  //            // Text("RS:110"),
                                  //            //  Text("Quantity:10KG")
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  //
                                  //
                                  //
                                  //
                                  //  Container(
                                  //   padding: EdgeInsets.all(20),
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(15),
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //             offset: Offset(0,17),
                                  //             blurRadius: 14,
                                  //             spreadRadius: -23
                                  //         )
                                  //       ]
                                  //   ),
                                  //   child: Material(
                                  //     color: Colors.transparent,
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //
                                  //       },
                                  //       child: Column(
                                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //         children: [
                                  //       Container(
                                  //       height: size.height*.25,
                                  //         width: size.width*.30,
                                  //           child:
                                  //           Image.asset('images/mango.jpg',
                                  //               fit: BoxFit.cover,
                                  //             alignment: Alignment.topCenter,
                                  //           ),
                                  //       ),
                                  //           Spacer(),
                                  //           Text('mango',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  //
                                  //
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  //
                                  //
                                  //  Container(
                                  //   padding: EdgeInsets.all(20),
                                  //   decoration: BoxDecoration(
                                  //       color: Colors.white,
                                  //       borderRadius: BorderRadius.circular(15),
                                  //       boxShadow: [
                                  //         BoxShadow(
                                  //             offset: Offset(0,17),
                                  //             blurRadius: 14,
                                  //             spreadRadius: -23
                                  //         )
                                  //       ]
                                  //   ),
                                  //   child: Material(
                                  //     color: Colors.transparent,
                                  //     child: InkWell(
                                  //       onTap: () {
                                  //
                                  //       },
                                  //       child: Column(
                                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //         children: [
                                  //       Container(
                                  //       height: size.height*.25,
                                  //         width: size.width*.30,
                                  //           child:
                                  //           Image.asset('images/kiwi.jpg',
                                  //               fit: BoxFit.cover,
                                  //             alignment: Alignment.topCenter,
                                  //           ),
                                  //       ),
                                  //           Spacer(),
                                  //           Text('kiwi',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  //
                                  //
                                  //
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),



                                )
                            )
                          ] )
                  )
              )
            ] )));
  }
}