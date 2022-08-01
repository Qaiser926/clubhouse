//
// // yaha par draggable scroll view show kia he ..
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:paidlance/modelClass/ProductsModel.dart';
// import 'package:http/http.dart' as http;
// import 'package:paidlance/testerDetialPage.dart';
//
// class TesterPage extends StatefulWidget {
//   static String route='/TesterPage';
//
//   @override
//   State<TesterPage> createState() => _TesterPageState();
// }
//
// class _TesterPageState extends State<TesterPage> {
//   Future<ProductsModel> getProductsApi() async {
//     final response =
//     // await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
//     await http.get(Uri.parse('https://webhook.site/f0851ac5-2a2c-40a2-a109-1e27586ac60a'));
//     // final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       return ProductsModel.fromJson(data);
//     } else {
//       return ProductsModel.fromJson(data);
//     }
//   }
//
//   Widget makeDismissible({Widget child}) => GestureDetector(
//     behavior: HitTestBehavior.opaque,
//     onTap: () => Navigator.of(context).pop(),
//     child: GestureDetector(
//       onTap: () {},
//       child: child,
//     ),
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text(
//           'Clubhouse app',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.black,
//       ),
//       body: makeDismissible(
//         child: DraggableScrollableSheet(
//           initialChildSize: 0.92,
//           // minChildSize: 0.9,
//           // maxChildSize: 0.9,
//           builder: (_, controller) => ListView(
//             controller: controller,
//             children: [
//               // Image.network(widget.fruitDataModel[widget.index].ImageUrl),
//               Container(
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15),
//                     ),
//                     color: Colors.white),
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height * 0.92,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 20, vertical: 15),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 icon: const Icon(
//                                   Icons.keyboard_arrow_down,
//                                   size: 30,
//                                 )),
//                             Container(
//                               child: Row(
//                                 children: [
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: const Text(
//                                       'Leave quietly',
//                                       style: TextStyle(
//                                           color: Colors.red, fontSize: 15),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const Text(
//                       'good room',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.02,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 10),
//                       child: Row(
//                         children: [
//                           Container(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: const [
//                                 Icon(Icons.person_outline),
//                                 SizedBox(
//                                   width: 3,
//                                 ),
//                                 // Text(widget.fruitDataModel[widget.index].noOfUser),
//                                 // Image.network(Fruitdata[index].ImageUrl,fit: BoxFit.cover,)
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width / 2.5,
//                           ),
//                           const Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'Replays off',
//                                 style: TextStyle(fontWeight: FontWeight.w600),
//                               )),
//                         ],
//                       ),
//                     ),
//                     Flexible(
//                         fit: FlexFit.loose,
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height,
//                           child: FutureBuilder<ProductsModel>(
//                             future: getProductsApi(),
//                             builder: (context, snapshot) {
//                               final value = snapshot.data.data;
//                               if (!snapshot.hasData) {
//                                 Center(
//                                   child: CircularProgressIndicator(),
//                                 );
//                               } else {
//                                 return GridView.builder(
//                                   itemCount: value.length,
//                                   gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 6,
//                                       crossAxisSpacing: 2,
//                                       mainAxisSpacing: 2),
//                                   itemBuilder: (context, index) {
//                                     return Container(
//                                       child: Column(children: [
//                                         Container(
//                                           width: 60,
//                                           height: 60,
//                                           // padding: EdgeInsets.all(10),
//                                           child: ClipOval(
//                                             child: InkWell(
//                                               onTap: () {
//                                                 // Navigator.pushNamed(context, TesterDetailPage.route,
//                                                 //     arguments:ProductsModel(
//                                                 //       data: value
//                                                 // ) );
//                                                 Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           TesterDetailPage(
//                                                             image:
//                                                             value[index].image,
//                                                             fname: value[index]
//                                                                 .name,
//                                                             lastName: value[index]
//                                                                 .description,
//                                                             // id: value[index],
//                                                           // ),
//                                                           )
//                                                     ));
//                                                 Navigator.pushNamed(
//                                                     context, TesterDetailPage.route);
//                                               },
//                                               // child: Image.network(
//                                               //   snapshot
//                                               //       .data.data[index].image,
//                                               //   fit: BoxFit.cover,
//                                               // ),
//                                             ),
//                                             // child: Text(Fruitdata[index].name),
//                                           ),
//                                         ),
//                                         Text(
//                                           snapshot.data.data[index].name,
//                                           style: TextStyle(fontSize: 10),
//                                           textAlign: TextAlign.justify,
//                                         )
//                                       ]),
//                                     );
//                                   },
//                                 );
//                               }
//                             },
//                           ),
//                         )),
//                     Divider(
//                       color: Colors.grey,
//                       thickness: 2,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text('Enjoying the conversation'),
//                           Text('Follow some speakers'),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Divider(
//                       color: Colors.grey,
//                       thickness: 2,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 15, vertical: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             child: Row(
//                               children: [
//                                 Container(
//                                     width: 40,
//                                     height: 35,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.grey.shade200,
//                                     ),
//                                     child: Icon(Icons.message)),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.grey.shade200,
//                                     ),
//                                     width: 70,
//                                     height: 40,
//                                     child: Row(
//                                       children: [
//                                         Icon(Icons.share),
//                                         Text('Share')
//                                       ],
//                                     )),
//                               ],
//                             ),
//                           ),
//                           Icon(Icons.mic_none),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               // Text(widget.fruitDataModel[widget.index].name),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TesterPage extends StatefulWidget {
  static String route='/testerpage';
  @override
  State<TesterPage> createState() => _TesterPageState();
}

class _TesterPageState extends State<TesterPage> {
  // const TesterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [

            pageone(),
            pagetwo(),
          ],
        )
      ),
    );
  }
}
class pagetwo extends StatelessWidget {
  // const pagetwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('this is page two')),
    );
  }
}


class pageone extends StatelessWidget {
  // const pageone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('Thiss is blue page')),
      ),
    );
  }
}
