import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tshirt_app/OrderDetails.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';
import 'ResetDialog.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pass1Controller = TextEditingController();
  TextEditingController pass2Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { pageBack(context);
      return false;},
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white
        ),
        child: SafeArea(
          child: LoaderOverlay(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const Image(
                    alignment: Alignment.center,
                    image:
                    AssetImage('assets/signup_logo.png'),
                    height: 450,
                    width: 400,
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                    child: Material(
                      child: TextField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'poppins'
                          ),
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Full Name",
                          contentPadding: const EdgeInsets.fromLTRB(
                              32, 16, 32, 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                    child: Material(
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'poppins'
                          ),
                          prefixIcon: const Icon(Icons.email),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Your Email",
                          contentPadding: const EdgeInsets.fromLTRB(
                              32, 16, 32, 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                    child: Material(
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'poppins'
                          ),
                          prefixIcon: const Icon(Icons.phone),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Your Phone Number",
                          contentPadding: const EdgeInsets.fromLTRB(
                              32, 16, 32, 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 12, 25, 8),
                    child: Material(
                      child: TextField(
                        controller: pass1Controller,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'poppins'
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password",
                          contentPadding: const EdgeInsets.fromLTRB(
                              32, 16, 32, 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),

                          ),
                        ),
                      ),
                    ),

                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 12, 25, 8),
                    child: Material(
                      child: TextField(
                        controller: pass2Controller,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'poppins'
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Password Again",
                          contentPadding: const EdgeInsets.fromLTRB(
                              32, 16, 32, 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),

                          ),
                        ),
                      ),
                    ),

                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 18, 25, 0),
                    child: Material(
                      child: SizedBox(
                        width: double.infinity, // <-- Your width
                        height: 55, // <-- Your height
                        child: ElevatedButton(
                          onPressed: () {
                            context.loaderOverlay.show();
                            registerFirebase();
                            //   createAlbum();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HexColor.fromHex('#EB7E26'),


                          ),
                          child: const Text("Let’s Get Started", style: TextStyle(
                              fontSize: 20, fontFamily: 'poppins')),
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 18, 25, 0),
                    child: Material(
                      color: Colors.white,
                      child: SizedBox(
                        width: double.infinity, // <-- Your width
                        height: 60, // <-- Your height
                        child: Image(
                          alignment: Alignment.center,
                          image:
                          AssetImage('assets/or.png'),
                          height: 50,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 18, 25, 0),
                    child: Material(
                      child: SizedBox(
                        width: double.infinity, // <-- Your width
                        height: 55, // <-- Your height
                        child: ElevatedButton(
                          onPressed: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => const OrderDetail());
                            Navigator.pushReplacement(context, route);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: HexColor.fromHex('#EB7E26'),

                          ),
                          child: const Text("Continue To Check Out",
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'poppins')),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, elevation: 2),
                            onPressed: () {
                              context.loaderOverlay.show();
                              signup(context, mounted);
                            },
                            child: Row(

                              children: const [
                                Image(image: AssetImage("assets/icon_google.png"),
                                  height: 45,),

                                Center(
                                  widthFactor: 1.5,
                                  child: Text('Login with Google',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black
                                    ),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),

                  Padding(
                      padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white, elevation: 2),
                            onPressed: () {},
                            child: Row(

                              children: const [
                                Image(image: AssetImage("assets/icon_fb.png"),
                                  height: 45,),

                                Center(
                                  widthFactor: 1.5,
                                  child: Text('Login with Facebook',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: GestureDetector(
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
                      child: const Text("Forget Password",
                          style: TextStyle(
                            color: Colors.black, decoration: TextDecoration.none,
                            fontSize: 12,
                            fontFamily: 'poppins',
                          )),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
                    child: RichText(
                      text: const TextSpan(
                        // Here is the explicit parent TextStyle
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontFamily: 'poppins',
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Don’t have a account? '),
                          TextSpan(text: 'Register',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),


                ],


              ),


            ),
          ),
        ),

      ),
    );
  }

  void registerFirebase() async {
    String fName = fullNameController.text;
    String fEmail = emailController.text;
    String fPhone = phoneController.text;
    String fPass1 = pass1Controller.text;
    String fPass2 = pass2Controller.text;

    if (fName == '' || fEmail == '' || fPhone == '' || fPass1 == '' ||
        fPass2 == '') {
      Fluttertoast.showToast(
          msg: "Enter Valid Details.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0
      );
    } else if (!fEmail.contains('@') || !fEmail.contains('.')) {
      Fluttertoast.showToast(
          msg: "Enter Valid Email.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0
      );
    }

    else if (fPass1 != fPass2) {
      Fluttertoast.showToast(
          msg: "Password not matched.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0
      );
    } else {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: fEmail,
          password: fPass2,
        );
        if(!mounted)return;
        createAlbum(fName, fEmail, fPhone, fPass2,mounted,context);
        Fluttertoast.showToast(
            msg: "Registration Successful.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            timeInSecForIosWeb: 1,
            fontSize: 16.0
        );


      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Fluttertoast.showToast(
              msg: "The password provided is too weak.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              timeInSecForIosWeb: 1,
              fontSize: 16.0
          );
        } else if (e.code == 'email-already-in-use') {
          Fluttertoast.showToast(
              msg: "The account already exists for that email.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              timeInSecForIosWeb: 1,
              fontSize: 16.0
          );
        }
      } catch (e) {
        //  print(e);
        Fluttertoast.showToast(
            msg: "Something went wrong.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            timeInSecForIosWeb: 1,
            fontSize: 16.0
        );
      }
    }
    context.loaderOverlay.hide();
  }

}
Future<Album> createAlbum2 (String uName, String uEmail, BuildContext context, UserCredential result, bool mounted) async {
  final response = await http.post(
    Uri.parse('https://itflyweb.com/ossum/admin/reg_api.php'),
    headers: <String, String>{

      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'name': uName, 'mobile': '', 'password': '', 'email': uEmail,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    final prefs = await  SharedPreferences.getInstance();
    prefs.setString('userEmail', uEmail);

    if (mounted) {
      context.loaderOverlay.hide();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OrderDetail()));
    }
// if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen

    return Album.fromJson(jsonDecode(response.body));



  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.

    Fluttertoast.showToast(
        msg: "Something Went Wrong.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    throw ('');
  }
}

