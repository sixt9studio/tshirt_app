import 'dart:io';


import 'package:flutter/material.dart';
import 'package:tshirt_app/PhotoEdit.dart';

class MyFilters extends StatefulWidget {
  const MyFilters({Key? key,  required this.name}) : super(key: key);
  final String name;

  @override
  State<MyFilters> createState() => _MyFiltersState();
}

class _MyFiltersState extends State<MyFilters> {


  ColorFilter effects =  const ColorFilter.matrix([
  0.9,0.50,0.1,0.0,0.0,
  0.3,0.5,0.1,0.0,0.0,
  0.2,0.3,0.7,0.0,0.0,
  0.0,0.0,0.0,1.0,0.0
  ]);


  onButtonPressed(ColorFilter value) {
    setState(() {effects = value; });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          color: Colors.white
      ),

      child: SafeArea(
        child: Column(
          children: <Widget>[

            Expanded(

              child:  ColorFiltered(


                colorFilter: effects,
                child: Image.file(File(widget.name),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,

                ),
              ),
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
                                return  PhotoEdit(name: widget.name);
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
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => const ShirtEdit()));
                        }, label: const Text(''),
                      ),

                    ),

                  ],
                ),
              ],
            ),

            const Image(
              alignment: Alignment.center,
              image:
              AssetImage('assets/line_1.png'),
              height: 10,
            ),





            Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                    children: <Widget>[


                      // filter 1
                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          0.9,0.50,0.1,0.0,0.0,
                          0.3,0.5,0.1,0.0,0.0,
                          0.2,0.3,0.7,0.0,0.0,
                          0.0,0.0,0.0,1.0,0.0
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              0.9,0.50,0.1,0.0,0.0,
                              0.3,0.5,0.1,0.0,0.0,
                              0.2,0.3,0.7,0.0,0.0,
                              0.0,0.0,0.0,1.0,0.0
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 2

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1.3, -0.3, 1.1, 0, 0,
                          0, 1.3, 0.4, 0, 0,
                          0, 0, 0.8, 0.2, 0,
                          0, 0, 0, 1, 1,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1.3, -0.3, 1.1, 0, 0,
                              0, 1.3, 0.4, 0, 0,
                              0, 0, 0.8, 0.2, 0,
                              0, 0, 0, 1, 1,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 3

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, 0, 0, -0.2, 0,
                          -0.3, 1, 0, 0, 0,
                          0, 0, 1, 0, 0,
                          -0.3, -1.2, 1.4, 1, -0.1,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, 0, 0, -0.2, 0,
                              -0.3, 1, 0, 0, 0,
                              0, 0, 1, 0, 0,
                              -0.3, -1.2, 1.4, 1, -0.1,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 4

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, 0, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          -0.2, 0.2, 2.6, 0.4, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, 0, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              -0.2, 0.2, 2.6, 0.4, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 5

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, 0, 0, 0, 0,
                          0.2, 1, 0, 0, 0,
                          0, 3, 1, -1.1, 0,
                          0, 0, 0.5, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, 0, 0, 0, 0,
                              0.2, 1, 0, 0, 0,
                              0, 3, 1, -1.1, 0,
                              0, 0, 0.5, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 6

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, 0, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          -0.4, 0, 1, 0, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, 0, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              -0.4, 0, 1, 0, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 7

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, -0.4, 0, 0, 0,
                          0, 1, 0.4, -0.1, 0,
                          0, 1.2, 1, 0.1, 0.5,
                          0, 0, 1.7, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, -0.4, 0, 0, 0,
                              0, 1, 0.4, -0.1, 0,
                              0, 1.2, 1, 0.1, 0.5,
                              0, 0, 1.7, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 8

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, -1.1, 0, 0, 0,
                          -0.2, 1.0, 0.3, 0.1,
                          0, -0.1, 0, 1, 0, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, -1.1, 0, 0, 0,
                              -0.2, 1.0, 0.3, 0.1,
                              0, -0.1, 0, 1, 0, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 9

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, -0.2, 0, 0, 0,
                          -0.2, 1.0, 0.3, 0.1, 0,
                          -0.1, 0, 1, 0, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, -0.2, 0, 0, 0,
                              -0.2, 1.0, 0.3, 0.1, 0,
                              -0.1, 0, 1, 0, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 10

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          0, -3, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          0, 1, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              0, -3, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              0, 1, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 11

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          0, 1, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          0, 1, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              0, 1, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              0, 1, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 12

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, 0, 0, 0, 0,
                          -0.4, 1.3, -0.4, 0.2, -0.1,
                          0, 0, 1, 0, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, 0, 0, 0, 0,
                              -0.4, 1.3, -0.4, 0.2, -0.1,
                              0, 0, 1, 0, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 13

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1, 0, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          -0.2, 0.2, 0.1, 0.4, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1, 0, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              -0.2, 0.2, 0.1, 0.4, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 14

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          1.3, -0.3, 1.1, 0, 0,
                          0, 1.3, 0.2, 0, 0,
                          0, 0, 0.8, 0.2, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              1.3, -0.3, 1.1, 0, 0,
                              0, 1.3, 0.2, 0, 0,
                              0, 0, 0.8, 0.2, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 15

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          0, 1.0, 0, 0, 0,
                          0, 1.0, 0, 0, 0,
                          0, 0.6, 1, 0, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              0, 1.0, 0, 0, 0,
                              0, 1.0, 0, 0, 0,
                              0, 0.6, 1, 0, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 16

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          -0.2, 0.7, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          1, 0, -1.8, 0, 0,
                          0, 0, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              -0.2, 0.7, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              1, 0, -1.8, 0, 0,
                              0, 0, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),

                      //filter 17

                      const SizedBox(
                        width: 8,
                      ),



                      ColorFiltered(
                        colorFilter: const ColorFilter.matrix([
                          0, 1, 0, 0, 0,
                          0, 1, 0, 0, 0,
                          0, 0.5, 0, 0, 0,
                          0, -1.6, 0, 1, 0,
                        ]),

                        child: GestureDetector(
                          onTap: (){
                            onButtonPressed(const ColorFilter.matrix([
                              0, 1, 0, 0, 0,
                              0, 1, 0, 0, 0,
                              0, 0.5, 0, 0, 0,
                              0, -1.6, 0, 1, 0,
                            ]));
                          },
                          child: Container(

                              height:20,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(color: const Color(0x33A6A6A6)),
                                image: DecorationImage(image: Image.file(File(widget.name)).image, fit: BoxFit.cover

                                ),

                              )
                          ),
                        ),
                      ),



                    ]

                  )
            ),
          )

          ],
        ),
      ),
    );
  }


}
