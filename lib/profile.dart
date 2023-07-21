// import 'package:flutter/material.dart';
// import 'package:hello_world/login.dart';
// import 'package:hello_world/welcome.dart';
//
//
// class profile extends StatefulWidget {
//   const profile({Key? key}) : super(key: key);
//
//   @override
//   State<profile> createState() => _profileState();
// }
//
// class _profileState extends State<profile> {
//
//   bool isObscurePassword=true;
//
//   int currentTab = 2;
//   final List<Widget> screen =[
//
//     profile(),
//
//   ];
//
//   Widget currentScreen = profile();
//
//   TextEditingController unameController=TextEditingController();
//   TextEditingController plcController=TextEditingController();
//   TextEditingController emailController=TextEditingController();
//   TextEditingController pwdController=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//
//       appBar: AppBar(
//         title: Text("Profile"),
//         actions: [
//           IconButton(
//             tooltip: "Logout",
//             onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>welcome()));
//             },
//             icon: Icon(
//               Icons.logout,
//             ),
//           )
//         ],
//       ),
//
//       body: Container(
//         padding: EdgeInsets.only(left: 15, top: 20, right: 15),
//         child: GestureDetector(
//           onTap: () {
//             FocusScope.of(context).unfocus();
//           },
//           child: ListView(
//             children: [
//               Center(
//                 child: Stack(
//                   children: [
//                     Container(
//                       width: 130,
//                       height: 130,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 4, color: Colors.white),
//                           boxShadow: [
//                             BoxShadow(
//                                 spreadRadius: 2,
//                                 blurRadius: 10,
//                                 color: Colors.black.withOpacity(0.1)
//                             )
//                           ],
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(
//                                 'images/user1.png'
//                             ),
//                           )
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                   width: 4,
//                                   color: Colors.white
//                               ),
//                               color: Colors.blue
//                           ),
//                           child: Icon(
//                             Icons.edit,
//                             color: Colors.white,
//                           )
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//               SizedBox(height: 30,),
//
//               buildTextField("Full name", "Artist PS", false),
//               buildTextField("Email", "Artistps@gmail.com", false),
//               buildTextField("Password", "9898934", true),
//               buildTextField("address", "CA", false),
//               buildTextField("Place", "Calicut", false),
//               buildTextField("phonenumber", "9876545673", false),
//
//
//               SizedBox(height: 30,),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   OutlinedButton(
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
//                     },
//                     child: Text("CANCEL",style: TextStyle(
//                         fontSize: 15,
//                         letterSpacing: 2,
//                         color: Colors.black
//                     )),
//                     style: OutlinedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 50),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                     ),
//                   ),
//
//                   ElevatedButton(
//                     onPressed: (){},
//                     child: Text("SUBMIT",style: TextStyle(fontSize: 15, letterSpacing: 2, color: Colors.white),),
//                     style: ElevatedButton.styleFrom(
//                         primary: Colors.blue,
//                         padding: EdgeInsets.symmetric(horizontal: 50),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
//
//   Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
//     return Padding(
//       padding: EdgeInsets.only(bottom: 30),
//       child: TextFormField(
//         obscureText: isPasswordTextField ? isObscurePassword: false,
//         decoration: InputDecoration(
//             suffixIcon: isPasswordTextField ?
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isObscurePassword=!isObscurePassword;
//                 });
//               },
//               icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
//             ):null,
//             contentPadding: EdgeInsets.only(bottom: 5),
//             labelText: labelText,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: placeholder,
//             hintStyle: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey
//             )
//
//         ),
//       ),
//     );
//   }
//
// }

import 'dart:convert';
import 'dart:io';


// import 'package:helloworld/artist/Ahome.dart';
// import 'package:helloworld/customer/home.dart';
// import 'package:helloworld/login.dart';
import 'package:buyfresh/homescreen.dart';
import 'package:buyfresh/login.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  bool isObscurePassword=true;
  late int user_id;
  String name='';
  String place='';
  String phone_number='';

  late SharedPreferences prefs;
  TextEditingController nameController=TextEditingController();

  TextEditingController placeController=TextEditingController();
  TextEditingController phnController=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewPro();
  }

  int currentTab = 2;


  Future<void> _viewPro() async {
    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0 );
    print('login_idupdate ${user_id }');
    var res = await Api()
        .getData('/api/singleuserprofile_view/'+user_id.toString());
    var body = json.decode(res.body);
    print(body);
    setState(() {
      name = body['data']['name'];
      place = body['data']['place'];
      phone_number = body['data']['phone_number'];


      nameController.text = name;
      placeController.text=place;
      phnController.text=phone_number;

    });
  }


  Future<void> _update(String name,String place,String contact) async {

    prefs = await SharedPreferences.getInstance();
    user_id = (prefs.getInt('user_id') ?? 0 );
    print(user_id);
    var uri = Uri.parse(Api().url+'/api/userprofile_update_view/'+user_id.toString()); // Replace with your API endpoint

    var request = http.MultipartRequest('PUT', uri);
    request.fields['name'] = name;
    request.fields['place'] = place;
    request.fields['phone_number'] = contact;

    print(request.fields);


    final response = await request.send();
    print(response);

    if (response.statusCode == 200) {
      print('Profile Updated successfully');
      Navigator.push(
          this.context, MaterialPageRoute(builder: (context) => homescreen()));
    } else {
      print('Error Updating profile. Status code: ${response.statusCode}');
    }
  }



  Widget currentScreen = profile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Profile"),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            tooltip: "Logout",
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            },
            icon: Icon(
              Icons.logout,
              size: 28,
            ),
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [

              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("images/user.png"),
                          )
                      ),
                    ),



                  ],
                ),
              ),
              SizedBox(height: 60,),

              buildTextField("Full name",nameController),
              buildTextField("Place",placeController),
              buildTextField("Contact number", phnController),

              SizedBox(height: 70,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
                    },
                    child: Text("CANCEL",style: TextStyle(
                        fontSize: 10,
                        letterSpacing: 2,
                        color: Colors.black
                    )),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      _update(nameController.text,placeController.text,phnController.text);
                    },
                    child: Text("EDIT",style: TextStyle(fontSize: 10, letterSpacing: 2, color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }

  Widget buildTextField(String labelText,TextEditingController controller){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
        controller: controller,
        //obscureText: isPasswordTextField ? isObscurePassword: false,
        decoration: InputDecoration(
          // suffixIcon: isPasswordTextField ?
          //     IconButton(
          //         onPressed: () {
          //           setState(() {
          //             isObscurePassword=!isObscurePassword;
          //           });
          //         },
          //         icon: Icon(Icons.remove_red_eye,color: Colors.grey,),
          //     ):null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 18,color: Colors.blue),
          floatingLabelBehavior: FloatingLabelBehavior.always,

          // hintText: controller,
          // hintStyle: TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.bold,
          //   color: Colors.grey
          // )

        ),
      ),
    );
  }

  static ClassNotify() {}
}