import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:buyfresh/success.dart';

class payment1 extends StatefulWidget {
  const payment1({Key? key}) : super(key: key);

  @override
  State<payment1> createState() => _payment1State();
}

class _payment1State extends State<payment1> {
  TextEditingController amountController=TextEditingController();
  TextEditingController cardnumController=TextEditingController();
  TextEditingController expiryController=TextEditingController();
  TextEditingController cvvController=TextEditingController();


  String value="";
  String i="";
  final List paymentLabels=[
    'Credi card/ Debit card',
    'cash on delivery',
    'Google pay',
  ];
  final List paymentIcons=[
    Icons.credit_card,
    Icons.money_off,
    Icons.account_balance_wallet,

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('payment'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(8),
              child:Text(
                  'choose your payment method',

                  style:TextStyle(fontSize: 28.0)
              ),
            ),

            Card(
              color: Colors.pink,
              child: Column(
                children: [
                  RadioListTile(
                      title: Text(
                        'Credit Card',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      value: 'credit',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: Text(
                        'Debit Card',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      value: 'debit',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: Text(
                        'UPI',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      value: 'upi',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: Text(
                        'Net Banking',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      value: 'netBanking',
                      groupValue: payment,
                      onChanged: (value) {
                        setState(() {
                          payment = value.toString();
                        });
                      }),
                ],
              ),
            ),


            Column(

              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Amount',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                        )
                    ),
                  ),
                ),
              ],
            ),



            SizedBox(height: 20,),

            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>success()));

                },
                child: Text('pay',style: TextStyle(fontSize: 18),),
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),fixedSize: Size(180, 53)),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),

    );


  }
  String ? payment;

}