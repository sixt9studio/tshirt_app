
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import 'package:http/http.dart' as http;
import 'TshirtEdit.dart';







class PhotoEdit extends StatefulWidget {

    const PhotoEdit({Key? key, required this.name,}) : super(key: key);
   final String name;
  
  @override
  State<PhotoEdit> createState() => _PhotoEditState();

}


class _PhotoEditState extends State<PhotoEdit> {
  AssetImage imgType = const AssetImage('assets/logo.png');

  final _globalkey = GlobalKey<FormState>();

  onButtonPressed(AssetImage value) {
    setState(() {
      imgType = value;
    });
  }

  ColorFilter effects = const ColorFilter.matrix([
    1, 0, 0, 0, 0,
    0, 1, 0, 0, 0,
    0, 0, 1, 0, 0,
    0, 0, 0, 1, 0,
  ]);

  _onButtonPressed(ColorFilter value) {
    setState(() {
      effects = value;
    });
  }

  bool optionTag = true;
  bool filterTag = false;

  _onEFPressed(bool value) {
    setState(() {
      optionTag = value;
    });
  }

  _onOPPressed(bool value) {
    setState(() {
      filterTag = value;
    });
  }

  ScreenshotController screenshotController = ScreenshotController();
  late File customFile;

  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();


  Color mycolor = Colors.transparent;
  bool mDraw = false;

