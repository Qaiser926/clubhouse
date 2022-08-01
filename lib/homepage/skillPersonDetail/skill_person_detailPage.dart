import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:paidlance/authentication/loginPage.dart';
import 'package:paidlance/authentication/signupPage.dart';
import 'package:paidlance/homepage/landingPage.dart';
import 'package:http/http.dart' as http;
import 'package:paidlance/homepage/modelClass/paidlance.dart';

class SkillPersonDetailPage extends StatefulWidget {
  static const id='skillpersondetailPage';
  @override
  State<SkillPersonDetailPage> createState() => _SkillPersonDetailPageState();
}

class _SkillPersonDetailPageState extends State<SkillPersonDetailPage> {
  bool checkbox=false;
  // const SkillPersonDetailPage({Key? key}) : super(key: key);
  Paidlance data ;
  void _getDataFromApi() async {

    // var reponse=await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    var response = await http
        .get(Uri.parse('https://reqres.in/api/users?page=2'));

    //  print(reponse.body);
    // setState(() {
    //   data=paidlance.fromJson(json.decode(reponse.body));
    // });

    setState(() {
      data=Paidlance.fromJson(json.decode(response.body));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromApi();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        backgroundColor: Color(0xfffF3F3F3),
        
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.13,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02,vertical: MediaQuery.of(context).size.width*0.03),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [

                    Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 40,height: 40,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Text('Betav 1.D',style: TextStyle(color: Colors.grey,fontSize: 10),),
                        Text('PAIDLANCE',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width/210,),
                    Row(
                      children: [
                        OutlinedButton(onPressed: (){
                          // Navigator.pushNamed(context, LoginPage.id);
                        }, child: Text('LOGIN')),
                        SizedBox(width: 2,),
                        OutlinedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, SignUpPage.id);
                            }, child: Text('SIGNOUT')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          SizedBox(height: MediaQuery.of(context).size.height*0.13,),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(

                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*1.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,color: Colors.grey.shade100
                  ),

                ),
                child: Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1.3,color: Colors.grey.shade200)
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*1.9,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                            decoration: BoxDecoration(
                                color: Color(0xfffF3F3F3),
                              borderRadius: BorderRadius.circular(13)
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height*0.2,

                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Autocomplete<Data>(

                                    optionsBuilder: (TextEditingValue value) {
                                      // if (value.text.isEmpty) {
                                      //   return List.empty();
                                      // }

                                      // print(data);

                                      // print( data.where((element) => element.name.toLowerCase().contains(value.text.toLowerCase())).toList());

                                      return data.data
                                          .where((element) => element.firstName
                                          .toLowerCase()
                                          .contains(value.text.toLowerCase()))
                                          .toList();
                                      // .where((element) =>
                                      // element.firstName
                                      //     .toLowerCase()
                                      //     .contains(value.text.toLowerCase()))
                                      // .toList();
                                    },
                                    displayStringForOption: (Data d) => "${d.firstName}",
                                    onSelected: (value) => print(value.firstName),
                                    fieldViewBuilder: (BuildContext context,
                                        TextEditingController controller,
                                        FocusNode node,
                                        Function onSubmit) =>
                                        Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.6,
                                              child: TextField(
                                                controller: controller,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(Icons.widgets_outlined),
                                                  suffixIcon: Icon(Icons.arrow_drop_down),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  hintText: 'Select A Skill',
                                                  // prefixIcon:Image.asset('images/pak.png',width: 40,height: 40,)
                                                  // prefixIcon: Image.asset('images/pak.png',width: 40,height: 40,)
                                                ),
                                                focusNode: node,
                                              ),
                                            ),
                                            Container(

                                              width: MediaQuery.of(context).size.width * 0.1,
                                              height: MediaQuery.of(context).size.height * 0.06,
                                              // child: CircularProgressIndicator(),
                                            )
                                          ],
                                        ),
                                    optionsViewBuilder: (BuildContext context, Function onSelect,
                                        Iterable<Data> datlist) {
                                      return Material(
                                        child: ListView.builder(
                                          itemCount: datlist.length,
                                          itemBuilder: (contex, index) {
                                            Data d = datlist.elementAt(index);

                                            return InkWell(
                                              onTap: () {
                                                onSelect(d);
                                              },
                                              child: ListTile(
                                                title: Text(d.firstName),

                                                // leading: Image.network(d.countryCode.toString(),width: 50,height: 50,fit: BoxFit.fill,),
                                                // leading: Text(d.countryId.toString(),),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2,right: 10,top: 10),
                                  child: MaterialButton(
                                    height: MediaQuery.of(context).size.height*0.07,
                                    minWidth:MediaQuery.of(context).size.width,
                                    onPressed: (){
                                      Navigator.pushNamed(context, SkillPersonDetailPage.id);
                                    },
                                    color: Colors.black,
                                    child: Text('search',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Search Filteration',style: TextStyle(fontSize: 15),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Profile Type',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                          ),
                    Container(
                      child: Row(

                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Checkbox(
                              value: this.checkbox,
                              onChanged: (bool checkbox){
                                setState(() {
                                  this.checkbox=checkbox;
                                });
                              },
                            ),
                          ),
                          Text('Verified Profiles',style: TextStyle(fontSize: 15),),

                        ],
                      ),
                    ),

                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Divider(
                              thickness: 2,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Text('Filter by Country',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                          ),
                          Container(
                            child: Row(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Checkbox(
                                    value: this.checkbox,
                                    onChanged: (bool checkbox){
                                      setState(() {
                                        this.checkbox=checkbox;
                                      });
                                    },
                                  ),
                                ),
                                Image.network('https://media.istockphoto.com/vectors/flag-of-pakistan-vector-id472330681?k=20&m=472330681&s=612x612&w=0&h=5Qdo76qlQlFIqKDir3kldQB_cgQ227WC0irPs1PxIN4=',width: 30,height: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Text('PK',style: TextStyle(fontSize: 15),),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            child: Row(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Checkbox(
                                    value: this.checkbox,
                                    onChanged: (bool checkbox){
                                      setState(() {
                                        this.checkbox=checkbox;
                                      });
                                    },
                                  ),
                                ),
                                Image.network('https://media.istockphoto.com/vectors/flag-of-pakistan-vector-id472330681?k=20&m=472330681&s=612x612&w=0&h=5Qdo76qlQlFIqKDir3kldQB_cgQ227WC0irPs1PxIN4=',width: 30,height: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Text('PK',style: TextStyle(fontSize: 15),),
                                ),

                              ],
                            ),
                          ),
                          Container(
                            child: Row(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Checkbox(
                                    value: this.checkbox,
                                    onChanged: (bool checkbox){
                                      setState(() {
                                        this.checkbox=checkbox;
                                      });
                                    },
                                  ),
                                ),
                                Image.network('https://media.istockphoto.com/vectors/flag-of-pakistan-vector-id472330681?k=20&m=472330681&s=612x612&w=0&h=5Qdo76qlQlFIqKDir3kldQB_cgQ227WC0irPs1PxIN4=',width: 30,height: 30,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7),
                                  child: Text('PK',style: TextStyle(fontSize: 15),),
                                ),

                              ],
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 8,top: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.33,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey.shade400)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 100,height: 100,),
                                  Text('Muhammad Mehdi',style: TextStyle(fontWeight: FontWeight.bold,),),
                                  Text('Wordpress expert',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 40,height: 40,),
                                      Text('PK'),
                                    ],
                                  ),
                                  OutlinedButton(onPressed: (){}, child: Text('Contact'))
                                ],
                                
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 8,top: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.33,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey.shade400)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 100,height: 100,),
                                  Text('Muhammad Mehdi',style: TextStyle(fontWeight: FontWeight.bold,),),
                                  Text('Wordpress expert',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 40,height: 40,),
                                      Text('PK'),
                                    ],
                                  ),
                                  OutlinedButton(onPressed: (){}, child: Text('Contact'))
                                ],

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 8,top: 8),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height*0.33,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colors.grey.shade400)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 100,height: 100,),
                                  Text('Muhammad Mehdi',style: TextStyle(fontWeight: FontWeight.bold,),),
                                  Text('Wordpress expert',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 40,height: 40,),
                                      Text('PK'),
                                    ],
                                  ),
                                  OutlinedButton(onPressed: (){}, child: Text('Contact'))
                                ],

                              ),
                            ),
                          ),
                      ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
