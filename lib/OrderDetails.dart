import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tshirt_app/uploadTestApi.dart';
import 'Login.dart';
import 'TextEdit.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);



  @override
  State<OrderDetail> createState() => _OrderDetailState();
}



class _OrderDetailState extends State<OrderDetail> {

  late String mTitle='title';
  late String mDesc='';
  late String mPrice='';
  late String mDiscount='';
  late String customFile ='';
  late String mSize ='XS';
  late   int _counter = 1;
  late String fixPrice='';

  Color colorXS = Colors.red;
  Color colorS = Colors.transparent;
  Color colorM = Colors.transparent;
  Color colorL = Colors.transparent;
  Color colorXL = Colors.transparent;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadShared();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async { pageBack();
        return false;},
      child: Container(
        decoration:  const BoxDecoration(
            color: Colors.white
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                 SizedBox(
                  height: 400,
                  width: double.infinity,
                  child:   Image.file(File(customFile),
                    fit: BoxFit.fill,
            ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),

                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),


                  child: Container(
                    transform: Matrix4.translationValues(8.0, 40.0, 8.0),

                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children:  <Widget>[
                        Align(

                          alignment: Alignment.centerLeft,
                          child: Material(color: Colors.transparent,child: Text(mTitle,
                          style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                          color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                          )
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(color: Colors.transparent,child: Text('PRODUCT DESCRIPTION',
                              style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                  color: HexColor.fromHex('#EB7E26'),fontWeight: FontWeight.w700)
                          )
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(color: Colors.transparent,child: Text("\$$mPrice",
                              style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                                  color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                          )
                          ),
                        ),


                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(color: Colors.transparent,child: Text("You Save $mDiscount%",
                              style: TextStyle(fontSize: 13,fontFamily: 'poppins',
                                  color: HexColor.fromHex('#5A627D'),fontWeight: FontWeight.w500)
                          )
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 8),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Material(color: Colors.transparent,child: Text(mDesc,
                                style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                    color: HexColor.fromHex('#5A627D'),fontWeight: FontWeight.w500)
                            ),
                            ),
                          ),
                        ),


                        const SizedBox(
                          height:15,
                        ),

                        Row(
                          children: [
                            Column(
                              children: <Widget>[


                                Material(color: Colors.transparent,child: Text("QYT:        ",
                                      style: TextStyle(fontSize: 18,fontFamily: 'poppins',
                                          color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                                  ),
                                  ),


                                Row(
                                  children: <Widget>[
                                    SizedBox(

                                      width: 40,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          if(_counter!=1){
                                            setState(() { _counter--;
                                            int tPrice = int.parse(fixPrice);
                                            int nPrice = tPrice*_counter;
                                            mPrice = nPrice.toString();
                                            });
                                          }

                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,
                                          shape: const CircleBorder(),

                                        ),
                                        child: const Text('-',style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.w700,color: Colors.black),),
                                      ),
                                    ),

                                  const  SizedBox(width: 3),

                                    Material(color: Colors.transparent,child: Text(_counter.toString(),
                                        style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                                            color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                                    ),
                                    ),

                                    SizedBox(
                                      width: 40,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if(_counter!=99){
                                            setState(() { _counter++;
                                            int tPrice = int.parse(fixPrice);
                                           int nPrice = tPrice*_counter;
                                            mPrice = nPrice.toString();
                                            });
                                          }
                                          },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.white,

                                          shape: const CircleBorder(
                                          ),

                                        ),
                                        child: const Text('+',style: TextStyle(fontSize: 18,
                                            fontWeight: FontWeight.w700,color: Colors.black),),
                                      ),
                                    ),

                                  ],
                                ),

                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Material(color: Colors.transparent,child: Text("SIZE:               ",
                                    style: TextStyle(fontSize: 18,fontFamily: 'poppins',
                                        color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                                ),
                                ),

                              const  SizedBox(height: 8,),

                                Row(
                               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  <Widget>[

                                    const SizedBox(width: 30,),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                                        border: Border.all(
                                          color: colorXS,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                           colorXS = Colors.red;
                                           colorS = Colors.transparent;
                                           colorM = Colors.transparent;
                                           colorL = Colors.transparent;
                                           colorXL = Colors.transparent;
                                           mSize = 'XS';
                                          });
                                        },
                                        child: const Image(
                                            alignment: Alignment.center,
                                            image:
                                            AssetImage('assets/bt_xs.png'),
                                            height: 35,
                                            width: 35,
                                            fit: BoxFit.cover,

                                        ),
                                      ),
                                    ),

