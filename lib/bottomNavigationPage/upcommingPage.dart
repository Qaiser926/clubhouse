import 'package:flutter/material.dart';

class UpcommingPage extends StatelessWidget {
  // const UpcommingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Upcoming for you',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.tv_outlined,color: Colors.black,size: 25,),
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("We couldn't find any",style: TextStyle(color: Colors.black),),
              Text('upcoming',style: TextStyle(color: Colors.black),),
              Text('events to recommend',style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
