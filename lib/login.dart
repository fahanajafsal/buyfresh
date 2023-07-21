


import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:buyfresh/Fpassword.dart';
import 'package:buyfresh/counter/valunteer/valunteerhome.dart';
import 'package:buyfresh/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'choose.dart';
import 'counter/counterhome.dart';
import 'godown/goddownhome.dart';
import 'register.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
String user="user";
String counter="counter";
String goddown="goddown";
String volunteer="valunteer";
String role="";
String status="";
String ststatus="1";
bool   _isLoading = false;
late SharedPreferences localStorage;
TextEditingController userController=TextEditingController();
TextEditingController pwdController=TextEditingController();
_pressLoginButton() async {
  setState(() {
    _isLoading = true;
  });
  var data = {
    'username': userController.text.trim(), //username for email
    'password': pwdController.text.trim()
  };
  var res = await Api().authData(data,'/api/user_login');
  var body = json.decode(res.body);

  if (body['success'] == true) {
    print(body);

    role = body['data']['role'];
    status =  body['data']['l_status'];
    print("status${status}");
    print("st${ststatus}");
    print("role${role}");
    print("counter${counter}");
    print("valunteer${volunteer}");
    print("goddown${goddown}");

    localStorage = await SharedPreferences.getInstance();
    localStorage.setString('role', role.toString());
    localStorage.setInt('login_id', body['data']['login_id']);
    localStorage.setInt('user_id', body['data']['user_id']);

    print('login_id ${body['data']['login_id']}');
    print('user_id ${body['data']['user_id']}');


    if (user == role ) {
      var user_id;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => homescreen()));
    } else if (counter == role &&
        ststatus == status){
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => counterhome(),
    ));
    }
    else if (goddown == role &&
        status == "1"){
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => goddownhome(),
    ));
    }
    else if (volunteer == role &&
        status == "1")  {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => valunteerhome(),
    ));
    }else {
    /*  Fluttertoast.showToast(
        msg: "Please wait for admin approval",
        backgroundColor: Colors.grey,
      );*/
    }


  } else {
   /* Fluttertoast.showToast(
      msg: body['message'].toString(),
      backgroundColor: Colors.grey,
    );*/
  }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

         body:SingleChildScrollView(
           child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              SizedBox(height: 60,),
              Text("LOGIN",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold),

              ),
             SizedBox(height: 20.0,),
             Align(alignment: Alignment.center,
             child: Text('welcome back!',style: TextStyle(color:Colors.black,fontSize: 17),textAlign: TextAlign.center,),

             ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: userController,

                  decoration: InputDecoration(
                    prefixIcon:Icon(Icons.person),
                   labelText: "username",
                   hintText: "username",
                   border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

                  ),


                ),
              ),SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: pwdController,
                obscureText: true,
                decoration: InputDecoration(

                  prefixIcon: Icon(Icons.lock),
                  labelText: "password",
                  hintText: "password",
                  suffixIcon: Icon(Icons.remove_red_eye),


                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                ),

              ),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: (){
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => Fpassword()));
            },
             child: Text("forget password?",style: TextStyle(fontSize: 14),)),
           ElevatedButton(
             child: Text("Login",style: TextStyle(color: Colors.white),),

            onPressed: (){
              _pressLoginButton();

            },
           style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),primary: Colors.blue,fixedSize: Size(300, 50)),

           ),
           SizedBox(height: 30.0,),
           Row(
            children: [
              const Text('Does not have an account?',style:TextStyle(fontSize: 12),),
              SizedBox(width: 10,),
TextButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>choose(),));
},
 child: const Text('Register Here',style: TextStyle(fontSize: 12),),
 ),

            ],
            mainAxisAlignment: MainAxisAlignment.center,
           ),

            ],

           ),
         )

      ),
    );
  }
}
