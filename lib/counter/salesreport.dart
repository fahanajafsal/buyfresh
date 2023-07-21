import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:buyfresh/counter/product_details.dart';

import '../api.dart';

class salesreport extends StatefulWidget {
  const salesreport({Key? key}) : super(key: key);

  @override
  State<salesreport> createState() => _salesreportState();
}

class _salesreportState extends State<salesreport> {
// List name=['aparna ','saleem','midhun','arjun P','afeefa','fahana ','farsana'];
// List date=["5-7-2022","6-7-2023","5-3-2022","6-7-2022","7-7-2023","7-9-2023","5-4-2023"];
// List totalprice=["2000","3500","1100","2200","4005","600","4000","3000"];
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
          backgroundColor: Colors.pinkAccent,
          title: Text('sales Report',),
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
                                  Text("date : "+_loaddata[index]['order_dt'].toString()),

                                  SizedBox(height: 5,),
                                  Text("Total Amount : "+_loaddata[index]['total_price'].toString()),

                                  SizedBox(height: 5,),
                                
                                ]
                              ),
                          
                              SizedBox(width: 30,),
                               Column( 
                               children:[

                                 ElevatedButton(onPressed: ()
                                 {
                                   id=_loaddata[index]['user_id'];


                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>product_details(  id: id,)));

                                 },

                               
                                child: Text("Product Details",style: TextStyle(fontSize: 10,) 
                                 
                                ),
                         
                                )
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
 //                   Container(
 //                    padding: EdgeInsets.only(left: 10) ,
 //   width: 500,
 //    height: 50,
 //       color: Colors.white,
 //     child: Text("Total Amount :\n6000", style: TextStyle(fontSize: 15)),
 //
 // ) ,
      
          ]                  
                        
        ),

    
            );
          
        
          
                    
              
                  }
         

    
  }
