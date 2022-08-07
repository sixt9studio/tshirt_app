import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tshirt_app/CheckLogin.dart';
import 'dart:async';

import 'Login.dart';





class TextEdit extends StatefulWidget {
  const TextEdit({Key? key,  required this.name,}) : super(key: key);
  final String name;


  @override
  State<TextEdit> createState() => _TextEditState();
}

class _TextEditState extends State<TextEdit> {
  late final GoogleSignIn googleSignIn;
  String mText = "";
 String textFont =  'Lato';
 double textSize = 20;
  int index = 0;
  final TextEditingController _controller = TextEditingController();
  Color mycolor = Colors.white;
  bool tvSugg = false;

  var kamiz=['Chewy','Lobster','Lato','Tapestry','Itim','VastShadow','FingerPaint','NovaSquare'];

  
  onButtonPressed(String value) {
    setState(() {mText = value; });
  }
  onButtonPressed2(String tFont) {
    setState(() {textFont = tFont; });
  }

  onTextSize(double tSize) {

    setState(() {textSize = tSize; });
  }

  Offset offset = Offset.zero;

  ScreenshotController screenshotController = ScreenshotController();
  late File customFile;

  @override
  void initState() {
    _controller.addListener((){
      //use setState to rebuild the widget
      if(_controller.text!=''){
        setState(() {
        tvSugg =true;
        });
      }else{
        setState(() {
          tvSugg =false;
        });
      }

    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration:  const BoxDecoration(
            color: Colors.white
        ),

        child: SafeArea(
          child: LoaderOverlay(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Expanded(

                child: Screenshot(
              controller: screenshotController,
              child: Stack(
              children:  <Widget>[

                  SizedBox(
                  child: Image.file(File(widget.name),
                    alignment: Alignment.center,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,

                  ),
                ),

                Visibility(
                  visible: tvSugg,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                   child: Wrap(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child:   Align(
                                    alignment: Alignment.center,
                                    child:  Material(color: Colors.transparent,child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          onButtonPressed("${_controller.text}‘s Dad");

                                        },
                                        child: Text("${_controller.text}‘s Dad",textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                              color: HexColor.fromHex('#FFFFFF'),fontWeight: FontWeight.w400,)),
                                      ),
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child:   Align(
                                    alignment: Alignment.center,
                                    child:  Material(color: Colors.transparent,child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          onButtonPressed("${_controller.text}‘s Mom");

                                        },
                                        child: Text("${_controller.text}‘s Mom",textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                              color: HexColor.fromHex('#FFFFFF'),fontWeight: FontWeight.w400,)),
                                      ),
                                    )),
                                  ),
                                ),

                                const SizedBox(
                                  width: 8,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child:   Align(
                                    alignment: Alignment.center,
                                    child:  Material(color: Colors.transparent,child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          onButtonPressed("${_controller.text}‘s Human");

                                        },
                                        child: Text("${_controller.text}‘s Human",textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                              color: HexColor.fromHex('#FFFFFF'),fontWeight: FontWeight.w400,)),
                                      ),
                                    )),
                                  ),
                                ),

                                const SizedBox(
                                  width: 8,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child:   Align(
                                    alignment: Alignment.center,
                                    child:  Material(color: Colors.transparent,child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          onButtonPressed("${_controller.text}‘s Brother");

                                        },
                                        child: Text("${_controller.text}‘s Brother",textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                              color: HexColor.fromHex('#FFFFFF'),fontWeight: FontWeight.w400,)),
                                      ),
                                    )),
                                  ),
                                ),

                                const SizedBox(
                                  width: 8,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child:   Align(
                                    alignment: Alignment.center,
                                    child:  Material(color: Colors.transparent,child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          onButtonPressed("${_controller.text}‘s Sister");

                                        },
                                        child: Text("${_controller.text}‘s Sister",textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                              color: HexColor.fromHex('#FFFFFF'),fontWeight: FontWeight.w400,)),
                                      ),
                                    )),
                                  ),
                                ),


                                const SizedBox(
                                  width: 8,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child:   Align(
                                    alignment: Alignment.center,
                                    child:  Material(color: Colors.transparent,child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          onButtonPressed('My Pal ${_controller.text}');


                                        },
                                        child: Text('My Pal ${_controller.text}',textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                              color: HexColor.fromHex('#FFFFFF'),fontWeight: FontWeight.w400,)),
                                      ),
                                    )),
                                  ),
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade600,
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child:   Align(
                                    alignment: Alignment.center,
                                    child:  Material(color: Colors.transparent,child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: (){
                                          onButtonPressed('My Buddy ${_controller.text}');


                                        },
                                        child: Text('My Buddy ${_controller.text}',textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                              color: HexColor.fromHex('#FFFFFF'),fontWeight: FontWeight.w400,)),
                                      ),
                                    )),
                                  ),
                                ),


                              ],
                            ),
                          ),

                        ])

                  ),
                ),


                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 100, right:100, top:0,bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 130,
                        width: 160,
                        child: Material(
                          color: Colors.transparent,
                          child: Text
                            (mText,textAlign: TextAlign.center, style: TextStyle(fontSize: textSize,fontFamily: textFont,
                            color: mycolor,fontWeight: FontWeight.w700,)),


                        ),
                      ),
                    ),
                  ),
                ),

              ]
              ),
            )

                ),


                Row(
                  children: const [


                  ],
                ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [

                        GestureDetector(
                          onTap: (){
                            setState(() {
                              textFont='Lato';
                              mycolor = Colors.white;
                              _controller.clear();

                            });

                            onButtonPressed("");

                          },

                          child: const Image(
                            alignment: Alignment.center,
                            image:
                            AssetImage('assets/delete_sweep_24px.png'),
                            height: 20,
                            width: 30,
                          ),
                        ),

                     const Material(color: Colors.transparent,child: Text("Edit Text",
                            style: TextStyle(fontSize: 14,fontFamily: 'Poppins',
                              color: Colors.black,fontWeight: FontWeight.w500,))),

                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context, false);
                          },

                          child: const Image(
                            alignment: Alignment.center,
                            image:
                            AssetImage('assets/close_24px.png'),
                            height: 20,
                            width: 30,
                          ),
                        ),

                      ],
                    ),
                  ),


                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 2, 12,2),
                  child: Material(
                    child: TextField(
                      controller: _controller,
                      maxLength: 25,
                      onChanged: (text) {
                       onButtonPressed(text);
                      },
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'poppins'
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your dog’s name",
                        contentPadding:  const EdgeInsets.fromLTRB(32, 16, 32, 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
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
                            GestureDetector(
                              onTap: () {

                                Clipboard.getData(Clipboard.kTextPlain).then((value){
                                  String? tt = value?.text;
                                  _controller.text = tt! ; //value is clipbarod data
                                  setState(() {
                                   mText=tt;
                                  });
                                });

                              },
                              child: Column(
                                children: const <Widget>[
                                  Image(
                                    alignment: Alignment.center,
                                    image:
                                    AssetImage('assets/icon_copy.png'),
                                    height: 20,
                                    width: 20,
                                  ),


                                ],
                              ),
                            ),
                            GestureDetector(

                              onTap: (){

                                setState(() {
                                  if (index == 6) {
                                    index = 0;
                                  }
                                });

                                String next = kamiz[index++];
                                onButtonPressed2(next);





                              },
                              child: Column(
                                children: const <Widget>[
                                  Image(
                                    alignment: Alignment.center,
                                    image:
                                    AssetImage('assets/icon_font.png'),
                                    height: 20,
                                    width: 20,
                                  ),


                                ],
                              ),
                            ),

                            Column(
                              children:  <Widget>[
                                GestureDetector(
                                  onTap: (){

                                    // color Picker Dialog
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return AlertDialog(
                                            title: const Text('Pick a color!'),
                                            content: SingleChildScrollView(
                                              child: BlockPicker(
                                                pickerColor: mycolor, //default color
                                                onColorChanged: (Color color){ //on color picked
                                                  setState(() {
                                                    mycolor = color;
                                                  });
                                                },
                                              ),
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                child: const Text('DONE'),
                                                onPressed: () {

                                                  Navigator.of(context).pop(); //dismiss the color picker
                                                },
                                              ),
                                            ],
                                          );
                                        }
                                    );





                                  },
                                  child: const Image(
                                    alignment: Alignment.center,
                                    image:
                                    AssetImage('assets/icon_bright.png'),
                                    height: 20,
                                    width: 20,
                                  ),
                                ),


                              ],
                            ),

                            Column(
                              children:  <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    if(textSize<30){
                                      onTextSize(textSize+1);
                                    }
                                  },
                                  child: const Image(
                                    alignment: Alignment.center,
                                    image:
                                    AssetImage('assets/icon_flip.png'),
                                    height: 20,
                                    width: 20,
                                  ),
                                ),


                              ],
                            ),


                            Column(
                              children:  <Widget>[
                                GestureDetector(
                                  onTap: (){

                                    if(textSize>20){
                                      onTextSize(textSize-1);
                                    }

                                  },
                                  child: const Image(
                                    alignment: Alignment.center,
                                    image:
                                    AssetImage('assets/icon_resize.png'),
                                    height: 20,
                                    width: 20,
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
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const MyLogin()));

                    setState(() {
                      tvSugg =false;
                    });

                    context.loaderOverlay.show();
                    screenshotController.capture().then(( image) {
                      //Capture Done
                      setState(() async {
                        final prefs = await SharedPreferences.getInstance();
                        widgetToImageFile(image!,prefs);

                      });

                    }).catchError((onError) {

                    });
                  },
                  child: const Image(
                    alignment: Alignment.center,
                    image:
                    AssetImage('assets/bt_ordernow.png'),
                    //  height: 70,
                    width: double.infinity,
                  ),
                ),

              ],

            ),
          ),
        ),
      );



  }

  Future<void> widgetToImageFile(
      Uint8List capturedImage, SharedPreferences prefs,
      ) async {
    // await FirebaseAuth.instance.signOut();
    // await GoogleSignIn().signOut();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    String path = '$tempPath/$ts.png';
    customFile = await File(path).writeAsBytes(capturedImage);
    context.loaderOverlay.hide();

    if (!mounted) return;
     prefs.setString('customFile', path);

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const CheckLogin())); //TextEdit(name: path)
  }


}

