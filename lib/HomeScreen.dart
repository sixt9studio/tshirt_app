import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tshirt_app/MyAcount.dart';
import 'package:tshirt_app/PhotoEdit.dart';
import 'Login.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);


  @override
  State<MyHome> createState() => _MyHomeState();

}

class _MyHomeState extends State<MyHome> {



  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: SafeArea(

        child: Container(
          color: HexColor.fromHex('#3B1604'),
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white),


              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: <Widget>[

                  Container(
                    transform: Matrix4.translationValues(0, 10, 0,),
                    decoration: const BoxDecoration(
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Image(
                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/arrow_back.png'),
                              height: 24,
                              width: 24,
                            ),
                            Container(
                              width: 80,
                              decoration: BoxDecoration(

                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white10,
                                  width: 1,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  const MyProfile()));
                                },
                                child: const CircleAvatar(
                                  radius: 25,
                                  backgroundImage: ExactAssetImage(
                                      'assets/userlogo.png'),
                                ),
                              ),

                            ),
                          ]

                      ),
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white),
                    transform: Matrix4.translationValues(0, 10, 0.0),
                    child: const Image(
                      alignment: Alignment.center,
                      image:
                      AssetImage('assets/home_logo.png'),
                      height: 300,
                      width: 400,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 25.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          height: 45.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, top: 40.0),
                          child: Container(
                            color: HexColor.fromHex('#3B1604'),
                            height: 45.0,


                          ),


                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 8),

                          child: GestureDetector(
                           onTap: () => _getFromGallery(),
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const PhotoEdit()),);


                            child: const Image(

                              alignment: Alignment.center,
                              image:
                              AssetImage('assets/slt_gallery.png'),
                              height: 70,


                            ),
                          ),
                        ),
                      ],

                    ),
                  ),


                  Container(
                    color: HexColor.fromHex('#3B1604'),
                    child: Column(

                      children:  <Widget>[

                        const Padding(

                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 8, bottom: 8),
                          child: Image(
                            alignment: Alignment.center,
                            image:
                            AssetImage('assets/or_home.png'),
                            height: 50,
                          ),
                        ),


                        GestureDetector(
                          onTap: () => _getFromCamera(),
                          child: const Image(
                            alignment: Alignment.center,
                            image:
                            AssetImage('assets/bt_usecam.png'),
                            height: 50,
                          ),
                        ),




                      ],
                    ),


                  ),

                ],
              ),
            ),
          ),
        ),


      ),
    );
 }










  _getFromGallery() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return;
    _openPage(pickedFile.path.toString());

  }
  void _openPage(String path) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PhotoEdit(name: path)));
  }

  _getFromCamera() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile == null) return;
    _openPage(pickedFile.path.toString());

  }
  }










