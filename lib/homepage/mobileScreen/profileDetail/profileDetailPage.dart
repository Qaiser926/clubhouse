import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paidlance/homepage/desktopScreenDesign/desktop_imageOverlay.dart';
import 'package:paidlance/homepage/mobileScreen/main_card_popupmenu_item/reportRoomTitlePage.dart';
import 'package:paidlance/homepage/mobileScreen/profileDetail/createUserClub/userClubCreation.dart';
import 'package:paidlance/homepage/mobileScreen/profileDetail/user_messageDashboard/show_user_messageDashboard.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:paidlance/theme/Color/CColor.dart';
import 'package:paidlance/theme/reusableData/reusable.dart';
import 'package:share_plus/share_plus.dart';

class UserProfileDetailPageForMobile extends StatefulWidget {
  static String route = '/fruitdetail';
  String image;
  String fname, lastName;
  int id;
  UserProfileDetailPageForMobile({this.image, this.fname, this.lastName, this.id});
  @override
  State<UserProfileDetailPageForMobile> createState() => _UserProfileDetailPageForMobileState();
}

class _UserProfileDetailPageForMobileState extends State<UserProfileDetailPageForMobile> {
  bool isVisible = false;
  bool bellIconVisiblity=false;
  bool follow=false;
  Map data={};
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

  final navigatorKey=GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,

