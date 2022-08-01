import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paidlance/modelClass/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'package:paidlance/theme/Color/CColor.dart';
class UserClubCreationPage extends StatefulWidget {
  static String route='/userclubecreationpage';


  @override
  State<UserClubCreationPage> createState() => _UserClubCreationPageState();
}

class _UserClubCreationPageState extends State<UserClubCreationPage> {
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
    }}

    // const UserClubCreationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<ProductModel>(
              future: getProductsApi(),
              builder: (context,snapshot){
                final value=snapshot.data.data;
                if(snapshot.hasData){
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5,
                      crossAxisSpacing:5,
                      crossAxisCount: 2
                    ),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:15,vertical: 15),
                          child: Card(
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
                                                      value[index].avatar,
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
                                        child:  Text(value[index].firstName),
                                      )),
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Text(value[index].lastName),
                                      )),
                                ],
                              ),
                            ),
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
      ),
    );
  }
}
