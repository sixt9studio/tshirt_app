import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tshirt_app/HomeScreen.dart';

import 'Login.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash_2.jpg"), fit: BoxFit.cover)
      ),
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,


    );


    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    super.initState();
    _controller.forward();
    Timer(const Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
      const MyHome()));
    });

  }
}