          actions: [
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: PopupMenuButton(
                onSelected: (int menu){
                  if(menu==1){
                    CShareData.shareClubhouse;
                  }else if(menu==2){
                  showDialog(context: context, builder: (context){
                    return   AlertDialog(
                      title: Text('Block ${widget.fname}'),
                      content: Text('This will prevent them from entering rooms where you are a speaker, and we\'all warn you about room where they are speaking.',
                      style: TextStyle(height: 2,letterSpacing: 1),),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('CANCEL')),
                        TextButton(onPressed: (){}, child: Text('BLOCK')),
                      ],
                    );
                  });
                  }else if(menu==3){

                  }
                },
                itemBuilder: (context)=>[
                  PopupMenuItem(
                      child: Text('Share profile...'),value: 1,),
                  PopupMenuItem(child: Text('Block'),value: 2,),
                  PopupMenuItem(child: Text('Report an incident'),value: 3,),
                ],
              )
            ),
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.cancel_outlined,size: 30,))
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView(
            children: [

              Container(
                // width: MediaQuery.of(context).size.width * 0.5,
                // height: MediaQuery.of(context).size.hashCode * 0.13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          child: Column(
                            children: [
                              ClipOval(
                                  child: Container(
                                      child: ClipOval(
                                          child: Image.network(
                                            widget.image,
                                            fit: BoxFit.cover,
                                          )))),
                              SizedBox(height: 10,),


                          //

                              // Text(widget.lastName),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                    Visibility(
                      visible: bellIconVisiblity,
                      child: Container(
                        child: IconButton(onPressed: (){
                          // bottomSheetMethod();
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))
                            ),
                              // backgroundColor: Colors.transparent,
                              context: context, builder: (context){
                            return Container(
                            
                              child: Wrap(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                                    child: Text('When Jarrod Hunter talks, notify me',
                                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
                                  ),
                                  ListTile(
                                    title: Text('Always'),
                                    trailing: Icon(Icons.check_rounded,color: Colors.green,),
                                  ),
                                  ListTile(
                                    title: Text('Sometimes'),
                                  ), Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: ListTile(
                                      title: Text('Never ever'),
                                    ),
                                  ),


                                ],
                              ),
                            );
                          });
                          // Fluttertoast.showToast(msg: 'sahdfdsafasddf');
                        }, icon: Icon(Icons.circle_notifications_outlined,
                          color: Colors.blue,),),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                setState(() {
                                  follow=!follow;
                                  bellIconVisiblity=!bellIconVisiblity;
                                });
                              },
                              child: follow?Text(
                                'Following',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ):Text(
                                'Follow',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              color: Colors.blue,
                              shape: const StadiumBorder(),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              onTap: (){
                                setState(() {
                                  isVisible=!isVisible;
                                });
                              },
                              child: isVisible?Icon(
                                Icons.keyboard_arrow_up_sharp,
                                size: 30,
                                color: Colors.blue,
                              ):Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                size: 30,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: CommonText(
                  color: Colors.black,
                  title: widget.fname,
                ),
              ),
              Row(
                children: [
                  CommonText(
                    color: Colors.black,
                    title: '@${widget.lastName}',
                  ),
                  SizedBox(width: 20,),
                  Row(

                    children: [
                      Icon(Icons.stars_sharp,color: Colors.green,size: 13,),
                      CommonText(
                        color: Colors.black,
                        title: widget.fname,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height:15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [

                          Text(widget.id.toString()),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text('Follower'),

                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      child: Row(
                        children: [
                          Text(widget.id.toString()),
                          const SizedBox(
                            width: 8,
                          ),

                          const Text('Following'),


                        ],
                      ),
                    )
                  ],
                ),
              ),
      Visibility(
        visible: isVisible,
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              commonDivider(),
              SizedBox(height: 5,),
            CommonText(
              title: 'PEOPLE TO FOLLOW',
            color:  Colors.black
            ),
              Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.2,
        child: FutureBuilder<ProductModel>(
          future: getProductsApi(),
          builder: (context,snapshot){
            final value=snapshot.data.data;
            if(snapshot.hasData){
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.data.length,
                itemBuilder: (context,index){
                  return   Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    // height: MediaQuery.of(context).size.height ,
                    child: Column(
                      children: [
                        SizedBox(
                          height:
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.start,
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              ClipOval(
                                child: Image.network(snapshot.data.data[index].avatar,height: 40,
                                width: 40,fit: BoxFit.cover,),
                              ),
                              SizedBox(width: 5,),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(value[index].firstName),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                          MediaQuery.of(context).size.height * 0.04,
                        ),
                       Row(
                         mainAxisAlignment:MainAxisAlignment.center,
                         crossAxisAlignment:CrossAxisAlignment.center,
                         children: [
                           MaterialButton(

                             onPressed: (){},child: Text('Follow',
                             style: TextStyle(color: Colors.white,
                                 fontWeight: FontWeight.w400),),color: Colors.blue,
                           shape: StadiumBorder(),
                             elevation: 0,
                           ),
                           SizedBox(width: 8,),
                           MaterialButton(
                             onPressed: (){},child: Text('Remove',
                             style: TextStyle(color: Colors.black,

                                 fontWeight: FontWeight.w400),),color: Colors.grey.shade100,

                             shape: StadiumBorder(),elevation: 0,)
                         ],
                       )
                      ],
                    ),
                  );
                },
              );

            }else{
              Text('laoding');
            }


          },

        )
    ),
              commonDivider()
            ],
          ),
        ),
      ),
              const SizedBox(
                height: 14,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('kiki do you love me < 3'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
               // description
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(widget.fname),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.024,
              ),
              // other info
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(widget.lastName.toString()),
                  ),  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(widget.fname.toString()),
                  ),

                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('joined jul 15, 2022'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Clubs',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, UserClubCreationPage.route);
                            }, child: const Text('View All'))
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          color: CColor.mainCardColor,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            height: MediaQuery.of(context).size.height * 0.3,

                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipOval(
                                          child: Container(
                                              child: ClipOval(
                                                  child: Image.network(
                                                    widget.image,
                                                    width: 55,
                                                    height: 55,
                                                  )))),
                                      Container(
                                        // width: MediaQuery.of(context).size.width * 0.48,
                                        // height: MediaQuery.of(context).size.height * 0.15,
                                        child: MaterialButton(
                                          onPressed: () {
                                          },
                                          shape: const StadiumBorder(),
                                          minWidth: MediaQuery.of(context)
                                              .size
                                              .width *
                                              0.1,
                                          color: Colors.blue,
                                          child: const Text(
                                            'Join user',
                                            style:
                                            TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: const Text('user name'),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: const Text('total no'),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          color: CColor.mainCardColor,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.43,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipOval(
                                          child: Container(
                                              child: ClipOval(
                                                  child: Image.network(
                                                    widget.image,
                                                    width: 55,
                                                    height: 55,
                                                  )))),
                                      MaterialButton(
                                        onPressed: () {},
                                        shape: const StadiumBorder(),
                                        minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.1,
                                        color: Colors.blue,
                                        child: const Text(
                                          'Join',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: const Text('user name'),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: const Text('total no'),
                                    )),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Favorite topics...',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {}, child: const Text('View All'))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.16,
                  child: Wrap(
                    spacing: 7,
                    runSpacing: 7,
                    children: [
                      reusable_favoriteButton(),
                      reusable_favoriteButton(),
                      reusable_favoriteButton(),
                      reusable_favoriteButton(),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.8,
                child: FutureBuilder<ProductModel>(
                  future: getProductsApi(),
                  builder: (context,snapshot){
                    final value=snapshot.data.data;
                    return ListView.builder(
                      // physics: NeverScrollableScrollPhysics(),
                      //   shrinkWrap: true,
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (context,index){

                      return   Card(
                        // color: CColor.mainCardColor,
                        color: CColor.mainCardColor,
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
                                        Text('34'),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

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
                    });
                  },
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () {
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

                        builder: (context) => ShowUserMessageDashboardPage(
                        ));
                  },
                  shape: const StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.schedule_send),
                        SizedBox(width: 15,),
                        Text('Message'),
                      ],
                    ),
                  ),
                  color: Colors.grey.shade100,
                  minWidth: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
        ));
  }
  Widget reusable_favoriteButton(){
    return Container(
      width: MediaQuery.of(context).size.width*0.25,
      child: MaterialButton(
        elevation: 0,
        onPressed: (){

        },
        child:   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.share),
              SizedBox(width: 4,),
              Text('Share',
                style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
        color: Colors.grey.shade100,
        shape: StadiumBorder(),
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
          child: Text('Share Replay'),
          value: 1,
        ),
        PopupMenuItem(child: Text('Report Room Title'),value: 2,),
        PopupMenuItem(child: Text('Save Replay'),value: 3,),
      ],
      onSelected: (int menu){
        if(menu==1){
          // navigatorKey.currentState.

          CShareData.shareClubhouse;
          // showDialog(
          //     context: context,
          //     builder: (ctx) => AlertDialog(
          //       title: Text('test dialog'),
          //     ));
        }else if(menu==2){
          navigatorKey.currentState.push(MaterialPageRoute(builder: (context)=>ReportRoomTitlePage()));

        }else if(menu==3){
          Fluttertoast.showToast(msg: 'Save Replay');
        }
      },
      icon: Icon(Icons.more_vert_outlined,color: Colors.grey,),
      iconSize: 20,

    );
  }
  Widget commonDivider(){
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        thickness: 0.5,
        color: Colors.grey,
      ),
    );
  }
}
// //

class CommonText extends StatelessWidget {
  // const CommonText({Key? key}) : super(key: key);
  String title;
  Color color;
  CommonText({this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return   Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(title,style: TextStyle(color: color),),
        ));
  }
}

