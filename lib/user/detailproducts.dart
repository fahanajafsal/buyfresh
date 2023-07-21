


import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../api.dart';


class detailproducts extends StatefulWidget {
  final int id;

  detailproducts({required this.id});
  @override
  State<detailproducts> createState() => _detailproductsState();
}

class _detailproductsState extends State<detailproducts> {
  bool   _isLoading = false;
  late SharedPreferences localStorage;
  TextEditingController productnameController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController quantityController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController offerdetailsController=TextEditingController();
  TextEditingController manfactureController=TextEditingController();
  TextEditingController expiryController=TextEditingController();


  String productname='',description='',quantity='',price='',offerdetails='',manfacture='',expiry='',images='';

  Future<void> _viewPro() async {
    int id = widget.id;
    var res = await Api()
        .getData('/api/product_single_view/' + id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {

      productname = body['data']['productname'];
      description = body['data']['description'];
      quantity = body['data']['quantity'];
      price = body['data']['price'];
      offerdetails = body['data']['offerdetails'];
      manfacture = body['data']['manfacture'];
      expiry = body['data']['expiry'];
      images = body['data']['images'];



      productnameController.text = productname;
      descriptionController.text=description;
      quantityController.text=quantity;

      priceController.text=price;
      offerdetailsController.text=offerdetails;
      manfactureController.text=manfacture;
      expiryController.text=expiry;


    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewPro();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),

        // actions: <Widget>[
        //
        // ],
      ),

      body: ListView(
          children: [
            SizedBox(height: 25.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  productname,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            SizedBox(height: 16,),
            Container(

                child: Image.network(Api().url+images,
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),

            // SizedBox(height: 20.0),
            // Center(
            //   child: Text("Rs",style: TextStyle(
            //       fontFamily: 'Varela',
            //       fontSize: 22.0,
            //       fontWeight: FontWeight.bold,
            //       color: Color(0xFFF17532))),
            // ),
            SizedBox(height: 20.0),
            Center(
              child: Text(description,
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),

            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text( "Quantity :"+quantity,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                        color: Color(0xFFF17532))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text("₹ :"+price,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                        color: Color(0xFFF17532))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text("OFFER :"+offerdetails,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 16.0,
                        color: Color(0xFFF17532))
                ),
              ),
            ),
      SizedBox(height: 20.0),
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 50.0,
          child: Text("manfacture :"+manfacture,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 16.0,
                  color: Color(0xFFF17532))
          ),
        ),
      ),
      SizedBox(height: 20.0),
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 50.0,
          child: Text("expiry :"+expiry,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 16.0,
                color: Color(0xFFF17532),)
          ),
        ),
      ),
           ]
      )
      );




  }
}









