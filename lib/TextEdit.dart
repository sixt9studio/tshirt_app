import 'package:flutter/material.dart';
import 'package:tshirt_app/Login.dart';

class TextEdit extends StatefulWidget {
  const TextEdit({Key? key}) : super(key: key);

  @override
  State<TextEdit> createState() => _TextEditState();
}

class _TextEditState extends State<TextEdit> {
  String mText = "";
 String textStyle =  'Poppins';


  onButtonPressed(String value) {
    setState(() {mText = value; });
  }
  onButtonPressed2(String value2) {
    setState(() {textStyle = value2; });
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

        child: Stack(
        children:  <Widget>[
        const Image(
          height: double.infinity,
        alignment: Alignment.center,
          image:
          AssetImage('assets/tshirt.png'),
          fit: BoxFit.fill,
        ),
          Align(
            alignment: Alignment.center,
            child:  Padding(
              padding: const EdgeInsets.only(
                  left: 90, right: 90, top: 20,bottom: 4),
              child: Material(
                color: Colors.transparent,
                child: Text(mText,textAlign: TextAlign.start, style:  TextStyle(fontSize: 30,fontFamily: textStyle,
                  color: Colors.white,fontWeight: FontWeight.w900,)),
              ),
            ),
          ),

        ]
        )



            ),


            Row(
              children: const [

                // const Align(
                //   alignment: Alignment.centerLeft,
                //   child:  Padding(
                //     padding: EdgeInsets.only(
                //         left: 8, right: 0, top: 8,bottom: 4),
                //     child: Material(
                //       color: Colors.transparent,
                //       child: Text("Shirt Color",textAlign: TextAlign.start, style: TextStyle(fontSize: 14,fontFamily: 'poppins',
                //         color: Colors.black,fontWeight: FontWeight.w600,)),
                //     ),
                //   ),
                // ),

                // Row(
                //   children: [
                //     const SizedBox(width: 8),
                //     ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           side: const BorderSide(width: 1.0, color: Colors.grey,),
                //           primary: Colors.white, // background
                //           elevation: 0,
                //           // onPrimary: Colors.white, // foreground
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(2),
                //           )
                //       ),
                //
                //       onPressed: () { },
                //       child: const Text('   Front   ',style: TextStyle(color: Colors.black)),
                //     ),
                //
                //     const SizedBox(width: 8),
                //
                //     ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           side: const BorderSide(width: 1.0, color: Colors.grey,),
                //           primary: Colors.white, // background
                //           elevation: 0,
                //           // onPrimary: Colors.white, // foreground
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(2),
                //
                //           )
                //       ),
                //
                //       onPressed: () { },
                //       child: const Text('   Back   ',style: TextStyle(color: Colors.black)),
                //     ),
                //   ],
                // )



              ],
            ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [

                    Image(
                      alignment: Alignment.center,
                      image:
                      AssetImage('assets/delete_sweep_24px.png'),
                      height: 20,
                      width: 30,
                    ),

                 Material(color: Colors.transparent,child: Text("Edit Text",
                        style: TextStyle(fontSize: 14,fontFamily: 'poppins',
                          color: Colors.black,fontWeight: FontWeight.w500,))),

                    Image(
                      alignment: Alignment.center,
                      image:
                      AssetImage('assets/close_24px.png'),
                      height: 20,
                      width: 30,
                    ),
                  ],
                ),
              ),


            Padding(
              padding: const EdgeInsets.fromLTRB(12, 2, 12,2),
              child: Material(
                child: TextField(
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
                    hintText: "DO NOT DISTURB!",
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
                        Column(
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
                        GestureDetector(
                          onTap: (){
                            onButtonPressed2('Raleway');
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
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/icon_bright.png'),
                              height: 20,
                              width: 20,
                            ),


                          ],
                        ),

                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/icon_flip.png'),
                              height: 20,
                              width: 20,
                            ),


                          ],
                        ),


                        Column(
                          children: const <Widget>[
                            Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/icon_resize.png'),
                              height: 20,
                              width: 20,
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
                    MaterialPageRoute(builder: (context) => const MyLogin()));
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
    );



  }
}