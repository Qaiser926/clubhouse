import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paidlance/authentication/loginPage.dart';
import 'package:paidlance/homepage/desktopScreenDesign/profileDetail.dart';
import 'package:paidlance/homepage/modelClass/dummyModelClass.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:paidlance/theme/Color/CColor.dart';

class FruitDetail extends StatefulWidget {
  static String route = '/fruitdetail';
  String image;
  String fname, lastName;
  int id;
  FruitDetail({this.image, this.fname, this.lastName, this.id});
  @override
  State<FruitDetail> createState() => _FruitDetailState();
}

class _FruitDetailState extends State<FruitDetail> {
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

  @override
  Widget build(BuildContext context) {
    data=ModalRoute.of(context).settings.arguments;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Icon(Icons.more_vert_rounded),
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
                              Text(widget.fname),

                              // Text(widget.lastName),
                            ],
                          ),
                        ),
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
                              onPressed: () {},
                              child: Text(
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
                            const Icon(
                              Icons.arrow_drop_down_circle_outlined,
                              size: 30,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
              const SizedBox(
                height: 14,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('kiki do you love me < 3'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
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
                            onPressed: () {}, child: const Text('View All'))
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
                                          onPressed: () {},
                                          shape: const StadiumBorder(),
                                          minWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          color: Colors.blue,
                                          child: const Text(
                                            'Join',
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () {},
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
}
// //
