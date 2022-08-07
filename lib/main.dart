import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tshirt_app/ApiTest.dart';
import 'package:tshirt_app/DoneDailog.dart';
import 'package:tshirt_app/OrderDetails.dart';
import 'package:tshirt_app/ResetDialog.dart';
import 'package:tshirt_app/SplashScreen.dart';
import 'package:tshirt_app/firebase_options.dart';


import 'Register.dart';
import 'TshirtEdit.dart';
import 'listApi.dart';

void main() async {

   WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      routes: {
        '/' : (BuildContext context)=>const SplashScreen(),
        '/register' : (BuildContext context)=>const SplashScreen(), //SplashScreen
      },
    );
  }
}
