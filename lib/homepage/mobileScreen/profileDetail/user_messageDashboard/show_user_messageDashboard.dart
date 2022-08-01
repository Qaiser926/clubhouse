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
class ShowUserMessageDashboardPage extends StatefulWidget {
  String image;
  String fname, lastName;
  int id;
  ShowUserMessageDashboardPage({this.image, this.fname, this.lastName, this.id});


  @override
  State<ShowUserMessageDashboardPage> createState() => _ShowUserMessageDashboardPageState();
}

class _ShowUserMessageDashboardPageState extends State<ShowUserMessageDashboardPage> {

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
                height: MediaQuery.of(context).size.height * 0.84,
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
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 35,
                                    )),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Image.network('https://images.unsplash.com/photo-1597586124394-fbd6ef244026?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
                                    ,width: 30,height: 30,),
                                  SizedBox(width: 4,),
                                  Text('Qaiser'),
                                ],
                              ),
                            ),
                            Text('')


                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.4,
                      color: Colors.grey,
                    )
                  ],
                      ),
                    ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(

                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(

                          width: MediaQuery.of(context).size.width*0.56,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 2.0,
                                  ),
                                ),
                                // border: InputBorder.none,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                fillColor: CColor.mainCardColor,

                                filled: true,
                                hintText: 'Say something...',
                                hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width*0.2,
                            child: TextButton(onPressed: (){}, child: Text('SEND'))),
                      ],
                    ),
                  ),
                ),
              )
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


