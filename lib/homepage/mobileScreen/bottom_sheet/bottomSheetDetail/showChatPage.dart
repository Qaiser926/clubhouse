import 'package:flutter/material.dart';

class BottomSheetChatPageShow extends StatefulWidget {
  static String route='/bottomsheetchatepageshow';
  @override
  State<BottomSheetChatPageShow> createState() => _BottomSheetChatPageShowState();
}

class _BottomSheetChatPageShowState extends State<BottomSheetChatPageShow> {
  // const BottomSheetChatPageShow({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Chat Page'),
      ),
    );
  }
}
