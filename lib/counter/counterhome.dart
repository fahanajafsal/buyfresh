

import 'package:flutter/material.dart';

import 'package:buyfresh/counter/payment_details.dart';
import 'package:buyfresh/counter/salesreport.dart';
import 'package:buyfresh/counter/valunteer/payment_status.dart';
import 'package:buyfresh/counter/viewdelivery.dart';
import 'package:buyfresh/counter/viewoffers.dart';
import 'package:buyfresh/godown/vieworder.dart';

import '../Login.dart';

class counterhome extends StatefulWidget {
  const counterhome({Key? key}) : super(key: key);

  @override
  State<counterhome> createState() => _counterhomescreenState();
}

class _counterhomescreenState extends State<counterhome> {
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewdelivery()));

                            },
                            child: Column(
                              children: [
                                new Image.asset('images/order-now.png',
                                  height: 90,
                                  width: 120,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 6,),
                                Text('View Delivery',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewoffers()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/discount.png',
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.topCenter,fit: BoxFit.cover,
                                ),
                                Spacer(),
                                Text('View offers',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
                                Text('View payment',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>salesreport()));
                            },
                            child: Column(
                              children: [

                                new Image.asset('images/seo-report.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('sales Report',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
          title: Text(" ITS TIME TO DELIVERY!!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15
          ),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.orange
      ),
      backgroundColor: Colors.orangeAccent,

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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>counterhome()));
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








