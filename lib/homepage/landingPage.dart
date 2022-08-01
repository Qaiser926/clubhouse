// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:paidlance/authentication/loginPage.dart';
// import 'package:paidlance/authentication/signupPage.dart';
// import 'package:paidlance/homepage/homePage.dart';
// import 'package:paidlance/homepage/modelClass/paidlance.dart';
// import 'package:paidlance/homepage/skillPersonDetail/skill_person_detailPage.dart';
// import 'package:paidlance/main.dart' show Data , paidLance;
//
// class LandingPage extends StatelessWidget {
//
//   List<Widget> DesktopLanding(double width){
//     return <Widget>[
//       Container(
//         width: width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text('asdfasdfas'),
//             Text('asdfasdfas'),
//             Text('asdfasdfas'),
//           ],
//         ),
//       )
//     ];
//   }
//
//   // Future<List<paidLance>> getData() async{
//   //   var response = http.get(Uri.parse('https://reqres.in/api/users?page=2'));
//   //   if()
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//         builder: (context ,constraints){
//           if(constraints.maxWidth>800){
//             return Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children:
//                 DesktopLanding(constraints.biggest.width),
//
//             );
//           }  else {
//             return Column(
//               children: <Widget>[
//                 HomePage(),
//                 // MyCustomForm()
//                 // DesktopLanding(constraints.biggest.width),
//               ],
//             );
//           }
//         }
//     );
//   }
// }
// class MobileLanding extends StatelessWidget {
//   // const MobileLanding({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text('mobile screen text')),
//     );
//   }
// }
//
//
// class DesktopLanding extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Text('Desktop landing page'),
//     );
//   }
// }
//
//
// //
// // class DesktopLanding extends StatefulWidget {
// //
// //   @override
// //   State<DesktopLanding> createState() => _DesktopLandingState();
// // }
// //
// // class _DesktopLandingState extends State<DesktopLanding> {
// //
// //   Paidlance data ;
// //   void _getDataFromApi() async {
// //
// //     // var reponse=await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
// //     var response = await http
// //         .get(Uri.parse('https://reqres.in/api/users?page=2'));
// //
// //     //  print(reponse.body);
// //     // setState(() {
// //     //   data=paidlance.fromJson(json.decode(reponse.body));
// //     // });
// //
// //   setState(() {
// //     data=Paidlance.fromJson(json.decode(response.body));
// //   });
// //   }
// //
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     _getDataFromApi();
// //   }
// //   // const DesktopLanding({Key? key}) : super(key: key);
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Container(
// //           child: SingleChildScrollView(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Container(
// //                   width: MediaQuery.of(context).size.width,
// //                   height: MediaQuery.of(context).size.height*0.13,
// //                   child: Container(
// //                     margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02,vertical: MediaQuery.of(context).size.width*0.03),
// //                     child: Row(
// //                       // crossAxisAlignment: CrossAxisAlignment.,
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //
// //                       children: [
// //
// //                        Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 40,height: 40,),
// //                         Column(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             SizedBox(height: MediaQuery.of(context).size.height*0.02,),
// //                             Text('Betav 1.D',style: TextStyle(color: Colors.grey,fontSize: 10),),
// //                             Text('PAIDLANCE',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),
// //                           ],
// //                         ),
// //                         SizedBox(width: MediaQuery.of(context).size.width/210,),
// //                         Row(
// //                           children: [
// //                             OutlinedButton(onPressed: (){
// //                               Navigator.pushNamed(context, '/loginpage');
// //                             }, child: Text('LOGIN')),
// //                             SizedBox(width: 2,),
// //                             OutlinedButton(
// //                                 onPressed: (){
// //                                   Navigator.pushNamed(context, SignUpPage.id);
// //                                 }, child: Text('SIGNOUT')),
// //                           ],
// //                         )
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //              Padding(
// //                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                child: Container(
// //                  width: MediaQuery.of(context).size.width,
// //                  height: MediaQuery.of(context).size.height*0.8,
// //                  color: Colors.black,
// //                  child: Column(
// //                    mainAxisAlignment: MainAxisAlignment.start,
// //                    crossAxisAlignment: CrossAxisAlignment.start,
// //                    children: [
// //                      SizedBox(height: MediaQuery.of(context).size.height*0.08,),
// //                      Padding(
// //                        padding: const EdgeInsets.symmetric(horizontal: 20),
// //                        child: Text('Find The Real',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
// //                      ),
// //                      Padding(
// //                        padding: const EdgeInsets.symmetric(horizontal: 20),
// //                        child: RichText(text: TextSpan(
// //                          children: [
// //                            TextSpan(text: 'People',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
// //                            TextSpan(text: ' !',style: TextStyle(fontSize: 30,color: Color(0xff00FFEC,),fontWeight: FontWeight.bold)),
// //                          ]
// //                        )),
// //                      ),
// //                      Padding(
// //                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
// //                        child: Text('That you really love to work & collaborate with.',textAlign: TextAlign.justify,style: TextStyle(fontSize: 14,color: Colors.white),),
// //                      ),
// //                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
// //
// //                      Container(
// //                        padding: EdgeInsets.only(left: 20),
// //                        child: Row(
// //                          children: [
// //                            Autocomplete<Data>(
// //
// //                              optionsBuilder: (TextEditingValue value) {
// //                                // if (value.text.isEmpty) {
// //                                //   return List.empty();
// //                                // }
// //
// //                                // print(data);
// //
// //                                // print( data.where((element) => element.name.toLowerCase().contains(value.text.toLowerCase())).toList());
// //
// //                                return data.data
// //                                    .where((element) => element.firstName
// //                                    .toLowerCase()
// //                                    .contains(value.text.toLowerCase()))
// //                                    .toList();
// //                                // .where((element) =>
// //                                // element.firstName
// //                                //     .toLowerCase()
// //                                //     .contains(value.text.toLowerCase()))
// //                                // .toList();
// //                              },
// //                              displayStringForOption: (Data d) => "${d.firstName}",
// //                              onSelected: (value) => print(value.firstName),
// //                              fieldViewBuilder: (BuildContext context,
// //                                  TextEditingController controller,
// //                                  FocusNode node,
// //                                  Function onSubmit) =>
// //                                  Row(
// //                                    children: [
// //                                      Container(
// //                                        width: MediaQuery.of(context).size.width * 0.7,
// //                                        child: TextField(
// //                                          controller: controller,
// //                                          decoration: InputDecoration(
// //                                            prefixIcon: Icon(Icons.widgets_outlined),
// //                                            suffixIcon: Icon(Icons.arrow_drop_down),
// //                                            fillColor: Colors.white,
// //                                            filled: true,
// //                                            hintText: 'Select A Skill',
// //                                            // prefixIcon:Image.asset('images/pak.png',width: 40,height: 40,)
// //                                            // prefixIcon: Image.asset('images/pak.png',width: 40,height: 40,)
// //                                          ),
// //                                          focusNode: node,
// //                                        ),
// //                                      ),
// //                                      Container(
// //                                        width: MediaQuery.of(context).size.width * 0.1,
// //                                        height: MediaQuery.of(context).size.height * 0.06,
// //                                        // child: CircularProgressIndicator(),
// //                                      )
// //                                    ],
// //                                  ),
// //                              optionsViewBuilder: (BuildContext context, Function onSelect,
// //                                  Iterable<Data> datlist) {
// //                                return Material(
// //                                  child: ListView.builder(
// //                                    itemCount: datlist.length,
// //                                    itemBuilder: (contex, index) {
// //                                      Data d = datlist.elementAt(index);
// //
// //                                      return InkWell(
// //                                        onTap: () {
// //                                          onSelect(d);
// //                                        },
// //                                        child: ListTile(
// //                                          title: Text(d.firstName),
// //
// //                                          // leading: Image.network(d.countryCode.toString(),width: 50,height: 50,fit: BoxFit.fill,),
// //                                          // leading: Text(d.countryId.toString(),),
// //                                        ),
// //                                      );
// //                                    },
// //                                  ),
// //                                );
// //                              },
// //                            ),
// //                          ],
// //                        ),
// //                      ),
// //                      Padding(
// //                        padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
// //                        child: MaterialButton(
// //                          height: MediaQuery.of(context).size.height*0.07,
// //                          minWidth:MediaQuery.of(context).size.width,
// //                          onPressed: (){
// //                            Navigator.pushNamed(context, SkillPersonDetailPage.id);
// //                          },
// //                          color: Colors.white70.withOpacity(0.4),
// //                        child: Text('search',style: TextStyle(color: Colors.white),),
// //                        ),
// //                      ),
// //                      SizedBox(height: 20,),
// //                      Padding(
// //                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                        child: Row(
// //                          children: [
// //                            Stack(
// //                              children: [
// //                                CircleAvatar(),
// //                                SizedBox(width: 20,),
// //                                Padding(
// //                                  padding: const EdgeInsets.only(left: 20),
// //                                  child: CircleAvatar(
// //                                    backgroundColor: Colors.blue,
// //                                  ),
// //
// //                                ),SizedBox(width: 20,), Padding(
// //                                  padding: const EdgeInsets.only(left: 20),
// //                                  child: CircleAvatar(
// //                                    backgroundColor: Colors.red,
// //                                  ),
// //                                ),SizedBox(width: 20,), Padding(
// //                                  padding: const EdgeInsets.only(left: 20),
// //                                  child: CircleAvatar(
// //                                    backgroundColor: Colors.green,
// //                                  ),
// //                                ),
// //                              ],
// //                            )
// //                          ],
// //                        ),
// //                      ),
// //                      Padding(
// //                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                        child: Text('Users and counting',style: TextStyle(color: Colors.white),),
// //                      ),
// //                      Padding(
// //                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                        child: RichText(text: TextSpan(
// //                        children: [
// //                          TextSpan(text: 'Paidlances Helping Skilled People ',style: TextStyle(
// //                            color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17
// //                          )),  TextSpan(text: ' to connect',style: TextStyle(
// //                            color: Colors.white,fontSize: 17
// //                          )),
// //                        ]
// //                        )),
// //                      )
// //                    ],
// //                  ),
// //                  // child:
// //                ),
// //              ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   child: Row(
// //                     children: [
// //                       Icon(Icons.person_outline,),
// //                       Text('New Paidlancers',style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //
// //                       ),),
// //                     ],
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.only(left: 20,right: 20,bottom: 8,top: 8),
// //                   child: Container(
// //                     width: MediaQuery.of(context).size.width,
// //                     height: MediaQuery.of(context).size.height*0.3,
// //                     decoration: BoxDecoration(
// //                       border: Border.all(width: 1,color: Colors.grey.shade400)
// //                     ),
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 100,height: 100,),
// //                         Text('Muhammad Mehdi',style: TextStyle(fontWeight: FontWeight.bold,),),
// //                         Text('Wordpress expert',style: TextStyle(fontSize: 12,color: Colors.grey),),
// //                         Row(
// //                           crossAxisAlignment: CrossAxisAlignment.center,
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 40,height: 40,),
// //                             Text('PK'),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.only(left: 20,right: 20,bottom: 8,top: 8),
// //                   child: Container(
// //                     width: MediaQuery.of(context).size.width,
// //                     height: MediaQuery.of(context).size.height*0.3,
// //                     decoration: BoxDecoration(
// //                         border: Border.all(width: 1,color: Colors.grey.shade400)
// //                     ),
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 100,height: 100,),
// //                         Text('Muhammad Ali',style: TextStyle(fontWeight: FontWeight.bold,),),
// //                         Text('Mobile app developer',style: TextStyle(fontSize: 12,color: Colors.grey),),
// //                         Row(
// //                           crossAxisAlignment: CrossAxisAlignment.center,
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             Image.network('https://images.unsplash.com/photo-1496200186974-4293800e2c20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',width: 40,height: 40,),
// //                             Text('PK'),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   child: Container(
// //                   decoration: BoxDecoration(
// //
// //                     gradient:  LinearGradient(
// //                       begin: Alignment.topRight,
// //                       end: Alignment.bottomLeft,
// //                       stops: [
// //                         0.1,
// //                         0.4,
// //                         0.6,
// //                         0.9,
// //                       ],
// //                       colors: [
// //                         Colors.yellow.shade50,
// //                         Colors.red.shade50,
// //                         Colors.indigo.shade50,
// //                         Colors.teal.shade50
// //                       ],
// //                     )
// //                   ),
// //                     width: MediaQuery.of(context).size.width,
// //                     height: MediaQuery.of(context).size.height*0.1,
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Icon(Icons.star_border),
// //                         Text('Started Locally Connecting Globally',
// //                         style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   child: Text('we are proud to accounce paidlance built in pakistan andd we aim to connect global resources to unlock '
// //                       'our lcoal potential w.w ebelo.'),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   child: Text('Featured Cities',style: TextStyle(fontWeight: FontWeight.bold),),
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                   children: [
// //                 Container(
// //                 decoration: new BoxDecoration(
// //                 color: Colors.black,
// //                   shape: BoxShape.circle,
// //                 ),
// //         ),
// //                   ],
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Row(
// //                     // crossAxisAlignment: CrossAxisAlignment.start,
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     children: [
// //                       SizedBox(width: 15,),
// //                       Transform.translate(
// //                         offset: const Offset(0, 0),
// //                         child: const Text(
// //                           '•',
// //                           style: TextStyle(fontSize: 30),
// //                         ),
// //                       ),
// //                        SizedBox(width: MediaQuery.of(context).size.width/3),
// //                       Text(
// //                         'Qaiser',style: TextStyle(decoration: TextDecoration.underline),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Row(
// //                     // crossAxisAlignment: CrossAxisAlignment.start,
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     children: [
// //                       SizedBox(width: 15,),
// //                       Transform.translate(
// //                         offset: const Offset(0, 0),
// //                         child: const Text(
// //                           '•',
// //                           style: TextStyle(fontSize: 30),
// //                         ),
// //                       ),
// //                       SizedBox(width: MediaQuery.of(context).size.width/3),
// //                       Text(
// //                         'Qaiser',style: TextStyle(decoration: TextDecoration.underline,),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Row(
// //                     // crossAxisAlignment: CrossAxisAlignment.start,
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     children: [
// //                       SizedBox(width: 15,),
// //                       Transform.translate(
// //                         offset: const Offset(0, 0),
// //                         child: const Text(
// //                           '•',
// //                           style: TextStyle(fontSize: 30),
// //                         ),
// //                       ),
// //                       SizedBox(width: MediaQuery.of(context).size.width/3),
// //                       Text(
// //                         'Qaiser',style: TextStyle(decoration: TextDecoration.underline),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   child:  Image.network('https://gisgeography.com/wp-content/uploads/2017/09/Pakistan-Province-Map.png'
// //                 ,  width: MediaQuery.of(context).size.width,
// //                     height: MediaQuery.of(context).size.height*0.4,
// //                   fit: BoxFit.cover,
// //                   ),
// //                 ),
// //                 Container(
// //                   margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   width: MediaQuery.of(context).size.width,
// //                   height: MediaQuery.of(context).size.height*2.15,
// //                   // color: Color(0xffFAFBFD),
// //                   color: Colors.grey,
// //                   child: ListView(
// //                     physics: NeverScrollableScrollPhysics(),
// //                     shrinkWrap: true,
// //                     children: [
// //                       SizedBox(height: MediaQuery.of(context).size.height*0.1,),
// //                       CircleAvatar(
// //                         // maxRadius: 100,
// //                         minRadius: 100,
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                         child: Row(
// //                           // mainAxisAlignment: MainAxisAlignment.,
// //                           children: [
// //                             Text('01. ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
// //                             SizedBox(width: 15,),
// //                             Align(
// //                               alignment: Alignment.center,
// //                               child: Text('Free to Join',
// //                                 textAlign: TextAlign.center,
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold,fontSize: 22),),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                         child: Text('It is totally freee to join create your profile'
// //                             ' search for people and connect with them'  ,style: TextStyle(
// //                             fontWeight: FontWeight.bold,fontSize:17),),
// //                       ),
// //                       SizedBox(height: MediaQuery.of(context).size.height*0.1,),
// //                       CircleAvatar(
// //                         // maxRadius: 100,
// //                         minRadius: 100,
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                         child: Row(
// //                           // mainAxisAlignment: MainAxisAlignment.,
// //                           children: [
// //                             Text('02. ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
// //                             SizedBox(width: 15,),
// //                             Align(
// //                               alignment: Alignment.center,
// //                               child: Text('Secure Account',
// //                                 textAlign: TextAlign.center,
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold,fontSize: 22),),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                         child: Text('We Take sucurity very serious . all your private'
// //                             'information is secured with us'  ,style: TextStyle(
// //                             fontWeight: FontWeight.bold,fontSize:17),),
// //                       ),
// //                       SizedBox(height: MediaQuery.of(context).size.height*0.1,),
// //                       CircleAvatar(
// //                         // maxRadius: 100,
// //                         minRadius: 100,
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                         child: Row(
// //                           // mainAxisAlignment: MainAxisAlignment.,
// //                           children: [
// //                             Text('03. ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
// //                             SizedBox(width: 15,),
// //                             Align(
// //                               alignment: Alignment.center,
// //                               child: Text('Verified Profile',
// //                                 textAlign: TextAlign.center,
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold,fontSize: 22),),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                         child: Text('Complete your profile and submit for verification . '
// //                             'verified profile get more attention'  ,style: TextStyle(
// //                             fontWeight: FontWeight.bold,fontSize:17),),
// //                       ),
// //                       SizedBox(height: MediaQuery.of(context).size.height*0.1,),
// //                       Icon(Icons.arrow_downward_sharp,size: 40,),
// //                       Padding(
// //                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                         child: MaterialButton(onPressed: (){
// //                           Navigator.pushNamed(context, SignUpPage.id);
// //                         },
// //                         child: Text('SIGNUP NOW',style: TextStyle(color: Colors.white),),
// //                           color: Colors.black,
// //                         ),
// //                       )
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: MediaQuery.of(context).size.height*0.07,),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   child: Text('Why you need to use paidlance!',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold ),),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   child: Text('Paidlance helping professional and freelancer find the right'
// //                       'people to work with. Find the right people to work and collaborate '
// //                       'without any charges just signup your account and find your partner . paidlance is connecting'
// //                       'platform for best avilable skilled resource fron job holder businesss.',style: TextStyle(fontSize:14, ),),
// //                 ),
// //                 SizedBox(height: MediaQuery.of(context).size.height*0.07,),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
// //                   child: Text('Frequent Asked Question FAQs',style: TextStyle(fontSize:17,fontWeight: FontWeight.bold ),),
// //                 ),
// //                 SizedBox(height: MediaQuery.of(context).size.height*0.07,),
// //                 SizedBox(
// //                     height: MediaQuery.of(context).size.height*0.8,
// //                   child: ListView.builder(
// //                     physics: NeverScrollableScrollPhysics(),
// //                     // shrinkWrap: true,
// //                     itemBuilder: (BuildContext context, int index) =>
// //                         EntryItem(expandData[index]),
// //                     itemCount: expandData.length,
// //                   ),
// //                 )
// //
// //               ],
// //             ),
// //           ),
// //         ),
// //
// //       ),
// //     );
// //   }
// //
// // }
// //
// // class MobileLanding extends StatelessWidget {
// //   // const DesktopLanding({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: MediaQuery.of(context).size.width*0.8,
// //       height: MediaQuery.of(context).size.height*0.8,
// //       color: Colors.black,
// //     );
// //   }
// // }
// //
// //
// //
// // class Entry {
// //   Entry(this.title, [this.children = const <Entry>[]]);
// //
// //   final String title;
// //   final List<Entry> children;
// // }
// //
// // final List<Entry> expandData = <Entry>[
// //   Entry(
// //     'WHO CAN OPEN ACCOUNT?',
// //     <Entry>[
// //
// //       Entry('Anyone who is doing business job or freelancing'),
// //     ],
// //   ),
// //   Entry(
// //     'ARE THERE ANY CHARGES?',
// //     <Entry>[
// //       Entry("Paidlane is free for now and it's uder beta versoin once we relate the productoin "
// //           "version we will announce some charges only to premuim accounts"),
// //     ],
// //   ),
// //   Entry(
// //     'HOW CAN I PAY?',
// //     <Entry>[
// //       Entry("For now we are not accepting any payments"),
// //
// //     ],
// //   ),
// //   Entry(
// //     'DO I NEED TO PAY ANY DEPOSIT?',
// //     <Entry>[
// //       Entry("There is no deposit fee you can open your acount for free"),
// //
// //     ],
// //   ),
// //   Entry(
// //     'HOW MANY ACCOUNT I CAN OPEN?',
// //     <Entry>[
// //       Entry("Please use your original name email and phone and you can open only one account"),
// //
// //     ],
// //   ),
// //   Entry(
// //     'CAN I MAKE MONEY?',
// //     <Entry>[
// //       Entry("Yes you cna share the affiliate link to your circle and ask people to join the platform for each "
// //           "1000 signups we offer \$10"),
// //
// //     ],
// //   ),
// //   Entry(
// //     'DOES PAIDLANE ASSURE OTHER ACCOUNTS',
// //     <Entry>[
// //       Entry("It is the marketplace of humans resources we do not guarantee or manage any publick account"),
// //
// //     ],
// //   ),
// //   Entry(
// //     'WHAT HAPPENS IF WE MISUSE?',
// //     <Entry>[
// //       Entry("If we found your account with any ilegal activity or any misbehave by community we"
// //           " will ban and block your account permanently"),
// //
// //     ],
// //   ),
// //   Entry(
// //     'HOW CAN I GET MY ACCOUNT VERIFIED?',
// //     <Entry>[
// //       Entry("Please complete your profile with image and all original detail and then submit for verifcation"),
// //
// //     ],
// //   ),
// // ];
// //
// //
// //
// // class EntryItem extends StatelessWidget {
// //   const EntryItem(this.entry);
// //
// //   final Entry entry;
// //
// //   Widget _buildTiles(Entry root) {
// //     if (root.children.isEmpty) return ListTile(title: Text(root.title));
// //     return ExpansionTile(
// //       key: PageStorageKey<Entry>(root),
// //       title: Text(root.title),
// //       children: root.children.map(_buildTiles).toList(),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return _buildTiles(entry);
// //   }
// // }
