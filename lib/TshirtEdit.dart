import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tshirt_app/TextEdit.dart';

class ShirtEdit extends StatefulWidget {
  const ShirtEdit({Key? key}) : super(key: key);

  @override
  State<ShirtEdit> createState() => _ShirtEditState();
}

class _ShirtEditState extends State<ShirtEdit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          color: Colors.white
      ),

      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            const Expanded(
              child: Image(
                alignment: Alignment.center,
                image:
                AssetImage('assets/tshirt.png'),
                fit: BoxFit.fill,
              ),
            ),


       Row(
        children: const [

                Align(
                  alignment: Alignment.centerLeft,
                  child:  Padding(
                    padding: EdgeInsets.only(
                        left: 8, right: 0, top: 8,bottom: 4),
                    child: Material(
                      color: Colors.transparent,
                      child: Text("Shirt Color",textAlign: TextAlign.start, style: TextStyle(fontSize: 14,fontFamily: 'poppins',
                        color: Colors.black,fontWeight: FontWeight.w600,)),
                    ),
                  ),
                ),





              ],
            ),



            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children:  <Widget>[
                      SizedBox(
                        height: 50,
                        child:  TextButton.icon(
                          icon: Image.asset("assets/cl_white.png"), // Your icon here
                          onPressed: (){}, label: const Text(''),
                        ),
                      )


                    ],
                  ),

                  Column(
                    children:  <Widget>[
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          icon: Image.asset("assets/cl_grey.png"), // Your icon here
                          onPressed: (){}, label: const Text(''),
                        ),

                      ),

                    ],
                  ),

                  Column(
                    children:  <Widget>[
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          icon: Image.asset("assets/cl_choc.png"), // Your icon here
                          onPressed: (){}, label: const Text(''),
                        ),

                      ),

                    ],
                  ),

                  Column(
                    children:  <Widget>[
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          icon: Image.asset("assets/cl_black.png"), // Your icon here
                          onPressed: (){}, label: const Text(''),
                        ),

                      ),

                    ],
                  ),

                  Column(
                    children:  <Widget>[
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          icon: Image.asset("assets/cl_blue.png"), // Your icon here
                          onPressed: (){}, label: const Text(''),
                        ),

                      ),

                    ],
                  ),

                  Column(
                    children:  <Widget>[
                      SizedBox(
                        height: 50,
                        child: TextButton.icon(
                          icon: Image.asset("assets/cl_sky.png"), // Your icon here
                          onPressed: (){}, label: const Text(''),
                        ),

                      ),

                    ],
                  ),
                ],
              ),
            ),

            const Image(
              alignment: Alignment.center,
              image:
              AssetImage('assets/line_1.png'),
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 0, right: 0, top: 4,bottom: 0),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 8,bottom: 4),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/man_tshirt.png'),
                              height: 20,
                              width: 20,
                            ),

                            Padding(
                              padding: EdgeInsets.only(

                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(
                                color: Colors.transparent,
                                child: Text("Men’s\nT-shirt",textAlign: TextAlign.center, style: TextStyle(fontSize: 12,fontFamily: 'poppins',
                                  color: Colors.black,fontWeight: FontWeight.w500,)),
                              ),
                            ),

                          ],
                        ),
                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/woman_tshirt.png'),
                              height: 20,
                              width: 20,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(
                                color: Colors.transparent,
                                child: Text("Woman’s\nT-shirt",textAlign: TextAlign.center, style: TextStyle(fontSize: 12,fontFamily: 'poppins',
                                  color: Colors.black,fontWeight: FontWeight.w500,)),
                              ),
                            ),

                          ],
                        ),

                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/long_tshirt.png'),
                              height: 20,
                              width: 20,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(
                                color: Colors.transparent,
                                child: Text("Long Sleeve\nT-Shirt",textAlign: TextAlign.center, style: TextStyle(fontSize: 12,fontFamily: 'poppins',
                                  color: Colors.black,fontWeight: FontWeight.w500,)),
                              ),
                            ),

                          ],
                        ),

                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/tank_tshirt.png'),
                              height: 20,
                              width: 20,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(
                                color: Colors.transparent,
                                child: Text("Tank Top\n  ",textAlign: TextAlign.center, style: TextStyle(fontSize: 12,fontFamily: 'poppins',
                                  color: Colors.black,fontWeight: FontWeight.w500,)),
                              ),
                            ),

                          ],
                        ),


                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/racer_tshirt.png'),
                              height: 20,
                              width: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(
                                color: Colors.transparent,
                                child: Text("Men’s Racer\nBack tank",textAlign: TextAlign.center, style: TextStyle(fontSize: 12,fontFamily: 'poppins',
                                  color: Colors.black,fontWeight: FontWeight.w500,)),
                              ),
                            ),

                          ],

                        ),

                      ]
                  ),
                ),


              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TextEdit()));
              },
              child: const Image(
                alignment: Alignment.center,
                image:
                AssetImage('assets/bt_edittext.png'),
              //  height: 70,
                width: double.infinity,
              ),
            ),


          ],

        ),
      ),
    );



  }
}