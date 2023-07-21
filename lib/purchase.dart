
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
class purchase extends StatefulWidget {
  const purchase({Key? key}) : super(key: key);

  @override
  State<purchase> createState() => _purchaseState();
}

class _purchaseState extends State<purchase> {
bool _isLoading = false;

  Future AddCart(int itemid) async {
    var prefs = await SharedPreferences.getInstance();
    var user_id = (prefs.getInt('user_id') ?? 0);
    print('login_id_complaint ${user_id}');
    setState(() {
      _isLoading = true;
    });

    var data = {
      "user": user_id.toString(),
      "product": itemid.toString(),
      "quantity": "1",
    };
    print("cart data${data}");
    var res = await Api().authData(data,'/api/addtocart');
    var body = json.decode(res.body);
    print("body of cart${body}");
    if (body['success'] == true) {
      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      //   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>View_Comp()));
    } else {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

    }
  }
   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
   var productname;
   var description;
   var quantity;
   var price,image;
   var offerdetails;
   var manfacture;
   var expiry;
   bool isVisible = false;

   late int id,proid;


   Future<void> _viewPro(int id) async {

 //    print('login_idupdate ${id }');

     var res = await Api()
         .getData('/api/product_single_view/'+id.toString());
     var body = json.decode(res.body);
     print(body);
     setState(() {
       proid=body['data']['id'];
        productname = body['data']['productname'];
        description = body['data']['description'];
       quantity = body['data']['quantity'];
        price = body['data']['price'];
        offerdetails = body['data']['offerdetails'];
       manfacture = body['data']['manfacture'];
       expiry = body['data']['expiry'];
        image=body['data']['images'];

        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 400,
              color: Colors.white,
              child:Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              child: Image(image: NetworkImage(Api().url+image)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),

                              child: SingleChildScrollView(
                                physics:ScrollPhysics() ,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [


                                    Text(productname,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text("Quantity : "+quantity),
                                    SizedBox(height: 10,),
                                    Text("Rs : "+price),
                                    SizedBox(height: 10,),
                                    Text("offer :"  +offerdetails),
                                    SizedBox(height: 10,),
                                    Text("manfacture :"  +manfacture),
                                    SizedBox(height: 10,),
                                    Text("expiry :"  +expiry),
                                    SizedBox(height: 20,),

                                    Center(
                                      child: ElevatedButton(onPressed: (){
                                        AddCart(proid);


                                      },

                                        child: Text("Add to cart")

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),


                        /*  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
                  },
                )*/
                      ]
                  ),
                ),
              )


            );
          },
        );


     });
   }

   // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    var isAndroid;
    // if (Platform.isAndroid) {
    //   controller!.pauseCamera();
    // } else if (Platform.isIOS) {
    //   controller!.resumeCamera();
    // }
  }
  @override
  Widget build(BuildContext context) {
    var offerdetailsController;
    var productnameController;
    var descriptionController;
    var priceController;
    var quantityController;
    var manfactureController;
    var expiryController;
    return  Scaffold(

      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex:3,
            child: Column(
              children: [
                Center(
                  child: (result != null)

                      ? Text(
                          'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                      : Text('Scan a code'),

                ),

        Center(child: ElevatedButton(onPressed: (){
          setState(() {
           // isVisible = !isVisible;
            String? ids=result!.code;
            id=int.parse(ids!);
            print(("id is $id"));
            _viewPro(id);
          });

        }, child: Text("Scan to purchase"))),

    /* Visibility(

        visible: isVisible,
        child: Column(
          children: [
            Row(
                        children: [
                          SizedBox(width: 200,),
                          Expanded(child: Text("Product name :",style:TextStyle(fontSize: 20),)),

                          Expanded(
                            child: Text(
                                productname,

                                style: TextStyle(
                                    color: Color(0xFFF17532),

                                    fontSize: 24.0)),
                          ),
                        ],
                      ),
          ],
        ),
      ),

               SizedBox(height: 20.0),
   Expanded(child: Text("description :",style:TextStyle(fontSize: 20))),
                SizedBox(height: 20.0),
      Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    child: Text(
                        descriptionController.text==null?"": descriptionController.text  ,
                        textAlign: TextAlign.center,
                        style: TextStyle(

                            fontSize: 16.0,
                            color: Color(0xFFF17532))
                    ),
                  ),
                ),

                SizedBox(height: 20.0),

               SizedBox(width:200,),
                Expanded(child: Text("price :",style:TextStyle(fontSize: 20))),
                Expanded(
                  child: Text(
                      priceController.text==null?"": priceController.tex,
                      style: TextStyle(

                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF17532))),
                ),
                SizedBox(height: 20.0),
                SizedBox(width: 50,),
                Expanded(child: Text("Quantity :",style:TextStyle(fontSize: 20))),
                Expanded(
                  child: Text(
                      quantityController.text,
                      style: TextStyle(

                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF17532))),
                ),
                SizedBox(height: 20.0),
                Expanded(child: Text("offerdetails :",style:TextStyle(fontSize: 20))),
                Expanded(
                  child: Text(
                      offerdetailsController.text,

                      style: TextStyle(

                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF17532))),
                ),*/


              ],
            ),
          )
        ],
      ),
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}