import 'package:flutter/material.dart';
import 'package:paidlance/bottomNavigationPage/profilePage_appbar_icon/bookMardPage.dart';
import 'package:paidlance/theme/Color/CColor.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:fluttericon/typicons_icons.dart';


class ProfilePage extends StatelessWidget {
  static String route='/profilepage';
  // const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
       actions: [
        app_icon(Icons.alternate_email_outlined,(){}),
        app_icon(Icons.share,(){
          Share.share('check out my website https://example.com');
        }),
        app_icon(Icons.bookmark_border_rounded,(){
          Navigator.pushNamed(context,BookMarkSavePage.route );
        }),
        app_icon(Icons.settings,(){}),
         // Icon(Icons.share,size: 20,),
         // Icon(Icons.bookmark_border_rounded,size: 20,),
         // Icon(Icons.settings,size: 20,),
       ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.15,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Text('Profile',style: TextStyle(fontSize: 8),),
                      minRadius: 30,
                    ),
                    MaterialButton(
                      shape: StadiumBorder(),
                      color: Colors.grey.shade50,
                      onPressed: (){

                      },
                      child: Row(

                        children: [
                          Container(
                            width: 10,
                              height: 10,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 0),
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                value: 0.8,
                                valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),
                              )
                          ),
                         SizedBox(width: 10,),
                          Text('Finish setup',style: TextStyle(color: Colors.black),),
                          SizedBox(width: 8,),
                          Icon(Icons.arrow_forward_outlined,color: Colors.black,size: 15,)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ),
            Text('Profile Name'),
            SizedBox(height: MediaQuery.of(context).size.height*0.06,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text('0'),
                        SizedBox(width: 8,),
                        Text('Follwers'),
                      ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    child: Row(
                      children: [
                        Text('55'),
                        SizedBox(width: 8,),
                        Text('Follwing'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(onPressed: (){}, child: Text('Add a bio'))),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.alternate_email_outlined,color: Colors.blue,),
                      TextButton(onPressed: (){}, child: Text('Add Twitter')),
                    ],
                  ),
                ),
                  SizedBox(width: 20,),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.integration_instructions_outlined,color: Colors.blue,),
                        TextButton(onPressed: (){}, child: Text('Add Instagram')),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Joined jul 1, 2022'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Clubs'),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
               reusableProfileCard(context),
              Container(
                width: MediaQuery.of(context).size.width*0.47,
                height: MediaQuery.of(context).size.height*0.2,
                child: Card(
                  color: CColor.mainCardColor,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.13,
                          height: MediaQuery.of(context).size.height*0.08,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          // color: CColor.mainCardColor.withOpacity(0.7),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                            child: Center(child: Icon(Icons.person,color: Colors.grey,)),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('SUCCESS',style: TextStyle(color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text('10-25 romms per...',style: TextStyle(color: Colors.grey),),
                      ),
                    ],
                  ),
                ),
              ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Topics'),
                )),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    color: Colors.grey.shade50,
                    onPressed: (){

                    },
                    child: Row(

                      children: [
                        SizedBox(width: 8,),
                        Icon(Icons.add,color: Colors.black,size: 15,),
                        SizedBox(width: 10,),
                        Text('Finish setup',style: TextStyle(color: Colors.black),),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
  Widget reusableProfileCard(context){
    return  Container(
      width: MediaQuery.of(context).size.width*0.47,
      height: MediaQuery.of(context).size.height*0.2,
      child: Card(
        color: CColor.mainCardColor,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width*0.13,
                height: MediaQuery.of(context).size.height*0.08,
                decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(15)
                ),
                // color: CColor.mainCardColor.withOpacity(0.7),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Center(child: Icon(Icons.home,color: Colors.grey,)),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: StadiumBorder(),
                color: Colors.blue,
                onPressed: (){},child: Text('Create a Club',
                style: TextStyle(color: Colors.white),),),
            )
          ],
        ),
      ),
    );
  }
  Widget app_icon(IconData icondata,Function onpress){
    return   Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: IconButton(
        onPressed: onpress,
        icon: Icon(icondata),iconSize: 25,
      ),
    );
  }
}
