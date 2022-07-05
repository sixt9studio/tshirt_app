import 'package:flutter/material.dart';
import 'package:tshirt_app/OrderDetails.dart';
import 'Register.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
        color: Colors.white
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children:    <Widget>[
              const Image(
                alignment: Alignment.center,
                image:
                AssetImage('assets/login_logo.png'),
                height: 450,
                width: 400,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                child: Material(
                  child: TextField(
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
                      contentPadding:  const EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'poppins'
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      contentPadding:  const EdgeInsets.fromLTRB(32, 16, 32, 16),
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
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const Signup()));

                       //  Navigator.push(context, ScaleRoute(page: const Signup()));

                      },
                     style: ElevatedButton.styleFrom(
                       primary: HexColor.fromHex('#EB7E26'),

                     ),
                       child: const Text("Let’s Get Started", style: TextStyle(fontSize: 20,fontFamily: 'poppins')),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OrderDetail()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor.fromHex('#EB7E26'),

                      ),
                      child: const Text("Continue To Check Out", style: TextStyle(fontSize: 20,fontFamily: 'poppins')),
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
                        onPressed: () {},
                        child: Row(

                          children: const [
                            Image(image:AssetImage("assets/icon_google.png"),
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
                            Image(image:AssetImage("assets/icon_fb.png"),
                              height: 45,),

                            Center(
                              widthFactor: 1.5,
                              child: Text('Login with Facebook',
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

               const Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: Text("Forget Password",
                style: TextStyle(
                  color: Colors.black,decoration: TextDecoration.none,
                  fontSize: 12,
                  fontFamily: 'poppins',
                )),
              ),

               Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40,30),
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
                      TextSpan(text: 'Register', style:  TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),


            ],


          ),




        ),
      ),

    );
  }
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
  );
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


