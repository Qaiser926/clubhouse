import 'package:flutter/material.dart';
import 'package:paidlance/bottomNavigationPage/profilePage.dart';
import 'package:paidlance/bottomNavigationPage/searchPage.dart';
import 'package:paidlance/bottomNavigationPage/upcommingPage.dart';
import 'package:paidlance/homepage/mobileScreen/mobileLandingPage.dart';

class BottomNavigationPage extends StatefulWidget {

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int myIndex=0;
  List<Widget> myWidgetPage=[
    MobileScreenAppBar(),
    SearchPage(),
    UpcommingPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: myWidgetPage[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green.shade400,
        unselectedItemColor: Colors.grey.shade300,
        // showSelectedLabels: false,

        showUnselectedLabels: false,
        onTap: (index){
          setState(() {
            myIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(

            label: 'Home',
            icon: Icon(Icons.home_outlined,color: Colors.black),
          ),BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(Icons.search,color: Colors.black,),
          ),BottomNavigationBarItem(
              icon: Icon(Icons.tv,color: Colors.black),
              label: 'upcomming'
          ),BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(Icons.person_outline,color: Colors.black),
          ),
        ],
      ),

    );
  }
}
