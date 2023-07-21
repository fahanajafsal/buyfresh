import 'package:buyfresh/Login.dart';
import 'package:buyfresh/godown/gorder.dart';
import 'package:flutter/material.dart';
import 'package:buyfresh/godown/vieworder.dart';
import 'package:buyfresh/godown/viewproduct.dart';


class goddownhome extends StatefulWidget {
  const goddownhome({Key? key}) : super(key: key);

  @override
  State<goddownhome> createState() => _goddownhomeState();
}

class _goddownhomeState extends State<goddownhome> {
  late int id;

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>viewProduct()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/shopping-bag.png',
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.topCenter,fit: BoxFit.cover,
                                ),
                                Spacer(),
                                Text('VIEW PRODUCTS',textAlign: TextAlign.center,style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>gorder()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/order-now.png',
                                  height: 90,
                                  width: 120,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('VIEW ORDER',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
          title: Text(" FRESH GROCERIES HERE!!",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15
          ),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.greenAccent
      ),
      backgroundColor: Colors.greenAccent,

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("FAHANA"),
              accountEmail: Text("Fahana@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Text(
                  "F",
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>goddownhome()));
              },
            ),

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








