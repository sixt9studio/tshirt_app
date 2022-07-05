import 'package:flutter/material.dart';

import 'Login.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          color: Colors.white
      ),

      child: SafeArea(
        child: Column(
          children: [

            Container(
              height: 40,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [

                  Image(
                    alignment: Alignment.center,
                    image:
                    AssetImage('assets/arrow_back.png'),
                    height: 20,
                    width: 30,
                  ),

                  Material(color: Colors.transparent,child: Text("My Account",
                      style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                        color: Colors.black,fontWeight: FontWeight.w500,))),

                  Visibility(
                    visible: false,
                    child: Image(
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



            Row(
              children: [
                const SizedBox(width: 8),
                Column(
                  children:  <Widget>[

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
                      radius: 60,
                      backgroundImage: ExactAssetImage(
                          'assets/userlogo.png'),
                    ),
                  ),



                ),
                     Container(
                      transform: Matrix4.translationValues(0, -15, 0.0),
                      child: const Material(color: Colors.transparent,child: Text("Upload",
                          style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                            color: Colors.black,fontWeight: FontWeight.w500,))),
                    ),




                  ],
                ),

               const SizedBox(
                 width: 30,
               ),

               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                     Material(color: Colors.transparent,child: Text("Jhon Deo",
                       style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                         color: HexColor.fromHex('#EB7E26'),fontWeight: FontWeight.w500,))),

                    Row(
                      children: const [

                        Image(
                          alignment: Alignment.center,
                          image:
                          AssetImage('assets/mail_outline_24px.png'),
                          height: 24,
                          width: 24,
                        ),

                         SizedBox(
                          width: 8,
                        ),

                        Material(color: Colors.transparent,child: Text("Jhondeo@gmail.com",
                           style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                             color: Colors.black,fontWeight: FontWeight.w500,))),


                      ],
                    ),

                   Row(
                     children: const [

                       Image(
                         alignment: Alignment.center,
                         image:
                         AssetImage('assets/call_24px.png'),
                         height: 24,
                         width: 24,
                       ),

                       SizedBox(
                         width: 8,
                       ),

                       Material(color: Colors.transparent,child: Text("+1-987-654-3210",
                           style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                             color: Colors.black,fontWeight: FontWeight.w500,))),


                     ],
                   ),

                 ],
               )

              ],
            ),

            const SizedBox(height: 35,),

            Row(
              children:  [

                const SizedBox(width: 10),

                Material(color: Colors.transparent,child: Text("02",
                    style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                      color: HexColor.fromHex('#EB7E26'),fontWeight: FontWeight.w500,))),

                const SizedBox(width: 20),
                const Material(color: Colors.transparent,child: Text("My Orders",
                    style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                      color: Colors.black,fontWeight: FontWeight.w500,))),
              ],
            ),

            const SizedBox(height: 35,),

            Row(
              children:  const [

                SizedBox(width: 7),


                 Image(
                  alignment: Alignment.center,
                  image:
                  AssetImage('assets/share_24px.png'),
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 20),
                Material(color: Colors.transparent,child: Text("Keep Tell your Friend",
                    style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                      color: Colors.black,fontWeight: FontWeight.w500,))),
              ],
            ),

            const SizedBox(height: 35,),

            Row(
              children:  const [

                SizedBox(width: 7),


                Image(
                  alignment: Alignment.center,
                  image:
                  AssetImage('assets/help_icon_24px.png'),
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 20),
                Material(color: Colors.transparent,child: Text("Help and Support",
                    style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                      color: Colors.black,fontWeight: FontWeight.w500,))),
              ],
            ),


            const SizedBox(height: 35,),

            Row(
              children:  const [

                SizedBox(width: 7),


                Image(
                  alignment: Alignment.center,
                  image:
                  AssetImage('assets/settings_24px.png'),
                  height: 30,
                  width: 30,
                ),
                SizedBox(width: 20),
                Material(color: Colors.transparent,child: Text("Change Password",
                    style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                      color: Colors.black,fontWeight: FontWeight.w500,))),
              ],
            ),

          ],


        ),
      ),



    );
  }
}
