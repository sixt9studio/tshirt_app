
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:tshirt_app/HomeScreen.dart';

import 'PhotoFilter.dart';
import 'TshirtEdit.dart';







class PhotoEdit extends StatefulWidget {

    const PhotoEdit({Key? key, required this.name,}) : super(key: key);
   final String name;
  
  @override
  State<PhotoEdit> createState() => _PhotoEditState();

}

class _PhotoEditState extends State<PhotoEdit> {
  AssetImage imgType =   const AssetImage('assets/logo.png');


  onButtonPressed(AssetImage value) {
    setState(() {imgType = value; });
  }





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
               Expanded(

                child: Image.file(File(widget.name),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,

                ),
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
                          children:  const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/picture_icon.png'),
                              height: 15,
                              width: 15,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(color: Colors.transparent,child: Text("Original",
                                  style: TextStyle(fontSize: 12,fontFamily: 'poppins',
                                    color: Colors.black,fontWeight: FontWeight.w500,))),
                            ),

                          ],
                        ),
                        Column(
                          children:  <Widget>[
                            GestureDetector(
                              onTap: (){

                               // onButtonPressed(AssetImage('assets/picture_icon.png'));

                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) => MyFilters(name: widget.name)));

                              },
                              child: const Image(
                                alignment: Alignment.center,
                                image:
                                AssetImage('assets/painting_icon.png'),
                                height: 15,
                                width: 15,
                              ),
                            ),

                            const Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(color: Colors.transparent,child: Text("Art/Canvas", style: TextStyle(fontSize: 12,fontFamily: 'poppins',color: Colors.black,fontWeight: FontWeight.w500,))),
                            ),

                          ],
                        ),

                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/cartoon_icon.png'),
                              height: 15,
                              width: 15,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(color: Colors.transparent,child: Text("Cartoon", style: TextStyle(fontSize: 12,fontFamily: 'poppins',color: Colors.black,fontWeight: FontWeight.w500,))),
                            ),

                          ],
                        ),

                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/line_icon.png'),
                              height: 15,
                              width: 15,
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 6,bottom: 0),
                              child: Material(color: Colors.transparent,child: Text("Line Drawing", style: TextStyle(fontSize: 12,fontFamily: 'poppins',color: Colors.black,fontWeight: FontWeight.w500,))),
                            ),

                          ],
                        ),



                      ]
                  ),
                ),


              ),
            ),
            const Image(
              alignment: Alignment.center,
              image:
              AssetImage('assets/line_1.png'),
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children:  <Widget>[
                    SizedBox(
                      height: 40,
                      child:  TextButton.icon(
                        icon: Image.asset("assets/close_24px.png"), // Your icon here
                        onPressed: (){
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const MyHome();
                              }));
                        }, label: const Text(''),
                      ),
                    )


                  ],
                ),

                Column(
                  children: const [
                    Image(
                      alignment: Alignment.center,
                      image:
                      AssetImage('assets/line_vert.png'),
                      width: 5,
                      height: 50,
                    ),
                  ],
                ),

                Column(
                  children:  <Widget>[
                    SizedBox(
                      height: 40,
                      child: TextButton.icon(

                        icon: Image.asset("assets/check_24px.png"), // Your icon here
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ShirtEdit()));
                        }, label: const Text(''),
                      ),

                      ),

                  ],
                ),
              ],
            ),
          ],

        ),
      ),
      );



  }



}
