import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tshirt_app/MyOrder.dart';

import 'HomeScreen.dart';

import 'package:http/http.dart' as http;

import 'PLogin.dart';
import 'ResetDialog.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key, }) : super(key: key);


  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  String imgUrl = 'https://cdn-icons-png.flaticon.com/512/147/147140.png';
  String uName = '';
  String uEmail='';
  String uPhone='';
  bool tvUpload=true;
  bool apiState = false;
  String proPhoto = "";
  bool localImage = false;
  bool netImage = true;

  @override
  void initState() {
    super.initState();
     fetchLogin();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { pageBack(context);
      return false;},
      child: Container(
        decoration:  const BoxDecoration(
            color: Colors.white
        ),

        child: SafeArea(
          child: Column(
            children: [

              Visibility(
                visible: true,
                child: SizedBox(
                  height: 1,

                  child: Visibility(
                    visible: apiState,
                    child: FutureBuilder <Album>(
                      future: fetchAlbum(),
                      builder: (context, snapshot) {

                        if (snapshot.hasData) {

                          Future.delayed(Duration.zero, ()  {
                            setState(() {
                              uName=snapshot.data!.userName;
                              uEmail=snapshot.data!.userEmail;
                              uPhone=snapshot.data!.userPhone;
                              if(snapshot.data!.userPhoto==''){

                                if(proPhoto==''){
                                  imgUrl = 'https://cdn-icons-png.flaticon.com/512/147/147140.png';
                                  setState(() {netImage=true;localImage=false; });
                                }else{
                                  setState(() { localImage=true; netImage=false; });
                                }

                              }else{
                                setState(() { localImage=false; netImage=true; });
                                imgUrl=snapshot.data!.userPhoto;
                              }
                            });

                          });

                        }

                        else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }
                        // By default show a loading spinner.

                        return const Visibility(visible:false,child: SizedBox());
                      },
                    ),
                  ),
                ),
              ),


              Container(
                height: 40,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [

                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHome()));
                      },
                      child: const Image(
                        alignment: Alignment.center,
                        image:
                        AssetImage('assets/arrow_back.png'),
                        height: 20,
                        width: 30,
                      ),
                    ),

                    const Material(color: Colors.transparent,child: Text("My Account",
                        style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                          color: Colors.black,fontWeight: FontWeight.w500,))),

                    const Visibility(
                      visible: false,
                      child: Image(
                        alignment: Alignment.center,
                        image:
                        AssetImage('assets/close_24px.png'),
                        height: 20,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              ),



              Row(
                children: [
                  const SizedBox(width: 8),
                  Column(
                    children:  <Widget>[

                    Visibility(
                      visible: netImage,
                      child: Container(
                      width: 80,
                      decoration: BoxDecoration(

                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white10,
                          width: 1,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage:
                        NetworkImage(imgUrl),
                        backgroundColor: Colors.transparent,
                      ),
                  ),
                    ),

                      //local image

                      Visibility(
                        visible: localImage,
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(

                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white10,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage:
                            FileImage(File(proPhoto)),
                            backgroundColor: Colors.transparent,
                          ),



                        ),
                      ),



                       Container(
                        transform: Matrix4.translationValues(0, -15, 0.0),
                        child:  Material(color: Colors.transparent,child: Visibility(
                          visible: tvUpload,
                          child: GestureDetector(

                              onTap: () => _getFromGallery(uEmail,proPhoto),

                            child: const Text("Upload",
                                style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                                  color: Colors.black,fontWeight: FontWeight.w500,)),
                          ),
                        )),
                      ),




                    ],
                  ),

                 const SizedBox(
                   width: 30,
                 ),

                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children:  [
                       Material(color: Colors.transparent,child: Text(uName,
                         style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                           color: HexColor.fromHex('#EB7E26'),fontWeight: FontWeight.w500,))),

                      Row(
                        children:  [

                          const Image(
                            alignment: Alignment.center,
                            image:
                            AssetImage('assets/mail_outline_24px.png'),
                            height: 24,
                            width: 24,
                          ),

                           const SizedBox(
                            width: 8,
                          ),

                          Material(color: Colors.transparent,child: Text(uEmail,
                             style: const TextStyle(fontSize: 15,fontFamily: 'poppins',
                               color: Colors.black,fontWeight: FontWeight.w500,))),


                        ],
                      ),

                     Row(
                       children:  [

                         Visibility(
                           visible: tvUpload,
                           child: const Image(
                             alignment: Alignment.center,
                             image:
                             AssetImage('assets/call_24px.png'),
                             height: 24,
                             width: 24,
                           ),
                         ),

                         const  SizedBox(
                           width: 8,
                         ),

                         Material(color: Colors.transparent,child: Text(uPhone,
                             style: const TextStyle(fontSize: 15,fontFamily: 'poppins',
                               color: Colors.black,fontWeight: FontWeight.w500,))),


                       ],
                     ),

                   ],
                 )

                ],
              ),

              const SizedBox(height: 35,),

              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MyOrders(name:uEmail)));
                },
                child: Row(
                  children:  [
                    const SizedBox(width: 10),

                    Material(color: Colors.transparent,child: Text("02",
                        style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                          color: HexColor.fromHex('#EB7E26'),fontWeight: FontWeight.w500,))),

                    const SizedBox(width: 20),
                    const Material(color: Colors.transparent,child: Text("My Orders",
                        style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                          color: Colors.black,fontWeight: FontWeight.w500,))),
                  ],
                ),
              ),

              const SizedBox(height: 35,),

              Row(
                children:  const [

                  SizedBox(width: 7),


                   Image(
                    alignment: Alignment.center,
                    image:
                    AssetImage('assets/share_24px.png'),
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(width: 20),
                  Material(color: Colors.transparent,child: Text("Tell your Friend",
                      style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                        color: Colors.black,fontWeight: FontWeight.w500,))),
                ],
              ),

              const SizedBox(height: 35,),

              Row(
                children:  const [

                  SizedBox(width: 7),


                  Image(
                    alignment: Alignment.center,
                    image:
                    AssetImage('assets/help_icon_24px.png'),
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(width: 20),
                  Material(color: Colors.transparent,child: Text("Help and Support",
                      style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                        color: Colors.black,fontWeight: FontWeight.w500,))),
                ],
              ),


              const SizedBox(height: 35,),

              Row(
                children:   [

                  const SizedBox(width: 7),


                  const Image(
                    alignment: Alignment.center,
                    image:
                    AssetImage('assets/settings_24px.png'),
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 20),
                  Material(color: Colors.transparent,child: GestureDetector(
                    onTap: (){

                      showDialog(
                        context: context,
                        builder: (_) =>  WillPopScope(
                            onWillPop: () async {
                              return false;
                            },
                            child: const ResetDialog()),
                      );

                    },
                    child: const Text("Change Password",
                        style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                          color: Colors.black,fontWeight: FontWeight.w500,)),
                  )),
                ],
              ),

              const SizedBox(height: 35,),

              Padding(
                padding: const EdgeInsets.fromLTRB(25, 18, 25, 0),
                child: Material(
                  child: SizedBox(
                    width: double.infinity, // <-- Your width
                    height: 50, // <-- Your height
                    child: ElevatedButton(
                      onPressed: () async {

                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();
                      if (!mounted) return;
                       Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => const MyHome()));

                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor.fromHex('#EB7E26'),

                      ),
                      child: const Text("Logout", style: TextStyle(fontSize: 20,fontFamily: 'poppins')),
                    ),
                  ),
                ),
              ),

            ],

          ),
        ),



      ),
    );
  }

  void fetchLogin() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {

        if(user.providerData[0].providerId=='google.com'){
          updateProfile(user);

        }else{
          //apicall
          fetchAlbum();
          fetchPhoto();
          setState(() {  apiState = true; });


        }
      }
    });

  }

  void updateProfile(User user) {
    setState(() {
      uName=user.displayName!;
      uEmail=user.email!;
      imgUrl = user.photoURL!;
      tvUpload=false;

    });
  }


  Future <Album> fetchAlbum() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String mEmail = (prefs.getString('userEmail'))?? '';

    final response = await http.post(
      Uri.parse('https://itflyweb.com/ossum/admin/loginapi.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': mEmail,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<void> fetchPhoto() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String mEmail = (prefs.getString('userEmail'))?? '';
    setState(() {
      proPhoto = (prefs.getString('${mEmail}Photo'))?? '';
      localImage=true; netImage=false;

    });


  }

  _getFromGallery(String uEmail, String proPhoto) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return;

    final prefs = await  SharedPreferences.getInstance();
    prefs.setString('${uEmail}Photo', pickedFile.path.toString());

   await fetchPhoto();




  }

}


class Album {

  final String userName;
  final String userEmail;
  final String userPhone;
  final String userPhoto;

  Album({required this.userName, required this.userEmail, required this.userPhone,required this.userPhoto});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userName: json['customer_name'],
      userEmail: json['customer_email'],
      userPhone: json['customer_contact'],
      userPhoto: json['customer_image'],
    );
  }
}

void pageBack(BuildContext context) {
  // Route route = MaterialPageRoute(builder: (context) => TextEdit(name: customFile));
  // Navigator.pushReplacement(context, route);

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyHome()));


}
