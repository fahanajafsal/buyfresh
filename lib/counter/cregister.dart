import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

import '../Login.dart';
import '../api.dart';



class cregister extends StatefulWidget {
  const cregister({Key? key}) : super(key: key);

  @override
  State<cregister> createState() => _cregisterState();
}

class _cregisterState extends State<cregister> {
  String? gender;
  bool _isLoading=false;
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  TextEditingController counternocontroller=TextEditingController();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController addresscontroller=TextEditingController();
  TextEditingController placecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController gendercontroller=TextEditingController();
  TextEditingController usernamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  void registerUser()async {
    setState(() {
      _isLoading = true;
    });

    var data = {
      "counter_number" :counternocontroller.text,
      "name": namecontroller.text.trim(),
      "address": addresscontroller.text.trim(),
      "place": placecontroller.text.trim(),
      "email": emailcontroller.text.trim(),
      "phone_number": phonecontroller.text,
      "gender": gender.toString(),
      "username": usernamecontroller.text,
      "password": passwordcontroller.text,

    };
    print("counter data${data}");
    var res = await Api().authData(data,'api/counter_register');
    var body = json.decode(res.body);
    print('body${body}');
    if(body['success']==true)
    {
     /* Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );*/

      Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));

    }
    else
    {
     /* Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );*/

    }
  }


  @override
  Widget build(BuildContext context) {
    return
      SafeArea(child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body:
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                const Text("Register",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),




                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                    // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: counternocontroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          label: Text("counter number "),
                          hintText: "Enter your counter no",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.purple)
                          ))

                  ),
                ),




                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                    // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: namecontroller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          label: Text("name "),
                          hintText: "Enter your name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.purple)
                          ))

                  ),
                ),





                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      controller: placecontroller,
                      // keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.place),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.purple)
                        ),
                        label: Text("Place"),
                        hintText: "Enter your place",

                      )

                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: addresscontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.purple)
                        ),
                        label: Text("address"),
                        hintText: "Enter your address",
                      )

                  ),
                ),
                RadioListTile(
                  activeColor: Colors.purple,
                  title: Text("Male"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  activeColor: Colors.purple,
                  title: Text("Female"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: Colors.purple,
                  title: Text("Transgender"),
                  value: "Transgender",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  activeColor: Colors.purple,
                  title: Text("Prefer not to Say"),
                  value: "Prefer not to Say",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      validator: (valueMail) {
                        if (valueMail!.isEmpty) {
                          return 'Please enter Email Id';
                        }
                        RegExp email = new RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (email.hasMatch(valueMail)) {
                          return null;
                        } else {
                          return 'Invalid Email Id';
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,

                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          label: const Text("Email"),
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.purple)
                          ))

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Mobile Number';
                        }
                        RegExp number = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                        if (number.hasMatch(value)) {
                          return null;
                        } else {
                          return 'Invalid Mobile Number';
                        }
                      },
                      keyboardType: TextInputType.number,
                      controller: phonecontroller,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone),
                          label: const Text("Phone Number"),
                          hintText: "Enter your Phone Number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.purple)
                          ))

                  ),
                ),




                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.purple)
                        ),
                        label: Text("username"),
                        hintText: "Enter your username",
                      )

                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:TextFormField(
                      validator: (valuePass) {
                        if (valuePass!.isEmpty) {
                          return 'Please enter your Password';
                        }else if(valuePass.length<6){
                          return 'Password too short';
                        } else {
                          return null;
                        }
                      },

                      obscureText: _obscureText,
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                            )),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      )
                  ),

                ),

                Card(
                  margin: EdgeInsets.all(5),
                  child:
                  TextFormField(
                      validator: (valueConPass) {
                        if (valueConPass!.isEmpty) {
                          return 'Please confirm your Password';
                        } else if (valueConPass.length<6) {
                          return 'Please check your Password';
                        }else if (valueConPass == passwordcontroller){
                          return null;
                        }
                      }, obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "ConfirmPassword",
                        hintText: "ConfirmPassword",
                        hintStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                            )),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      )
                  ),

                ),

                const SizedBox(height: 20,),
                ElevatedButton(onPressed: ()
                {
                  registerUser();
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const homescreen()));
                },
                  style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),primary: Colors.purple,fixedSize: Size(350, 57)),
                  child: const Text("Signup",style: TextStyle(
                      fontSize: 18,color: Colors.white
                  )),),

                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",style: TextStyle(fontSize: 15),),TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const login()));
                    }, child: const Text("Login",style: TextStyle(fontSize: 15,color: Colors.purple,fontWeight: FontWeight.bold),))

                  ],

                ),

              ],
            ),
          ),
        ),
      ),
      );
  }
}