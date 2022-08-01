import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paidlance/bottomNavigationPage/bottomNavigationPage.dart';
import 'package:paidlance/homepage/desktopScreenDesign/desktopLandingPage.dart';
import 'package:paidlance/homepage/mobileScreen/mobileLandingPage.dart';
import 'package:paidlance/theme/theme.dart';
// import 'package:random_user/random_user.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatelessWidget {
  static const String route = '/homepage';
  // const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopScreenAppBar();
      } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
        return DesktopScreenAppBar();
      } else {
        // return MobileScreenAppBar();
        return BottomNavigationPage();
      }
    });
  }
}


class User {
  const User({
     this.id,
     this.firstName,
     this.avatarUrl,
  });

  final String id;
  final String firstName;
  final String avatarUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}




