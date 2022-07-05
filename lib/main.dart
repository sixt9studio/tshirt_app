import 'package:flutter/material.dart';
import 'package:tshirt_app/SplashScreen.dart';

void main() {
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
        '/register' : (BuildContext context)=>const SplashScreen(),
      },
    );
  }
}
