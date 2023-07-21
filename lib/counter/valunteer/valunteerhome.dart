import 'package:buyfresh/Login.dart';
import 'package:buyfresh/counter/valunteer/payment_status.dart';
import 'package:buyfresh/counter/valunteer/statusupdation.dart';
import 'package:buyfresh/counter/valunteer/vorder.dart';
import 'package:buyfresh/godown/vieworder.dart';
import 'package:flutter/material.dart';

import '../payment_details.dart';


class valunteerhome extends StatefulWidget {
  const valunteerhome({Key? key}) : super(key: key);

  @override
  State<valunteerhome> createState() => _valunteerhomeState();
}
class _valunteerhomeState extends State<valunteerhome> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:Padding(
            padding:const EdgeInsets.all(20),
            child:
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey[300],
                    ),

                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>vorder()));

                            },
                            child: Column(
                              children: [
                                new Image.asset('images/order-now.png',
                                  height: 90,
                                  width: 130,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 6,),
                                Text('VIEW ORDER',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),


                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>statusupdation()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/delivered.png',
                                  height: 100,
                                  width: 130,
                                  alignment: Alignment.topCenter,fit: BoxFit.cover,
                                ),
                                Spacer(),
                                Text('STATUS_UPDATION',textAlign: TextAlign.center,style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),



                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0,17),
                                  blurRadius: 17,
                                  spreadRadius: -23
                              )
                            ]
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>payment_details()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/cash-payment.png',
                                  height: 90,
                                  width: 120,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('PAYMENT_DETAILS',textAlign: TextAlign.center,style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          )







      ),
      appBar: AppBar(
          title: Text(" FAST DELIVERY HERE!!!!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15
          ),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.green
      ),
      backgroundColor: Colors.green,

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("FAHANA"),
              accountEmail: Text("Fahana@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "L",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>valunteerhome()));
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.person,
            //   ),
            //   title: const Text('Profile'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>agencyprofile1()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.task,
            //   ),
            //   title: const Text('Complaint'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Complaint_Details()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(
            //     Icons.feedback,
            //   ),
            //   title: const Text('Feedback'),
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingBarScreen()));
            //   },
            // ),
            ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              },
            ),
          ],
        ),
      ),


    );
  }
}








