import 'package:flutter/material.dart';
import 'Login.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          color: Colors.white
      ),

      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 400,
                width: double.infinity,
                child:  Image(
            alignment: Alignment.center,
            image:
            AssetImage('assets/tshirt.png'),
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
                        child: Material(color: Colors.transparent,child: Text("Men's Black Paradise 2022 Graphic Printed T-shirt",
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
                        child: Material(color: Colors.transparent,child: Text("PRODUCT DESCRIPTION",
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
                        child: Material(color: Colors.transparent,child: Text("\$12.99",
                            style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                                color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                        )
                        ),
                      ),


                      Align(
                        alignment: Alignment.centerLeft,
                        child: Material(color: Colors.transparent,child: Text("You Save 39%",
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
                          child: Material(color: Colors.transparent,child: Text("Regular fit - Fitted at Chest and Straight on Waist Down"+
                             " Single Jersey, 100% Cotton Classic, lightweight jersey fabric comprising 100% cotton.",
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
                                    style: TextStyle(fontSize: 22,fontFamily: 'poppins',
                                        color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                                ),
                                ),


                              Row(
                                children: <Widget>[
                                  SizedBox(

                                    width: 40,

                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shape: const CircleBorder(),

                                      ),
                                      child: const Text('-',style: TextStyle(fontSize: 18,
                                          fontWeight: FontWeight.w700,color: Colors.black),),
                                    ),
                                  ),

                                const  SizedBox(width: 3),

                                  Material(color: Colors.transparent,child: Text("01",
                                      style: TextStyle(fontSize: 25,fontFamily: 'poppins',
                                          color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                                  ),
                                  ),

                                  SizedBox(

                                    width: 40,

                                    child: ElevatedButton(
                                      onPressed: () {},
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
                                  style: TextStyle(fontSize: 22,fontFamily: 'poppins',
                                      color: HexColor.fromHex('#3B1604'),fontWeight: FontWeight.w700)
                              ),
                              ),

                            const  SizedBox(height: 8,),

                              Row(
                             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const <Widget>[

                                  SizedBox(width: 40,),
                                  Image(
                                      alignment: Alignment.center,
                                      image:
                                      AssetImage('assets/bt_xs.png'),
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.cover
                                  ),

                                   SizedBox(
                                    width: 5,
                                  ),
                                  Image(
                                      alignment: Alignment.center,
                                      image:
                                      AssetImage('assets/bt_s.png'),
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.cover
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image(
                                      alignment: Alignment.center,
                                      image:
                                      AssetImage('assets/bt_m.png'),
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.cover
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image(
                                      alignment: Alignment.center,
                                      image:
                                      AssetImage('assets/bt_l.png'),
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.cover
                                  ),

                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image(
                                      alignment: Alignment.center,
                                      image:
                                      AssetImage('assets/bt_xl.png'),
                                      height: 35,
                                      width: 35,
                                      fit: BoxFit.cover
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

    );
  }
}
