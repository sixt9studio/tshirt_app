import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'TextEdit.dart';
import 'dart:convert';
import 'dart:async';


import 'package:http/http.dart' as http;


class ShirtEdit extends StatefulWidget {
  const ShirtEdit({Key? key,  required this.name, required this.name2}) : super(key: key);
  final String name;
  final String name2;


  @override
  State<ShirtEdit> createState() => _ShirtEditState();

}

class _ShirtEditState extends State<ShirtEdit> {
  ScreenshotController screenshotController = ScreenshotController();
  late File customFile;

  late Future <List<Data>>  futureData;
  late Future <List<Data2>> futureData2 ;


  int indX = 0;
  int indXTitle = 0;
 late String categoryID;
 late  String tImage = '';
 late String mTitle;
 late String mDesc;
 late String mPrice;
 late String mDiscount;
  late String catTitle='';
  late String catColor='';
  bool firstTime = true;

  _onUpdate(String url) {
    setState(() {tImage = url; });
  }
  _onCategory(String catID){
    setState((){categoryID = widget.name2;});
  }

  @override
  void initState() {
    super.initState();
    _onCategory(categoryID=widget.name2);
    futureData = fetchData();
    futureData2 = fetchData2(widget.name2);
  }

  @override
  Widget build(BuildContext context) {


    return Container(
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
                  child: Container(
                    decoration:  const BoxDecoration(color: Colors.white),
                    height: 240,
                    child: Stack(
                      children: <Widget>[
                         Center(
                          child: FutureBuilder<List<Data2>>(
                            future: futureData2,
                            builder: (context, snapshot) {

                              if (snapshot.hasData) {
                                return   SizedBox(
                                  height: double.infinity,

                                  child: Image(
                                    alignment: Alignment.center,
                                    image:
                                    NetworkImage(tImage),
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                );

                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              return const CircularProgressIndicator();

                            },

                          ),

                        ),

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 0, top: 92.0),
                            child: Align(
                              alignment: Alignment.center,
                              child:  Image.file(File(widget.name),
                                height: 130,
                                width: 130,
                                fit: BoxFit.fill,
                                alignment: Alignment.center,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ),


       Row(
          children: const [

                  Align(
                    alignment: Alignment.centerLeft,
                    child:  Padding(
                      padding: EdgeInsets.only(
                          left: 8, right: 0, top: 16,bottom: 4),
                      child: Material(
                        color: Colors.transparent,
                        child: Text("Shirt Color",textAlign: TextAlign.start, style: TextStyle(fontSize: 14,fontFamily: 'poppins',
                          color: Colors.black,fontWeight: FontWeight.w600,)),
                      ),
                    ),
                  ),



                ],
              ),

              SizedBox(
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top:4,bottom: 4),
                  child: Center(
                    child: FutureBuilder <List<Data2>>(
                      future: futureData2,
                      builder: (context, snapshot) {

                        if (snapshot.hasData) {
                          List<Data2>? data = snapshot.data;
                           tImage = ('https://itflyweb.com/ossum/product_images/${snapshot.data![indX].pImage}');
                          futureData2 = fetchData2(categoryID);
                          mTitle=data![indX].pTitle;
                          mDesc = data[indX].pDesc;
                          mPrice = data[indX].pPrice;
                          mDiscount = data[indX].pDiscount;
                          catColor = data[indX].pColor;

                          return
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,

                                itemBuilder: (BuildContext context, int index) {
                                  return  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4, top: 0,bottom: 0),
                                    child: GestureDetector(
                                      onTap: () {

                                        updatePc(index,tImage,data,snapshot);

                                        setState(() {
                                          mTitle=data[index].pTitle;
                                          mDesc = data[index].pDesc;
                                          mPrice = data[index].pPrice;
                                          mDiscount = data[index].pDiscount;
                                          catColor = data[index].pColor;
                                        });

                                      },
                                      child: Container(
                                        color: HexColor.fromHex(data[index].pColor),
                                        height: 30,
                                        width: 55,

                                      ),
                                    ),

                                  );

                                }

                            );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default show a loading spinner.
                        return Container();
                      },
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



              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top:8,bottom: 0),
                  child: Center(
                    child: FutureBuilder <List<Data>>(
                      future: futureData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Data>? data = snapshot.data;

                          catTitle = data![indXTitle].catTitle;


                          return
                            ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.length,
                                itemBuilder: (BuildContext context, int index) {

                                  return GestureDetector(
                                    onTap: ()  {
                                      //listitemclick

                                      setState(() { categoryID = data[index].catId;  catTitle = data[index].catTitle; futureData2 = fetchData2(data[index].catId);indXTitle = index; indX=0; });

                                    },

                                    child: Container(
                                      height: 75,
                                      color: Colors.white,
                                      child: Center(  child: Column(
                                        children:  <Widget>[
                                          Image(
                                            alignment: Alignment.center,
                                            image:
                                            NetworkImage('https://itflyweb.com/ossum/other_images/${data[index].catImage}'),
                                            height: 20,
                                            width: 20,

                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8, top: 6,bottom: 0),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: Text(data[index].catTitle,textAlign: TextAlign.center, style: const TextStyle(fontSize: 12,fontFamily: 'poppins',
                                                color: Colors.black,fontWeight: FontWeight.w500,)),
                                            ),
                                          ),

                                        ],
                                      ),
                                      ),),
                                  );

                                }
                            );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
              ),





              GestureDetector(
                onTap: (){
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const TextEdit()));

                  context.loaderOverlay.show();
                  screenshotController.capture().then(( image) {
                    //Capture Done
                    setState(() async {
                      widgetToImageFile(image!);
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('mTitle', mTitle);
                      prefs.setString('mDesc', mDesc);
                      prefs.setString('mPrice', mPrice);
                      prefs.setString('mDiscount', mDiscount);
                      prefs.setString('catTitle', catTitle);
                      prefs.setString('catColor', catColor);
                    });

                  }).catchError((onError) {

                  });

                },
                child: const Image(
                  alignment: Alignment.center,
                  image:
                  AssetImage('assets/bt_edittext.png'),
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
      Uint8List capturedImage,
      ) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    String path = '$tempPath/$ts.png';
    customFile = await File(path).writeAsBytes(capturedImage);
    context.loaderOverlay.hide();

    if (!mounted) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => TextEdit(name: path))); //TextEdit(name: path)

  }



