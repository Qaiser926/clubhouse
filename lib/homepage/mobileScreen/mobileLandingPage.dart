import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paidlance/bottomNavigationPage/profilePage.dart';
import 'package:paidlance/bottomNavigationPage/searchPage.dart';
import 'package:paidlance/bottomNavigationPage/upcommingPage.dart';
import 'package:paidlance/homepage/desktopScreenDesign/desktopLandingPage.dart';
import 'package:paidlance/homepage/desktopScreenDesign/showDetail.dart';
import 'package:paidlance/homepage/homePage.dart';
import 'package:paidlance/homepage/mobileScreen/bottom_sheet/bottomSheetPage.dart';
import 'package:paidlance/homepage/mobileScreen/main_card_popupmenu_item/reportRoomTitlePage.dart';
import 'package:paidlance/homepage/mobileScreen/overlayImage_stack.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:paidlance/theme/theme.dart';
import "package:http/http.dart" as http;

class MobileScreenAppBar extends StatefulWidget {
  @override
  State<MobileScreenAppBar> createState() => _MobileScreenAppBarState();
}

class _MobileScreenAppBarState extends State<MobileScreenAppBar> {
  final navigatorKey=GlobalKey<NavigatorState>();
  bool isVisible = false;
  Future<ProductModel> getProductsApi() async {
    final response =
    await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    // await http.get(Uri.parse('https://webhook.site/f0851ac5-2a2c-40a2-a109-1e27586ac60a'));
    // final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(

          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            surfaceTintColor: Colors.white,
            title: Text('Clubhouse',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
            actions: [
              appBar_icon((){},Icons.mail_outlined,),
              appBar_icon((){},Icons.notifications_none),
              appBar_icon((){},Icons.schedule_send),
            ],
          ),
            backgroundColor: Colors.white,
            body: Stack(
              children: [


                Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // app bar
                        // _customMobileScreenAppbar(),

                        /// visibility container change icon with press button

                        // Visibility(
                        //   visible: isVisible,
                        //   child: Container(
                        //     color: Colors.black,
                        //     width: MediaQuery.of(context).size.width,
                        //     height: MediaQuery.of(context).size.height * 0.25,
                        //     child: Column(
                        //       children: [
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height * 0.04,
                        //         ),
                        //         TextButton(
                        //           onPressed: () {},
                        //           child: _commonAppBarTextStyle(
                        //             fontWeight: FontWeight.w800,
                        //             title: 'LOGIN',
                        //             fontsize: 17,
                        //             onpress: () {
                        //               Navigator.pushNamed(context, '/loginpage');
                        //             },
                        //           ),
                        //         ),
                        //         SizedBox(
                        //           height: MediaQuery.of(context).size.height * 0.04,
                        //         ),
                        //         TextButton(
                        //           onPressed: () {},
                        //           child: _commonAppBarTextStyle(
                        //             fontWeight: FontWeight.w800,
                        //             title: 'SIGNUP',
                        //             fontsize: 17,
                        //             onpress: () {
                        //               Navigator.pushNamed(context, '/signuppage');
                        //             },
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                        // main pic
                        // _mainHomePagePic(),
                        // text
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 20, vertical: 10),
                        //   child: Text(
                        //     "Bounce around the hallways of the Internet and meet incredible people",
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.04,
                        // ),
                        // // app link button app store and play sotre
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.02,
                        // ),
                        // // app store link button
                        // _customAppStoreLinkbutton(),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.02,
                        // ),
                        // // android play store link button.
                        // _customAndroidLinkButton(),
                        // card
                        // yaha main card ho ga. jis me userbuildSheetMethod our images ho gi
                        // yaha par page design kia he.
                        // _customCard(context),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text('Live around Clubhouse')),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          decoration: BoxDecoration(
                              // color: CColor.mainCardColor,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                            width: MediaQuery.of(context).size.width*0.95,
                            height: MediaQuery.of(context).size.height,
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

                                      builder: (context) => buildSheetMethodMobileScreen());
                                },
                                child:Container(
                                  // width: MediaQuery.of(context).size.width*0.95,
                                  height: MediaQuery.of(context).size.height*0.9,
                                  child: FutureBuilder<ProductModel>(
                                    future: getProductsApi(),
                                    builder: (context,snapshot){
                                      final value=snapshot.data.data;
                                      if(snapshot.hasData){
                                        return ListView.builder(
                                          itemCount: snapshot.data.data.length,
                                          itemBuilder: (context,index){
                                            return
                                              Card(
                                              // color: CColor.mainCardColor,
                                              color: Color(0xfffF6F5F0),
                                              // color: Colors.blue,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                    MediaQuery.of(context).size.height * 0.02,
                                                  ),
                                                  Align(
                                                      alignment: Alignment.topLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            // group name text
                                                            Container(
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    decoration:BoxDecoration(
                                                                        shape: BoxShape.rectangle
                                                                    ),
                                                                    child: ClipOval(
                                                                      child: Image.network(value[index].avatar
                                                                          ,width: 20,height: 20,fit: BoxFit.cover),
                                                                    ),

                                                                  ),
                                                                  SizedBox(width: 7,),
                                                                  Text(value[index].firstName),
                                                                ],
                                                              ),
                                                            ),
                                                            // popupmenuButton
                                                            showPopupemenuButton(),
                                                          ],
                                                        ),
                                                      )),
                                                  SizedBox(height: 10,),
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                                    child: Align(
                                                        alignment: Alignment.topLeft,
                                                        child: Text(value[index].lastName)),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    MediaQuery.of(context).size.height * 0.03,
                                                  ),
                                                  // yaha par image overlay set kia he
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                                    child: Row(

                                                      children: [
                                                        Container(

                                                          child:   Stack(
                                                            // alignment: Alignment.centerLeft,
                                                            children: [

                                                              // ClipOval(
                                                              //   child: Container(
                                                              //     margin: EdgeInsets.symmetric(horizontal: 27,vertical: 14),
                                                              //     child: ClipOval(
                                                              //       child: Image.network('https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                                              //         width:40,height: 40,fit: BoxFit.cover,),),),),
                                                              // ClipOval(
                                                              //   child: Container(
                                                              //     child: ClipOval(
                                                              //       child: Image.network('https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                                                              //         width:40,height: 40,fit: BoxFit.cover,),),),),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(15)
                                                                ),
                                                                width: MediaQuery.of(context).size.width * 0.85,
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
                                                        ),
                                                        // SizedBox(width: MediaQuery.of(context).size.width*0.08,),
                                                        // Container(
                                                        //   // width: MediaQuery.of(context).size.width*0.4,
                                                        //   child: Column(
                                                        //     mainAxisAlignment: MainAxisAlignment.center,
                                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                                        //     children: [
                                                        //       Text('Qasim Sir',style: TextStyle(fontSize: 17,color: Colors.black,
                                                        //           fontWeight: FontWeight.w500),),
                                                        //       Text('Qaiser',style: TextStyle(fontSize: 17,color: Colors.black,
                                                        //           fontWeight: FontWeight.w500),),
                                                        //       Text('Farooq',style: TextStyle(fontSize: 17,color: Colors.black,
                                                        //           fontWeight: FontWeight.w500),),
                                                        //
                                                        //     ],
                                                        //   ),
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height:
                                                    MediaQuery.of(context).size.height * 0.05,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 15),
                                                    child: Row(
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
                                                    ),
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
                                            );
                                          },
                                        );

                                      }else{
                                     Text('laoding');
                                      }


                                    },

                                  )
                                )))
                      ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(20),
                      // color:Colors.green.withOpacity(0.9),
                      // ),
                      child: MaterialButton(
                        onPressed: (){},
                          shape: StadiumBorder(),
                        color: Colors.green,
                        minWidth: 50,
                        child:Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: ' +',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700
                                )
                                ),
                                TextSpan(
                                  text: ' Room',style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700
                                )
                                )
                              ]
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                ),

              ],
            ),
        ),
      ),
    );
  }

  Widget _customCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.32,
        color: CColor.mainCardColor,
        child: Card(
          color: CColor.mainCardColor,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Align(
              // alignment: Alignment.topCenter,
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Text('Name of User'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Stack(
                  // alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      // width: MediaQuery.of(context).size.width * 0.3,
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
                // icon
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.messenger_sharp),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.person_outline),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }

  // image ko overlap kia he
  Widget buildStackedImages() {
    final double size = 65;
    final urlImages = [

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
      "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      "https://images.unsplash.com/photo-1597586124394-fbd6ef244026?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    ];
    final items = urlImages
        .map(
          (urlImage) => buildImage(urlImage.toString()),
        )
        .toList();

    return StackedWidgets(
      items: items,
      size: size,
    );
  }

  Widget buildImage(String urlImage) {
    final double borderSize = 0;
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

  Widget showPopupemenuButton(){
    return     PopupMenuButton(

      itemBuilder: (context)=>[
        PopupMenuItem(
          child: Text('Show me fewer like this'),
          value: 1,
        ),
        PopupMenuItem(child: InkWell(

            child: Text('Report Room Title')),value: 2,),
      ],
      onSelected: (int menu){
        if(menu==1){
          // navigatorKey.currentState.

         showDialog(context: context, builder: (context) {
           return AlertDialog(
             title: Text('Hide This Room'),
             actions: [
               TextButton(
                 child: Text('CANCEL'),
                 onPressed: () {
                   Navigator.pop(context);
                 },
               ),
               TextButton(onPressed: () {}, child: Text('OK')),
             ],
           );
         });
          // showDialog(
          //     context: context,
          //     builder: (ctx) => AlertDialog(
          //       title: Text('test dialog'),
          //     ));
        }else if(menu==2){
          navigatorKey.currentState.push(MaterialPageRoute(builder: (context)=>ReportRoomTitlePage()));

        }
      },
      icon: Icon(Icons.more_vert_outlined,color: Colors.grey,),
      iconSize: 20,

    );
  }
  /// ye niche app store link button
  Widget _customAppStoreLinkbutton() {
    return Container(
      // width: MediaQuery.of(context).size.width*0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(  width: MediaQuery.of(context).size.width*0.1,),
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
        ],
      ),
    );
  }

  Widget _customAndroidLinkButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(text: 'On ', style: TextStyle(color: Colors.white)),
          TextSpan(
              text: 'Android ',
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline)),
          TextSpan(text: 'too! ', style: TextStyle(color: Colors.white)),
        ])),
        Image.network(
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          width: 25,
          height: 25,
        )
      ],
    );
  }

  // Widget _customMobileScreenAppbar() {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).size.height * 0.11,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         // crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           // SizedBox(
  //           //   width: MediaQuery.of(context).size.width / 4,
  //           // ),
  //           // Text('  '),
  //
  //           _commonAppBarTextStyle(
  //             fontWeight: FontWeight.bold,
  //             fontsize: 25,
  //             color: Colors.black,
  //             title: 'Clubhouse',
  //           ),
  //           Container(
  //             child: Row(
  //               children: [
  //                appBar_icon((){},Icons.mail_outlined,),
  //                appBar_icon((){},Icons.notifications_none),
  //                appBar_icon((){},Icons.schedule_send),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
Widget appBar_icon(Function onpress,IconData iconData){
    return  Padding(
      padding: const EdgeInsets.only(left: 15,right: 10),
      child: IconButton(
        color: Colors.black,
        onPressed: onpress,
        icon: Icon(iconData),
      ),
    );
}
  Widget _mainHomePagePic() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Image.network(
          'https://images.unsplash.com/photo-1496449903678-68ddcb189a24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
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

          style:
            TextStyle(
        color: widget.color,
        fontSize: widget.fontsize,
        fontWeight: widget.fontWeight,
        letterSpacing: 1,)

    )
    );
  }
}

//
// class alertDialogBox extends StatelessWidget {
//   // const alertDialogBox({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
