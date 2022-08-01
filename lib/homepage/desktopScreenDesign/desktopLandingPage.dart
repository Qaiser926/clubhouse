import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paidlance/homepage/desktopScreenDesign/desktop_imageOverlay.dart';
import 'package:paidlance/homepage/desktopScreenDesign/desktopbottomSheet/desktopButtomSheet.dart';
import 'package:paidlance/homepage/desktopScreenDesign/profileDetail.dart';
import 'package:paidlance/homepage/desktopScreenDesign/showDetail.dart';
import 'package:paidlance/homepage/mobileScreen/mobileLandingPage.dart';
import 'package:paidlance/homepage/modelClass/dummyModelClass.dart';

import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:paidlance/theme/theme.dart';
import 'package:http/http.dart' as http;

class DesktopScreenAppBar extends StatefulWidget {
  @override
  State<DesktopScreenAppBar> createState() => _DesktopScreenAppBarState();
}

class _DesktopScreenAppBarState extends State<DesktopScreenAppBar> {
  var sendlist = <ProductModel>[];
  // var data;
  Future<ProductModel> getProductsApi() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    // final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            // app bar
            _customNavBar(context),
            // landing page
            _landingPage(context),
          ],
        ),
      ),
    );
  }

  Widget _customNavBar(context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                _commonAppBarTextStyle(
                  title: 'Clubhouse',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontsize: 35,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.07,
                ),
                _commonAppBarTextStyle(
                    title: 'LOGIN',
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    fontsize: 15,
                    onpress: () {
                      Navigator.pushNamed(context, '/loginpage');
                    }),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.07,
                ),
                _commonAppBarTextStyle(
                  title: 'SIGNUP',
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontsize: 15,
                  onpress: () {
                    Navigator.pushNamed(context, '/signuppage');
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, right: 20),
            // child: _commonAppBarTextStyle(title: 'Get Clubhoue', FontWeight.w600, 17),
            child: _commonAppBarTextStyle(
              fontWeight: FontWeight.w600,
              title: 'Get Clubhouse',
              color: Colors.white,
              fontsize: 17,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet() {
    return Column(
      children: [Text('data')],
    );
  }

  // image ko overlap kia he
  Widget buildStackedImages() {
    final double size = 80;
    // final urlImages
    final urlImages = [
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1595290293434-555d42427e84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      "https://images.unsplash.com/photo-1597586124394-fbd6ef244026?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1595290293434-555d42427e84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      "https://images.unsplash.com/photo-1597586124394-fbd6ef244026?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1595290293434-555d42427e84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      "https://images.unsplash.com/photo-1597586124394-fbd6ef244026?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1595290293434-555d42427e84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1597586124394-fbd6ef244026?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    ];
    final items = urlImages
        .map(
          (urlImage) => buildImage(urlImage),
        )
        .toList();

    return StackedWidgets(
      items: items,
      size: size,
    );
  }

  Widget buildImage(String urlImage) {
    final double borderSize = 5;
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(borderSize),
        color: Colors.white,
        child: ClipOval(
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // main image k bad data he

  Widget _landingPage(context) {
    return Expanded(
      child: Container(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Image.network(
                'https://images.unsplash.com/photo-1483058712412-4245e9b90334?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "Bounce around the hallways of the Internet and meet incredible people",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                // app store button
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Image.network(
                        'https://images.unsplash.com/photo-1612994370726-5d4d609fca1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
                        width: 20,
                        height: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          _commonAppBarTextStyle(
                            title: 'Download on the',
                            fontsize: 9,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _commonAppBarTextStyle(
                              title: 'App Store',
                              fontsize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  color: Colors.white,
                  minWidth: MediaQuery.of(context).size.width * 0.3,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                // play store button
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBVABe3tE15fLWIe0C7ojFedwzrxd2Q5r73W2qEsqD-xM9rgehsj2CsbvjYCHny970qXM&usqp=CAU',
                        width: 20,
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: _commonAppBarTextStyle(
                                title: 'GET IT ON',
                                fontsize: 9,
                                color: Colors.black,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: _commonAppBarTextStyle(
                              title: 'GOOGLE PLAY',
                              fontsize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  color: Colors.white,
                  minWidth: MediaQuery.of(context).size.width * 0.3,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          // yaha main card ho ga. jis me userbuildSheetMethod our images ho gi
          // _customCard(context),
          Container(
              width: MediaQuery.of(context).size.width * .85,
              height: MediaQuery.of(context).size.height * .32,
              child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => FruitDetail(),
                    //     ));
                    showModalBottomSheet(

                        // enableDrag: false,
                        // isDismissible: false,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => DesktopbuildSheetMethod());
                  },
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text('Group Name'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        // buildStackedImages(),
                        // yaha par image overlay set kia he
                        Stack(
                          // alignment: Alignment.centerLeft,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  buildStackedImages(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                children: const [
                                  Icon(Icons.person_outlined),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('9'),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Row(
                                children: const [
                                  Icon(Icons.message),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text('12'),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    //     child: FutureBuilder<ProductModel>(
                    //   future: getProductsApi(),
                    //   builder: (context, snapshot) {
                    //     final value = snapshot.data.data;
                    //     if (snapshot.hasData) {
                    //       return Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           Center(child: Text('Group buildSheetMethod')),
                    //           SizedBox(
                    //             height: 25,
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(horizontal: 15),
                    //             child: Container(
                    //               width: MediaQuery.of(context).size.width,
                    //               height:
                    //                   MediaQuery.of(context).size.height * 0.133,
                    //               child: ListView.builder(
                    //                   scrollDirection: Axis.horizontal,
                    //                   itemCount: value.length,
                    //                   itemBuilder: (context, index) {
                    //                     return Padding(
                    //                       padding: const EdgeInsets.only(left: 4),
                    //                       child: ClipOval(
                    //                         child: Container(
                    //                           decoration: BoxDecoration(
                    //                               shape: BoxShape.circle),
                    //                           child: ClipOval(
                    //                             child: Container(
                    //                               decoration: BoxDecoration(
                    //                                   shape: BoxShape.circle),
                    //                               // height: 70,
                    //                               // width: 70,

                    //                               child: Image.network(
                    //                                 snapshot
                    //                                     .data.data[index].avatar,
                    //                                 fit: BoxFit.cover,
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     );
                    //                   }),
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.symmetric(vertical: 10),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Icon(Icons.person_outline),
                    //                 SizedBox(
                    //                   width: 7,
                    //                 ),
                    //                 Text('6'),
                    //                 SizedBox(
                    //                   width: 7,
                    //                 ),
                    //                 Icon(Icons.message),
                    //                 SizedBox(
                    //                   width: 7,
                    //                 ),
                    //                 Text('39'),
                    //               ],
                    //             ),
                    //           ),
                    //         ],
                    //       );
                    //     } else {
                    //       Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //   },
                    // )),
                  )))
        ]),
      ),
    );
  }
  // ye niche draggable scroll view k liye kia he

  // Widget buildSheetMethod() => Container(
  //       child: Column(
  //         children: [
  //           Text("alsdjfalsdkjfasldkjfasdjflasdkjfklasjdkfjasdkfj"),
  //         ],
  //       ),
  //     );
}

// custom text and style
class _commonAppBarTextStyle extends StatefulWidget {
  String title;
  FontWeight fontWeight;
  double fontsize;
  Function onpress;
  Color color;

  _commonAppBarTextStyle(
      {this.title, this.fontWeight, this.fontsize, this.onpress, this.color});
  @override
  State<_commonAppBarTextStyle> createState() => _commonAppBarTextStyleState();
}

class _commonAppBarTextStyleState extends State<_commonAppBarTextStyle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      child: Text(widget.title,
          style: TextStyle(
              color: widget.color,
              fontSize: widget.fontsize,
              fontWeight: widget.fontWeight,
              letterSpacing: 1)),
    );
  }
}

class AnimatedContainer extends StatelessWidget {
  const AnimatedContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


