import 'package:flutter/material.dart';

class BookMarkSavePage extends StatefulWidget {
  static String route='/bookmarksavepage';

  @override
  State<BookMarkSavePage> createState() => _BookMarkSavePageState();
}

class _BookMarkSavePageState extends State<BookMarkSavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('SAVED REPLAYS',style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600
        ),),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Icon(Icons.bookmark_border_rounded,size: 120,)),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('You haven\'n saved',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.w400
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('any Replays... yet!',style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.w400
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
