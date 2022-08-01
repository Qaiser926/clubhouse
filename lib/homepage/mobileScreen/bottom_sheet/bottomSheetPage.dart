// yaha par draggable scroll view show kia he ..
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:paidlance/homepage/desktopScreenDesign/showDetail.dart';
import 'package:paidlance/homepage/mobileScreen/bottom_sheet/bottomSheetDetail/showChatPage.dart';
import 'package:paidlance/homepage/mobileScreen/profileDetail/profileDetailPage.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:paidlance/theme/Color/CColor.dart';
import 'package:paidlance/theme/reusableData/reusable.dart';
import 'package:share_plus/share_plus.dart';
class buildSheetMethodMobileScreen extends StatefulWidget {
  const buildSheetMethodMobileScreen({Key key}) : super(key: key);

  @override
  State<buildSheetMethodMobileScreen> createState() => _buildSheetMethodMobileScreenState();
}

class _buildSheetMethodMobileScreenState extends State<buildSheetMethodMobileScreen> {
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

  bool micHandPress=true;
  Widget makeDismissible({Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(
      onTap: () {},
      child: child,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'Clubhouse',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          appBar_icon((){},Icons.mail_outlined),
          appBar_icon((){},Icons.notifications_none),
          appBar_icon((){},Icons.schedule_send),



        ],
      ),
      body: makeDismissible(
        child: DraggableScrollableSheet(
          initialChildSize: 1,
          // minChildSize: 0.9,
          // maxChildSize: 0.9,
          builder: (_, controller) => ListView(
            controller: controller,
            children: [
              // Image.network(widget.fruitDataModel[widget.index].ImageUrl),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Colors.white),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 35,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                child: Row(
                                  children: [
                                    Image.network('https://media.gettyimages.com/photos/woman-hand-showing-peace-sign-isolated-on-white-background-picture-id165982630?s=2048x2048'
                                      ,width: 30,height: 30,),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'Leave quietly',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 15),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // group name
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.55,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 23),
                                  child: const Text(
                                    'Qaiser',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Icon(Icons.more_vert_outlined,),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        // show total pic and replay off text
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Icon(Icons.person_outline),
                              SizedBox(width: 5,),
                              Text('43/5',style: TextStyle(color: Colors.grey),),
                              SizedBox(width: 20,),
                              Text('Replays off',style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.w700),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        SizedBox(height: 10,),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*0.08,
                          child: Row(
                            children: [
                              userFavButton(),
                              userFavButton(),
                              userFavButton(),
                              userFavButton(),
                            ],
                          ),
                        ),

                        Flexible(
                            fit: FlexFit.loose,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.4,
                              child: FutureBuilder<ProductModel>(
                                future: getProductsApi(),
                                builder: (context, snapshot) {
                                  final value = snapshot.data.data;
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context).size.height*0.4,
                                          child: GridView.builder(
                                            itemCount: value.length,
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 5,
                                                crossAxisSpacing: 2,
                                                mainAxisSpacing: 2),
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Column(children: [
                                                  Container(
                                                    width: 65,
                                                    height: 65,
                                                    // padding: EdgeInsets.all(10),
                                                    child: Stack(
                                                      children: [

                                                        ClipOval(
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape.circle,
                                                                border: Border.all(width: 3,color: Colors.grey.withOpacity(0.6))
                                                            ),
                                                            child: ClipOval(
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            UserProfileDetailPageForMobile(
                                                                              image:
                                                                              value[index].avatar,
                                                                              fname: value[index]
                                                                                  .firstName,
                                                                              lastName: value[index]
                                                                                  .lastName,
                                                                              id: value[index].id,
                                                                            ),
                                                                      ));
                                                                  // Navigator.pushNamed(
                                                                  //     context, 'fruitdetail');
                                                                },
                                                                child: Image.network(
                                                                  snapshot
                                                                      .data.data[index].avatar,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                              // child: Text(Fruitdata[index].name),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment.bottomRight,
                                                          child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: Colors.white
                                                              ),
                                                              child: Icon(Icons.mic,color: Colors.grey,)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Text(
                                                    // snapshot.data.data[index].firstName,
                                                    snapshot.data.data[index].firstName,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 10,color: Colors.black),
                                                    textAlign: TextAlign.justify,
                                                  )
                                                ]),
                                              );
                                            },
                                          ),
                                        ),

                                      ],
                                    );
                                  } else {
                                    Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            )),

                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Enjoying the', style: TextStyle(color: Colors.black),),
                              Text('conversation?', style: TextStyle(color: Colors.black),),
                            ],
                          ),
                          MaterialButton(
                            elevation: 0,
                            onPressed: (){

                            },
                            child:   Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Follow some speakers',
                                style: TextStyle(color: Colors.black),),
                            ),
                            color: Colors.grey.shade100,
                            shape: StadiumBorder(),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                MaterialButton(
                                  elevation: 0,
                                  onPressed: (){
                                    Navigator.pushNamed(context, BottomSheetChatPageShow.route);
                                  },
                                  child:   Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.message_outlined),
                                        SizedBox(width: 6,),
                                        Text('23',
                                          style: TextStyle(color: Colors.black),),
                                      ],
                                    ),
                                  ),
                                  color: Colors.grey.shade100,
                                  shape: StadiumBorder(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                MaterialButton(
                                  elevation: 0,
                                  onPressed: (){
                                    Share.share(CShareData.shareClubhouse.toString());
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
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      micHandPress=!micHandPress;
                                    });
                                  },
                                  child:micHandPress?Icon(Icons.home_outlined):Icon(Icons.mic) ),
                            ),
                          )
                        ],
                      ),
                    ),
                    // yaha tak pageview me show karo ga.
                   // PageView(
                   //   scrollDirection: Axis.vertical,
                   //   children: [
                   //     bottomSheetMainData(),
                   //     BottomSheetChatPageShow()
                   //   ],
                   // )
                  ],
                ),
              ),

              // Text(widget.fruitDataModel[widget.index].name),
            ],
          ),
        ),
      ),
    );
  }
  Widget userFavButton(){
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 0),
      child: MaterialButton(

        elevation: 0,
        onPressed: (){
        },
        child: Row(
          children: [

            Text('Share',
              style: TextStyle(color: Colors.black),),
          ],
        ),
        color: CColor.mainCardColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        )
      ),
    );
  }
  Widget appBar_icon(Function onpress,IconData iconData){
    return  Padding(
      padding: const EdgeInsets.only(left: 10,right: 20),
      child: IconButton(
        onPressed: onpress,
        icon: Icon(iconData,color: Colors.white,),
      ),
    );
  }
}


