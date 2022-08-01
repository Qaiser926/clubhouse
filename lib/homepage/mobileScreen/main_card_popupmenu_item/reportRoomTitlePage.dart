import 'package:flutter/material.dart';

class ReportRoomTitlePage extends StatefulWidget {
  static String route='/reportroompage';
  @override
  State<ReportRoomTitlePage> createState() => _ReportRoomTitlePageState();
}

class _ReportRoomTitlePageState extends State<ReportRoomTitlePage> {
  // const ReportRoomTitlePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('Report page')),
      ),
    );
  }
}
