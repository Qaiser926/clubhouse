import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  // const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      toolbarHeight: 80,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextFormField(

            decoration: InputDecoration(
              
              prefixIcon:  Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),

              contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 1),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.settings_backup_restore_outlined,size: 30,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Align(
                alignment: Alignment.topCenter,
                child: CircularProgressIndicator(color: Colors.black,)),
          ],
        ),
      ),
    );
  }
}
