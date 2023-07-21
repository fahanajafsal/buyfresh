import 'dart:convert';


import 'package:buyfresh/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class Payment extends StatefulWidget {
  final String price;


  Payment({required this.price});

  @override
  State<Payment> createState() => _PaymentState();
}
enum Gender { credit_card,debit_card,net_banking, cashon_delivery,}
enum Delivery{wait,home_delivery }
Delivery? _delivery;
String? delivery;
Gender? _payment = Gender.credit_card;
String? payment;

String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class _PaymentState extends State<Payment> {
  bool isContainerVisible = false;



  void toggleContainerVisibility() {
    setState(() {
      isContainerVisible = !isContainerVisible;
    });
  }

  DateTime? _selectDate;
  late SharedPreferences prefs;
  bool isLoading = false;
  late int user_id, order_id;
  late String amount;
  late String delivery_mode ;

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("your payment is done successfully",style: TextStyle(fontSize: 7),),

           // content: Image.asset("/images/tick.png",height: 50,width: 50,),
            actions: [
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => homescreen()));
              }, child: Text("OK"))
            ],
          );
        });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount=widget.price;
    print(amount);
  }


  Future Payment() async {
    amount=widget.price;

    print(amount);
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0);
    print('login_id_complaint ${user_id}');
    setState(() {
      isLoading = true;
    });

    var data = {
      "user_id": user_id.toString(),
      "amount": amount,
       "date":formattedDate,
      "mode": _delivery == Delivery.wait ? 'Wait' : 'Home Delivery',
    };
    print(data);
    var res = await Api().authData(data,'/api/payment');
    var body = json.decode(res.body);
    print(body);
    if (body['success'] == true) {

      _showDialog(context);

      print(body);
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
    else{
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController datecontroller=TextEditingController();


    return  Scaffold( appBar: AppBar(
        title: Text("Payments"),
        leading:IconButton(
          icon:Icon(Icons.arrow_back), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
        },
        ),
      ),
        body: SingleChildScrollView(
      child: Container(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10),
                child: Align(
                    alignment: Alignment.centerLeft, child: Text("Choose your delivery mode !!")),
              ),
              ListTile(
                title: const Text('wait'),
                leading: Radio<Delivery>(
                  value: Delivery.wait,
                  groupValue: _delivery,
                  onChanged: (Delivery? value) {
                    setState(() {
                      _delivery = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('home delivery'),
                leading: Radio<Delivery>(
                  value: Delivery.home_delivery,

                  groupValue: _delivery,
                  onChanged: (Delivery? value) {
                    setState(() {
                      _delivery = value;
                    });
                  },
                ),
              ),


              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Align(
                          alignment: Alignment.centerLeft, child: Text("Suggested for you")),
                    ),
                    ListTile(
                      title: const Text('Credit_card'),
                      leading: Radio<Gender>(
                        value: Gender.credit_card,
                        groupValue: _payment,
                        onChanged: (Gender? value) {
                          setState(() {
                            _payment = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Debit_card'),
                      leading: Radio<Gender>(
                        value: Gender.debit_card,
                        groupValue: _payment,
                        onChanged: (Gender? value) {
                          setState(() {
                            _payment = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Net banking'),
                      leading: Radio<Gender>(
                        value: Gender.net_banking,
                        groupValue: _payment,
                        onChanged: (Gender? value) {
                          setState(() {
                            _payment = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Cash on delivery'),
                      leading: Radio<Gender>(
                        value: Gender.cashon_delivery,
                        groupValue: _payment,
                        onChanged: (Gender? value) {
                          setState(() {
                            _payment = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText:amount ,
                        hintText:amount ,
                        hintStyle: TextStyle(
                            color: Colors.green
                        ),
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),

                    SizedBox(height: 30),
                    SizedBox(height: 30,
                      width: 180,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // padding: EdgeInsets.all(20)
                          ),
                          onPressed: (){
                            Payment();
                          } ,
                          child: Text("CONTINUE")),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),

            ],
          ),),
      ),
    );
  }
}
