import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tshirt_app/MyAcount.dart';
import 'package:tshirt_app/PhotoEdit.dart';
import 'PLogin.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);


  @override
  State<MyHome> createState() => _MyHomeState();

}

class _MyHomeState extends State<MyHome> {

  String imgUrl = 'https://cdn-icons-png.flaticon.com/512/147/147140.png';

  String proPhoto = "";
  bool localImage = false;
  bool netImage = true;

  @override
  void initState() {
    super.initState();
    fetchLogin();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {closeApp()(context);
      return true;},
      child: Container(
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

                    Visibility(
                      visible: netImage,
                      child: Container(
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
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(builder: (context) =>  const MyProfile()));

                                      FirebaseAuth.instance
                                          .authStateChanges()
                                          .listen((User? user) {
                                        if (user != null) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  const MyProfile()));
                                        }else{
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  const PLogin()));

                                        }
                                      });

                                    },
                                    child:  CircleAvatar(
                                      radius: 25,
                                      backgroundImage:  NetworkImage(imgUrl),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),

                                ),
                              ]

                          ),
                        ),
                      ),
                    ),


                    //LocalImage

                    Visibility(
                      visible: localImage,
                      child: Container(
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
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(builder: (context) =>  const MyProfile()));

                                      FirebaseAuth.instance
                                          .authStateChanges()
                                          .listen((User? user) {
                                        if (user != null) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  const MyProfile()));
                                        }else{
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  const PLogin()));

                                        }
                                      });

                                    },
                                    child:  CircleAvatar(
                                      radius: 25,
                                      backgroundImage: FileImage(File(proPhoto)),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),

                                ),
                              ]

                          ),
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
      ),
    );
 }










  _getFromGallery() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return;

    final prefs = await  SharedPreferences.getInstance();
    prefs.setString('OriginalFile', pickedFile.path.toString());

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
    final prefs = await  SharedPreferences.getInstance();
    prefs.setString('OriginalFile', pickedFile.path.toString());
    _openPage(pickedFile.path.toString());

  }

  void fetchLogin() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {

        if(user.providerData[0].providerId=='google.com'){

          setState(() { imgUrl = user.photoURL!;
          localImage=false;netImage=true;
          });

        }else{
          //apicall
          fetchPhoto();
        }
      }else{
        setState(() {  imgUrl = 'https://cdn-icons-png.flaticon.com/512/147/147140.png'; });
        setState(() {
        localImage=false;netImage=true;
        });
      }
    });

  }

  closeApp() {
    if (Platform.isIOS) {
      exit(0);
    } else {
      SystemNavigator.pop();
    }
  }

  Future<void> fetchPhoto() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String uEmail = (prefs.getString('userEmail'))?? '';
    proPhoto = (prefs.getString('${uEmail}Photo'))?? '';

    if(proPhoto==''){
      setState(() {
      localImage=false;netImage=true;
      });
    }else{
      setState(() {
        localImage=true; netImage=false;
      });
    }



  }


}











