

import 'package:buyfresh/categories.dart';
import 'package:buyfresh/user/feedback.dart';
import 'package:buyfresh/user/payment1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:buyfresh/cart.dart';
import 'package:buyfresh/cartitemsample.dart';
import 'package:buyfresh/login.dart';
import 'package:buyfresh/offers.dart';
import 'package:buyfresh/orders.dart';
import 'package:buyfresh/payment.dart';
import 'package:buyfresh/profile.dart';
import 'package:buyfresh/purchase.dart';


class homescreen extends StatefulWidget {
  const homescreen({ Key? key }) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int indexnum=0;
  final List<Widget>screen=[
    homescreen(),
    profile(),
    cart(),
  ];

  Widget currentIndex=homescreen();

  get currentTab => null;





  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body:
        SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(

                options: CarouselOptions(height: 170.0,   autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 900),),

                items: ["images/1.jpg","images/2.jpg","images/1.jpg","images/2.jpg"].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(

                        width: MediaQuery.of(context).size.width,

                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("$i"),fit: BoxFit.cover),

                        ),

                      );
                    },
                  );
                }).toList(),
              ),




              Container(
                height: 600,

                child:Padding(
                  padding:const EdgeInsets.all(20),
                  child:   GridView.count(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>purchase()));

                            },
                            child: Column(
                              children: [
                                new Image.asset('images/buy.png',
                                  height: 90,
                                  width: 120,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 6,),
                                Text('PURCHASE',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>offers()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/discount.png',
                                  height: 100,
                                  width: 100,
                                  alignment: Alignment.topCenter,fit: BoxFit.cover,
                                ),
                                Spacer(),
                                Text('OFFERS',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>orders()));

                            },
                            child: Column(
                              children: [

                                new Image.asset('images/order-now.png',
                                  height: 90,
                                  width: 120,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('MY ORDERS',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>cartitemsample()));
                            },
                            child: Column(
                              children: [

                                new Image.asset('images/cart.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('CART',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>feedback()));
                            },
                            child: Column(
                              children: [

                                new Image.asset('images/chat.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('FEEDBACK',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>categories()));
                            },
                            child: Column(
                              children: [

                                new Image.asset('images/shopping-bag.png',
                                  height: 90,
                                  width: 150,
                                  alignment: Alignment.center,
                                ),
                                SizedBox(height: 10,),
                                Text('PRODUCTS',textAlign: TextAlign.center,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),)

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
      ]
    )







    ),
    appBar: AppBar(
    title: Text(" ",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15
    ),
    ),
    toolbarHeight: 50,
    backgroundColor: Colors.lightBlueAccent
    ),
    backgroundColor: Colors.white,

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
    Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
    },
    ),
    ListTile(
      leading: Icon(
        Icons.person,
      ),
      title: const Text('Profile'),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
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