  late Future <List<Data>> futureData;
  String tIndex = 'empty';
  bool vis = true;
  bool oldWid = true;
  bool newWid = false;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white
      ),

      child: SafeArea(
        child: LoaderOverlay(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

               Visibility(
                visible: vis,
                  child: SizedBox(
                    height: 1,

                    child: FutureBuilder <List<Data>>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Data>? data = snapshot.data;

                          tIndex = data![0].catId;

                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default show a loading spinner.
                        return const Visibility(visible:false,child: SizedBox());
                      },
                    ),
                  ),
              ),

              Visibility(
                visible: oldWid,
                child: Expanded(
                  child: Screenshot(
                    controller: screenshotController,
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [

                          ColorFiltered(
                            colorFilter: effects,

                           child: Image.file(File(widget.name),
                                  fit: BoxFit.fill)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              //back

              Visibility(
                visible: newWid,
                child: Expanded(
                  child: Screenshot(
                    controller: screenshotController,
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [

                          ColorFiltered(
                            colorFilter: const ColorFilter.matrix(<double>[
                              // 0.2126, 0.7152, 0.0722, 0, 0,
                              // 0.2126, 0.7152, 0.0722, 0, 0,
                              // 0.2126, 0.7152, 0.0722, 0, 0,
                              // 0,      0,      0,      1, 0,

                              0, 1, 0, 0, 1,
                              0, 1, 0, 0, 1,
                              0, 1, 0, 0, 1,
                              0, 1, 0, 1, 0,

                            ]),

                              child: Image.file(
                                File(widget.name),
                                fit: BoxFit.fill,
                                color: Colors.black,
                                colorBlendMode: BlendMode.difference,
                              ),

                          ),

                           const Opacity(
                             opacity: 0.5,
                             child: Image(
                          alignment: Alignment.center,
                              image:
                               AssetImage('assets/sktch_1.jpg'),
                               fit: BoxFit.fill,
                               color: Colors.black,
                               colorBlendMode: BlendMode.plus,
                               ),
                           ),


                          const Opacity(
                            opacity: 0.1,
                            child: Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/sktch_2.jpg'),
                              fit: BoxFit.fill,
                              color: Colors.black,
                              colorBlendMode: BlendMode.colorDodge,
                            ),
                          ),

                        ],

                      ),
                    ),
                  ),
                ),
              ),






              //  child: Image.file(File(widget.name), fit: BoxFit.fill)

              //filter row
              Visibility(
                visible: filterTag,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          child: TextButton.icon(
                            icon: Image.asset("assets/close_24px.png"),
                            // Your icon here
                            onPressed: () {
                              _onButtonPressed(const ColorFilter.matrix([
                                1, 0, 0, 0, 0,
                                0, 1, 0, 0, 0,
                                0, 0, 1, 0, 0,
                                0, 0, 0, 1, 0,
                              ]));

                              _onEFPressed(true);
                              _onOPPressed(false);
                            },
                            label: const Text(''),
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
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          child: TextButton.icon(

                            icon: Image.asset("assets/check_24px.png"),
                            // Your icon here
                            onPressed: () {
                              _onEFPressed(true);
                              _onOPPressed(false);
                            },
                            label: const Text(''),
                          ),

                        ),

                      ],
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: filterTag,
                child: const Image(
                  alignment: Alignment.center,
                  image:
                  AssetImage('assets/line_1.png'),
                  height: 10,
                ),
              ),


              Visibility(
                visible: filterTag,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 80,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[


                            // filter 1
                            ColorFiltered(
                              colorFilter: const ColorFilter.matrix([
                                1, 0, 0, 0, 0,
                                0, 1, 0, 0, 0,
                                0, 0, 1, 0, 0,
                                -0.3, 0, 0, 1, 0,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, 0, 0, 0,
                                    0, 0, 1, 0, 0,
                                    -0.3, 0, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, 0, 0, 0,
                                0, 1, 0, 0, 0,
                                0, 0, 1, 0, 0.2,
                                0, 0, 0, 1, 0,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, 0, 0, 0,
                                    0, 0, 1, 0, 0.2,
                                    0, 0, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, 0, -0.1, 0,
                                0, 1, 0, 0, 0,
                                0, 0, 1, 0, 0,
                                0, 0, 0, 1, 0,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, -0.1, 0,
                                    0, 1, 0, 0, 0,
                                    0, 0, 1, 0, 0,
                                    0, 0, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, 0, -0, 0.1,
                                0, 1, 0, 0, 0,
                                0, 0, 1, 0, 0,
                                0, 0, 0, 1, 0,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, -0, 0.1,
                                    0, 1, 0, 0, 0,
                                    0, 0, 1, 0, 0,
                                    0, 0, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                0, 1, -0.2, 0, 0,
                                0.1, 0, 1, 0, 0,
                                0, 0, 0, 1, -0.1,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, -0.2, 0, 0,
                                    0.1, 0, 1, 0, 0,
                                    0, 0, 0, 1, -0.1,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, 0, 0, 0,
                                    -0.4, 0, 1, 0, 0,
                                    0, 0, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, 0, 0, 0,
                                0, 1, -0.1, 0, 0,
                                0.1, 0.5, 1, 0.1, 0,
                                0, 0, 0, 1, 0,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, -0.1, 0, 0,
                                    0.1, 0.5, 1, 0.1, 0,
                                    0, 0, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, 0, 0.1, 0,
                                0, 1, 0, 0, 0,
                                0, 0, 1, 0, 0,
                                0, -0.5, 0, 1, 0,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0.1, 0,
                                    0, 1, 0, 0, 0,
                                    0, 0, 1, 0, 0,
                                    0, -0.5, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                0, 1.3, 0, 0, 0,
                                0, 1.0, 0, 0, 0,
                                0, 0.2, 1, 0, 0,
                                0, 0, 0, 1, 0,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    0, 1.3, 0, 0, 0,
                                    0, 1.0, 0, 0, 0,
                                    0, 0.2, 1, 0, 0,
                                    0, 0, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, 0, 0, 0,
                                0, 1, -0.2, 0.1, -0.1,
                                0, 0, 1, 0, 0,
                                0, 0, 0, 1, 0,
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, -0.2, 0.1, -0.1,
                                    0, 0, 1, 0, 0,
                                    0, 0, 0, 1, 0,
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1.0, 0.0, 0.2, 0.0, 0.0,
                                0.0, 1.0, 0.0, 0.0, 0.0,
                                0.0, 0.0, 1.0, 0.0, 0.0,
                                0.0, 0.0, 0.0, 1.0, 0.0
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1.0, 0.0, 0.2, 0.0, 0.0,
                                    0.0, 1.0, 0.0, 0.0, 0.0,
                                    0.0, 0.0, 1.0, 0.0, 0.0,
                                    0.0, 0.0, 0.0, 1.0, 0.0
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                0, 1, 0, 0, 0,
                                0, 0, 1, 0, 0,
                                0, 0.4, -0.4, 1, 0
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, 0, 0, 0,
                                    0, 0, 1, 0, 0,
                                    0, 0.4, -0.4, 1, 0
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                0, 1, -0.3, 0, 0,
                                0, 0, 1, -0.1, 0,
                                0, 0.4, -0.4, 1, 0
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, -0.3, 0, 0,
                                    0, 0, 1, -0.1, 0,
                                    0, 0.4, -0.4, 1, 0
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, -0.2, 0, 0, 0,
                                0, 1, 0, -0.1, 0,
                                0, -0.7, 1, 0.1, 0,
                                0, 0, 1.7, 1, 0
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, -0.2, 0, 0, 0,
                                    0, 1, 0, -0.1, 0,
                                    0, -0.7, 1, 0.1, 0,
                                    0, 0, 1.7, 1, 0
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, 0, 0, 0,
                                0, 1, 0.4, 0, 0,
                                0, 0.7, 1, 0, 0,
                                0, 0, 0, 1, 0
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, 0.4, 0, 0,
                                    0, 0.7, 1, 0, 0,
                                    0, 0, 0, 1, 0
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, -0.5, 0, 0,
                                0, 1, -0.5, 0, 0,
                                -0.2, 0.2, 0.1, 0.4, 0,
                                0.6, 0, -0.5, 1, 0
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, -0.5, 0, 0,
                                    0, 1, -0.5, 0, 0,
                                    -0.2, 0.2, 0.1, 0.4, 0,
                                    0.6, 0, -0.5, 1, 0
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

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
                                1, 0, 0, 0, 0,
                                0, 1, 0.2, 0, 0,
                                0, 0, 1, 0, 0,
                                -0.8, 1.3, 0, 1, 0
                              ]),

                              child: GestureDetector(
                                onTap: () {
                                  _onButtonPressed(const ColorFilter.matrix([
                                    1, 0, 0, 0, 0,
                                    0, 1, 0.2, 0, 0,
                                    0, 0, 1, 0, 0,
                                    -0.8, 1.3, 0, 1, 0
                                  ]));
                                },
                                child: Container(

                                    height: 20,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0x33A6A6A6)),
                                      image: DecorationImage(image: Image
                                          .file(File(widget.name))
                                          .image, fit: BoxFit.cover

                                      ),

                                    )
                                ),
                              ),
                            ),


                          ]

                      )
                  ),
                ),
              ),


              //option raw

              Visibility(
                visible: optionTag,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 8, bottom: 0),
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 8, bottom: 4),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                _onButtonPressed(const ColorFilter.matrix([
                                  1, 0, 0, 0, 0,
                                  0, 1, 0, 0, 0,
                                  0, 0, 1, 0, 0,
                                  0, 0, 0, 1, 0,
                                ]));

                                _signaturePadKey.currentState?.clear();


                                setState(() {
                                  mycolor = Colors.transparent;
                                  mDraw = false;
                                  newWid = false;
                                  oldWid = true;
                                });

                              },
                              child: Column(
                                children: const <Widget>[
                                  Image(
                                    alignment: Alignment.center,
                                    image:
                                    AssetImage('assets/picture_icon.png'),
                                    height: 15,
                                    width: 15,
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, top: 6, bottom: 0),
                                    child: Material(color: Colors.transparent,
                                        child: Text("Original",
                                            style: TextStyle(fontSize: 12,
                                              fontFamily: 'poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,))),
                                  ),

                                ],
                              ),
                            ),


                            GestureDetector(
                              onTap: () {
                                _onOPPressed(true);
                                _onEFPressed(false);
                                setState(() {
                                  newWid = false;
                                  oldWid = true;
                                });
                              },
                              child: Column(
                                children: const <Widget>[

                                  Image(
                                    alignment: Alignment.center,
                                    image:
                                    AssetImage('assets/painting_icon.png'),
                                    height: 15,
                                    width: 15,
                                  ),


                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 0, right: 0, top: 6, bottom: 0),
                                    child: Material(color: Colors.transparent,
                                        child: Text("Art/Canvas",
                                            style: TextStyle(fontSize: 12,
                                              fontFamily: 'poppins',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,))),
                                  ),

                                ],
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  newWid = false;
                                  oldWid = true;
                                });

                                _onButtonPressed(const ColorFilter.matrix([
                                  1.3, -0.3, 1.1, 0, 0,
                                  0, 1.3, 0.2, 0, 0,
                                  0, 0, 0.8, 0.2, 0,
                                  2.5, -3.9, -1.1, 1, -3,
                                ]));
                              },
                              child: Column(
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
                                        left: 0, right: 0, top: 6, bottom: 0),
                                    child: Material(color: Colors.transparent,
                                        child: Text("Cartoon", style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'poppins',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,))),
                                  ),

                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0),
                              child: GestureDetector(
                                onTap: () {

                                  setState(() {
                                    newWid = true;
                                    oldWid = false;
                                  });
                                },
                                child: Column(
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
                                          left: 0, right: 0, top: 6, bottom: 0),
                                      child: Material(color: Colors.transparent,
                                          child: Text("Line Drawing",
                                              style: TextStyle(fontSize: 12,
                                                fontFamily: 'poppins',
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,))),
                                    ),

                                  ],
                                ),
                              ),
                            ),


                          ]
                      ),
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

              Visibility(
                visible: optionTag,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          child: TextButton.icon(
                            icon: Image.asset("assets/close_24px.png"),
                            // Your icon here
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                            label: const Text(''),
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
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          child: TextButton.icon(

                            icon: Image.asset("assets/check_24px.png"),
                            // Your icon here
                            onPressed: () async {

                              print("thisindex=$tIndex");

                              context.loaderOverlay.show();


                              screenshotController.capture().then((image) {
                                //Capture Done
                                setState(() {
                                  widgetToImageFile(image!);
                                });
                              }).catchError((onError) {
                                print(onError);
                              });
                            },
                            label: const Text(''),
                          ),


                        ),

                      ],

                    ),
                  ],
                ),
              ),
            ],

          ),
        ),
      ),

    );

  }


  Future<void> widgetToImageFile(Uint8List capturedImage,) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final ts = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    String path = '$tempPath/$ts.png';
    customFile = await File(path).writeAsBytes(capturedImage);
    context.loaderOverlay.hide();

    if (!mounted) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ShirtEdit(name: path,name2:tIndex)));
  }


  Future <List<Data>> fetchData() async {
    final response =
    await http.get(
        Uri.parse('https://itflyweb.com/ossum/admin/categoriesapi.php'));
    if (response.statusCode == 200) {

      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((data) => Data.fromJson(data)).toList();

    } else {
      throw Exception('Unexpected error occurred!');
    }
  }



}
class Data {
  final String catId;
  final String catImage;
  final String catTitle;

  Data({required this.catId, required this.catImage, required this.catTitle});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      catId: json['p_cat_id'],
      catImage: json['p_cat_image'],
      catTitle: json['p_cat_title'],
    );
  }
}