  void updatePc(int index, String tImage, List<Data2>? data, AsyncSnapshot<List<Data2>> snapshot) {

      _onUpdate('https://itflyweb.com/ossum/product_images/${snapshot.data![index].pID}',);
      setState(() { indX=index; });

}
}

Future <List<Data>> fetchData() async {
  final response =
  await http.get(Uri.parse('https://itflyweb.com/ossum/admin/categoriesapi.php'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);

    return jsonResponse.map((data) => Data.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occurred!');
  }
}




Future<List<Data2>> fetchData2(String categoryID) async {
  final response =
  await http.post(Uri.parse('https://itflyweb.com/ossum/admin/productlist.php'),
    body: jsonEncode(<String, String>{
      'p_cat_id': categoryID,
    }),
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Data2.fromJson(data)).toList();
  } else {

    Fluttertoast.showToast(
        msg: "Something Went Wrong.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
   throw ('');


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
class Data2 {
  final String pColor;
  final String pImage;
  final String pID;
  final String pTitle;
  final String pDesc;
  final String pPrice;
  final String pDiscount;

  Data2({required this.pColor, required this.pImage, required this.pID, required this.pTitle
    , required this.pDesc, required this.pPrice, required this.pDiscount});

  factory Data2.fromJson(Map<String, dynamic> json) {
    return Data2(
      pColor: json['product_video'],
      pImage: json['product_img1'],
      pID: json['p_cat_id'],
      pTitle: json['product_title'],
      pDesc: json['product_desc'],
      pPrice: json['product_price'],
      pDiscount: json['product_psp_price'],

    );
  }
}


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}