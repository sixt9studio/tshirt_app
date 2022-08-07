import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tshirt_app/Login.dart';

import 'MyOrder.dart';
import 'Splash_2.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash_bg.png"), fit: BoxFit.cover)
      ),
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_b.png"), fit: BoxFit.cover)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Container(
               alignment: Alignment.center,
               height: 500,
               width: 500,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logo.png"))

              ),
            ),
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_controller),

                child: const Image(
                image:
                AssetImage('assets/loading.png'),
                height: 50, //-2 for padding
                width: 50,
            ),
             ),

            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Loading...',
                style: TextStyle(
                    decoration: TextDecoration.none,
                  fontSize: 14.0, // insert your font size here
                    fontFamily: 'Poppins',
                  color: Colors.white
              )
              ),
            )
          ],
        ),


      ),
    );

    
  }
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,


    );

    
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    super.initState();
    _controller.forward();
    Timer(const Duration(seconds: 3), (){
      dispose();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
          const  Splash2()));
// Splash2()

    });

  }
}