Future<Album> createAlbum (String fName, String fEmail, String fPhone, String fPass2, bool mounted, BuildContext context) async {
  final response = await http.post(
    Uri.parse('https://itflyweb.com/ossum/admin/reg_api.php'),
    headers: <String, String>{

      'Content-Type': 'application/json; charset=UTF-8',
    },

    body: jsonEncode(<String, String>{
      'name': fName, 'mobile': fPhone, 'password': fPass2, 'email': fEmail,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.


    final prefs = await  SharedPreferences.getInstance();
    prefs.setString('userEmail', fEmail);

if(mounted){
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OrderDetail()));
}

    return Album.fromJson(jsonDecode(response.body));

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.

    Fluttertoast.showToast(
        msg: "Something Went Wrong.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    throw ('');
  }
}


class Album {

  final String message;
  final bool status;

  Album({required this.message, required this.status});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      message: json['Massage'],
      status: json['Status'],
    );
  }
}


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

Future<void> signup(BuildContext context, bool mounted) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);


    final UserCredential authResult =
    await auth.signInWithCredential(authCredential);

    final User? user = authResult.user;

    String? uName = user!.displayName;
    String? uEmail = user.email;


    ///Her to check isNewUser OR Not
    if (authResult.additionalUserInfo!.isNewUser) {
      if (!mounted) return;
      createAlbum2(uName!,uEmail!,context,authResult,mounted);

    }else{
      final prefs = await  SharedPreferences.getInstance();
      prefs.setString('userEmail', uEmail!);
      if (!mounted) return;
      context.loaderOverlay.hide();

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OrderDetail()));

    }
  } else {

    context.loaderOverlay.hide();
  }
}

void pageBack(BuildContext context) {
  // Route route = MaterialPageRoute(builder: (context) => TextEdit(name: customFile));
  // Navigator.pushReplacement(context, route);

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyLogin()));

}