                                     const SizedBox(
                                      width: 5,
                                    ),

                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                                        border: Border.all(
                                          color: colorS,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            colorXS = Colors.transparent;
                                            colorS = Colors.red;
                                            colorM = Colors.transparent;
                                            colorL = Colors.transparent;
                                            colorXL = Colors.transparent;
                                            mSize = 'S';
                                          });
                                        },
                                        child: const Image(
                                          alignment: Alignment.center,
                                          image:
                                          AssetImage('assets/bt_s.png'),
                                          height: 35,
                                          width: 35,
                                          fit: BoxFit.cover,


                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      width: 5,
                                    ),

                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                                        border: Border.all(
                                          color: colorM,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            colorXS = Colors.transparent;
                                            colorS = Colors.transparent;
                                            colorM = Colors.red;
                                            colorL = Colors.transparent;
                                            colorXL = Colors.transparent;
                                            mSize = 'M';
                                          });
                                        },
                                        child: const Image(
                                          alignment: Alignment.center,
                                          image:
                                          AssetImage('assets/bt_m.png'),
                                          height: 35,
                                          width: 35,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),


                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                                        border: Border.all(
                                          color: colorL,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            colorXS = Colors.transparent;
                                            colorS = Colors.transparent;
                                            colorM = Colors.transparent;
                                            colorL = Colors.red;
                                            colorXL = Colors.transparent;
                                            mSize = 'L';
                                          });
                                        },
                                        child: const Image(
                                          alignment: Alignment.center,
                                          image:
                                          AssetImage('assets/bt_l.png'),
                                          height: 35,
                                          width: 35,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),


                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all( Radius.circular(50.0)),
                                        border: Border.all(
                                          color: colorXL,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            colorXS = Colors.transparent;
                                            colorS = Colors.transparent;
                                            colorM = Colors.transparent;
                                            colorL = Colors.transparent;
                                            colorXL = Colors.red;
                                            mSize = 'XL';
                                          });
                                        },
                                        child: const Image(
                                          alignment: Alignment.center,
                                          image:
                                          AssetImage('assets/bt_xl.png'),
                                          height: 35,
                                          width: 35,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),

                          ],
                        ),

                       const  SizedBox(height: 20,),


                         Align(
                           alignment: Alignment.centerLeft,
                           child: Material(color: Colors.transparent,child: Text("Enter Your Details:",
                              style: TextStyle(fontSize: 20,fontFamily: 'poppins',
                                color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700,))),
                         ),

                        const  SizedBox(height: 20,),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(color: Colors.transparent,child: Text("Your Name*",
                              style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700,))),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 15,2),
                          child: Material(
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins'
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Enter Here",
                                contentPadding:  const EdgeInsets.fromLTRB(8, 16, 32, 16),
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),



                        const  SizedBox(height: 8,),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(color: Colors.transparent,child: Text("Phone Number*",
                              style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700,))),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 15,2),
                          child: Material(
                            child: TextField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins'
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Enter Here",
                                contentPadding:  const EdgeInsets.fromLTRB(8, 16, 32, 16),
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ),


                        const  SizedBox(height: 8,),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(color: Colors.transparent,child: Text("Email Address*",
                              style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700,))),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 15,2),
                          child: Material(
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins'
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Enter Here",
                                contentPadding:  const EdgeInsets.fromLTRB(8, 16, 32, 16),
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),

                                ),
                              ),
                            ),
                          ),
                        ),

                        const  SizedBox(height: 8,),

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(color: Colors.transparent,child: Text("Shipping Address*",
                              style: TextStyle(fontSize: 15,fontFamily: 'poppins',
                                color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700,))),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 15,2),
                          child: Material(
                            child: TextField(
                              controller: addressController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'poppins'
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Enter Here",
                                isDense: true,
                                contentPadding:  const EdgeInsets.fromLTRB(8, 40, 40, 16),
                                enabledBorder: const OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(color: Colors.grey, width: 0.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)
                                ),
                              ),
                            ),
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 12, top: 20.0, bottom: 10),

                            child: GestureDetector(
                              onTap: (){
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(builder: (context) =>  const PhotoEdit(name: '',)));

                                testNext(customFile);
                              },
                              child: const Image(
                                alignment: Alignment.center,
                                image:
                                AssetImage('assets/bt_shopnow.png'),
                                height: 120,
                              ),
                            ),
                          ),



                      ],
                    ),


                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }


  void _loadShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mTitle = (prefs.getString('mTitle'))?? '';
      mDesc = (prefs.getString('mDesc'))?? '';
      mPrice = (prefs.getString('mPrice'))?? '';
      fixPrice = (prefs.getString('mPrice'))?? '';
      mDiscount = (prefs.getString('mDiscount'))?? '';
      customFile = (prefs.getString('customFile'))?? '';

    });

  }

  void pageBack() {
    // Route route = MaterialPageRoute(builder: (context) => TextEdit(name: customFile));
    // Navigator.pushReplacement(context, route);


    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  TextEdit(name: customFile)));


  }

  Future<void> testNext(String customFile) async {

    String mName = nameController.text;
    String mPhone = phoneController.text;
    String mEmail = emailController.text;
    String mAdd = addressController.text;

    if(mName == '' || mPhone == '' || mEmail == '' || mAdd == ''){
      Fluttertoast.showToast(
          msg: "Please Enter Valid Details.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          timeInSecForIosWeb: 1,
          fontSize: 16.0
      );
    }else{

      final prefs = await  SharedPreferences.getInstance();
      prefs.setString('Quantity',_counter.toString());
      prefs.setString('Size',mSize);
      prefs.setString('oName',mName);
      prefs.setString('oPhone',mPhone);
      prefs.setString('oEmail',mEmail);
      prefs.setString('oAddress',mAdd);

      if (!mounted) return;


      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  UploadTest(name: customFile,)));
    }
    }



}
