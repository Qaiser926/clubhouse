import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paidlance/authentication/loginPage.dart';
import 'package:paidlance/homepage/desktopScreenDesign/profileDetail.dart';
import 'package:paidlance/homepage/modelClass/dummyModelClass.dart';
import 'package:paidlance/modelClass/ProductsModel.dart';
import 'package:http/http.dart' as http;

class TesterDetailPage extends StatefulWidget {
  static String route = '/testerdetailpage';
  String image;
  String fname, lastName;
  // int id;
  TesterDetailPage({this.image, this.fname, this.lastName});
  @override
  State<TesterDetailPage> createState() => _TesterDetailPageState();
}

class _TesterDetailPageState extends State<TesterDetailPage> {
  Map data={};
  Future<ProductsModel> getProductsApi() async {
    final response =
    await http.get(Uri.parse('https://webhook.site/f0851ac5-2a2c-40a2-a109-1e27586ac60a'));
    // await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    // final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as ProductsModel;


    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.more_vert_rounded),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.cancel_outlined),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // width: MediaQuery.of(context).size.width * 0.5,
                // height: MediaQuery.of(context).size.hashCode * 0.13,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          child: Column(
                            children: [
                              ClipOval(
                                  child: Container(
                        //               child: ClipOval(
                        //                   child: Image.network(
                        //                     args.,
                        //                     fit: BoxFit.cover,
                        //                   ),
                        // ),
                        )),
                              // Text(widget.fname),

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
                              Icons.arrow_drop_down_circle,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Row(
                      children: [
                        const Text('Follower'),
                        const SizedBox(
                          width: 13,
                        ),
                        // Text(args.totalPages.toString()),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        const Text('Following'),
                        const SizedBox(
                          width: 13,
                        ),
                        // Text(widget.id.toString()),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Description'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.13,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Clubs',
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {}, child: const Text('View All')),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.46,
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
                                              // child: ClipOval(
                                              //     child: Image.network(
                                              //       widget.image,
                                              //       width: 55,
                                              //       height: 55,
                                              //     ),),
                                          )),
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
                                const Text('user name'),
                                const Text('total no'),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.46,
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
                                              // child: ClipOval(
                                              //     child: Image.network(
                                              //       widget.image,
                                              //       width: 55,
                                              //       height: 55,
                                              //     )),
                                          )),
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
                                const Text('user name'),
                                const Text('total no'),
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: MaterialButton(
                  onPressed: () {},
                  shape: const StadiumBorder(),
                  child: Text('Message'),
                  color: Colors.grey.shade200,
                  minWidth: MediaQuery.of(context).size.width,
                ),
              )
            ],
          ),
        ));
  }
}
// //
