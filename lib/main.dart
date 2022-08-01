import 'package:flutter/material.dart';
import 'package:paidlance/authentication/loginPage.dart';
import 'package:paidlance/authentication/signupPage.dart';
import 'package:paidlance/bottomNavigationPage/profilePage.dart';
import 'package:paidlance/bottomNavigationPage/profilePage_appbar_icon/bookMardPage.dart';
import 'package:paidlance/homepage/desktopScreenDesign/desktopLandingPage.dart';
import 'package:paidlance/homepage/desktopScreenDesign/profileDetail.dart';
import 'package:paidlance/homepage/homePage.dart';
import 'package:paidlance/homepage/desktopScreenDesign/showDetail.dart';
import 'package:paidlance/homepage/landingPage.dart';
import 'package:paidlance/homepage/mobileScreen/bottom_sheet/bottomSheetDetail/showChatPage.dart';
import 'package:paidlance/homepage/mobileScreen/main_card_popupmenu_item/reportRoomTitlePage.dart';
import 'package:paidlance/homepage/mobileScreen/mobileLandingPage.dart';
import 'package:paidlance/homepage/mobileScreen/profileDetail/createUserClub/userClubCreation.dart';
import 'package:paidlance/homepage/mobileScreen/profileDetail/profileDetailPage.dart';
import 'package:paidlance/homepage/skillPersonDetail/skill_person_detailPage.dart';
import 'package:paidlance/testerDetialPage.dart';
import 'package:paidlance/tester_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(paidLance());
}
class paidLance extends StatefulWidget {

  @override
  _paidLanceState createState() => _paidLanceState();
}

class _paidLanceState extends State<paidLance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: Scaffold(
        body:
        Container(
          child: Column(
            children: [

              // MyCustomForm(),
              // LandingPage(),
              // HomePage(),
              TesterPage(),
              SignUpPage()
              // AudioPlayer(),
            ],
          ),
        )
      ),
      // routes: {
      //   LoginPage.id: (context) => LoginPage(),
      //   DesktopLanding.id: (context) => DesktopLanding(),
      //   SignUpPage.id:(context)=>SignUpPage(),
      //   SkillPersonDetailPage.id:(context)=>SkillPersonDetailPage(),
      // },
     // initialRoute: TesterPage.route,

     // initialRoute: HomePage.route,
     initialRoute: SignUpPage.route,
      routes: {
        // AudioPlayer.route:(context) => AudioPlayer(),
        HomePage.route: (context) => HomePage(),
        LoginPage.route:(context)=>LoginPage(),
        SignUpPage.route:(context)=>SignUpPage(),
        FruitDetail.route:(context) => FruitDetail(),
        ProfileDetail.route:(context) => ProfileDetail(),
        TesterPage.route:(context) => TesterPage(),
        TesterDetailPage.route:(context) => TesterDetailPage(),
        ProfilePage.route:(context) => ProfilePage(),
        BookMarkSavePage.route:(context) => BookMarkSavePage(),
        ReportRoomTitlePage.route:(context) => ReportRoomTitlePage(),
        BottomSheetChatPageShow.route:(context) => BottomSheetChatPageShow(),
        UserClubCreationPage.route:(context) => UserClubCreationPage(),
        // Se.route: (context) => SearchPage(),
      },
    );
  }
}
