// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:paidlance/homepage/modelClass/dummyModelClass.dart';
//
// class ProfileDetail extends StatefulWidget {
//   static String route='/profiledetail';
//
//
//   @override
//   State<ProfileDetail> createState() => _ProfileDetailState();
// }
//
// class _ProfileDetailState extends State<ProfileDetail> {
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(title: Text('Clubhouse',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
//
//       ),
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Image.network(widget.fruitDataModel[widget.index].ImageUrl),
//             Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15),
//
//                   ),
//                   color: Colors.white
//               ),
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height*0.9,
//               child:
//               Column(
//                 children: [
//                 Row(
//                   children: [
//                     // Pading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
//                     // ClipOval( child:Container(
//                     //   width: 80,
//                     //   height: 80,
//                     //   // padding: EdgeInsets.all(10),
//                     //   child: ClipOval(
//                     //     child: Image.network(,fit: BoxFit.cover,),
//                     //     // child: Text(Fruitdata[index].name),
//                     //   ),
//                     // ),
//                     // ),
//                     // Text()
//                     Image.network(widget.fruitDataModel.ImageUrl),
//                   ],
//                 )
//
//                 ],
//               ),
//
//             ),
//
//             // Text(widget.fruitDataModel[widget.index].name),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:paidlance/homepage/desktopScreenDesign/showDetail.dart';
import 'package:paidlance/homepage/modelClass/dummyModelClass.dart';
import 'package:paidlance/theme/reusable_theme.dart';
import 'package:paidlance/theme/theme.dart';

class ProfileDetail extends StatelessWidget {
  static String route='/profiledetail';
  final List<FruitDataModel> fruitDataModel;
  int index;
   ProfileDetail({Key key,  this.fruitDataModel,this.index}) : super(key: key);


  static List<String> fruitname =['Apple','Banana','Mango','Orange','pineapple','sdf','dsaf','gd'];
  static List<String> username=['qaiser','farooq','sir qasim','aziz','sa','abdullah','umar','haider'];
  static List<int> noOfUser=[2,4,5,55,66,2,4,6];
  static List<String>  userMessage=['45','23','65','32','6','43','6','43'];
  static List<String> userDes=['this is so good','fantastic','awsm','bad group','zbr10','nice','bhat acha','kamal ka he '];
  static List follwerList=[23,34,54,67,5,2,4566,76];
  static List follwingList=[23,45,65,32,76,22,67,78];
  static List<String> urlImages=[
    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1595290293434-555d42427e84?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1597586124394-fbd6ef244026?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    "https://images.unsplash.com/photo-1500917293891-ef795e70e1f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
    "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",

  ];

  // static List<String> url = ['https://www.applesfromny.com/wp-content/uploads/2020/05/Jonagold_NYAS-Apples2.png',
  //   'https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg',
  //   'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Hapus_Mango.jpg/220px-Hapus_Mango.jpg',
  //   'https://5.imimg.com/data5/VN/YP/MY-33296037/orange-600x600-500x500.jpg',
  //   'https://5.imimg.com/data5/GJ/MD/MY-35442270/fresh-pineapple-500x500.jpg'];

  final List<FruitDataModel> Fruitdata = List.generate(fruitname.length, (index) =>
      FruitDataModel('${fruitname[index]}', '${urlImages[index]}','${fruitname[index]}','${userMessage[index]}'
          '${follwerList[index]}','${follwingList[index]}','${noOfUser[index]}','${noOfUser[index]}'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Image.network(fruitDataModel.ImageUrl),
          // SizedBox(
          //   height: 10,
          // ),
          // Text(fruitDataModel.desc,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          // Row(
          //   children: [
          //     ClipOval( child:
          //     Container(
          //       width: 80,
          //       height: 80,
          //       // padding: EdgeInsets.all(10),
          //       child: ClipOval(
          //         child: Image.network(,fit: BoxFit.cover,),
          //         // child: Text(Fruitdata[index].name),
          //       ),
          //     ),
          //     ),
          //
          //   ],
          // )
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               ClipOval(
                 child: Container(
                     width: 80,
                     height: 80,
                     child: ClipOval(child: Image.network(fruitDataModel[index].ImageUrl))),
               ),
               Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Icon(Icons.more_vert_outlined),
                         SizedBox(width: 4,),
                         Icon(Icons.cancel_outlined),
                       ],
                     ),
                     SizedBox(height: 20,),
                     Row(
                       children: [
                         MaterialButton(
                           shape: StadiumBorder(),
                           onPressed: (){},child: Text('Follow'),color: Colors.blue,),
                         SizedBox(width: 6,),
                         Icon(Icons.arrow_drop_down_circle_outlined),
                       ],
                     )
                   ],
                 ),
               )
             ],
           ),
         ),
          Text(fruitDataModel[index].name,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
             Row(
               children: [
                 Text(fruitDataModel[index].follwer,),
                 Text('follwers')
               ],
             ),
                Row(
                  children: [
                    Text(fruitDataModel[index].following,),
                    Text('follwing')
                  ],
                ),
              ],
            ),
          ),
          Text(fruitDataModel[index].desc),

    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.3,
    color: CColor.mainCardColor,
    child: InkWell(
    onTap: (){
    // Navigator.pushNamed(context,'/fruitdetail');
    Navigator.push(context, MaterialPageRoute(builder: (context)=>FruitDetail()));
    },
    child: Card(
    child: Align(
    // alignment: Alignment.topCenter,
    child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Column(
    children: [
    Text('Name of User'),
    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
    Stack(
    // alignment: Alignment.centerLeft,
    children: [
    Container(
    width: MediaQuery.of(context).size.width*0.9,
    height: MediaQuery.of(context).size.height*0.12,
    // child: ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: [
    //     buildStackedImages(),
    //   ],
    // ),
    child:  ListView.builder(
    itemBuilder: (BuildContext, index){
    return InkWell(

    child: Container(
    width: 120,
    height: 120,
    child: ListTile(
    // leading: CircleAvatar(backgroundImage: AssetImage(images[index]),),
    title:
    ClipOval( child:
    Container(
    // padding: EdgeInsets.all(10),
    child: ClipOval(
    child: Image.network(Fruitdata[index].ImageUrl,fit: BoxFit.cover,),
    // child: Text(Fruitdata[index].name),
    ),
    ),
    ),
    onTap: (){
    print(index);
    // Navigator.pushNamed(context,'/fruitdetail' );
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context)=>ProfileDetail(index: index,fruitDataModel: Fruitdata,)));
    },
    ),
    ),
    );
    },

    itemCount: Fruitdata.length,
    // shrinkWrap: true,
    // padding: EdgeInsets.all(1),
    scrollDirection: Axis.horizontal,
    )


    //
    )
    ]
    ),
    // icon
    // SizedBox(height: 20,),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Icon(Icons.messenger_sharp),
    SizedBox(width: 30,),
    Icon(Icons.person_outline),
    ],
    )
    ],
    ),
    )),
    ),
    ),
    ),
    )
        ],
      ),
    );
  }
}