import 'package:flutter/material.dart';
import 'package:paidlance/authentication/signupPage.dart';
import 'package:paidlance/homepage/landingPage.dart';

class LoginPage extends StatefulWidget {
  static const String route = '/loginpage';
  static const id = 'loginpage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // final\
  bool checkbox = false;
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(
          height: 1, letterSpacing: 1, backgroundColor: Colors.black));
  // const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Scaffold();
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktoploginScreen();
      } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
        return DesktoploginScreen();
      } else {
        return MobileLoginScreen();
      }
    });
  }
}

class commonTextField extends StatelessWidget {
  String hint;
  String lable;
  commonTextField({this.lable, this.hint});
  // const commonTextField({super key}));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: TextFormField(
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black54),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            label: Text(lable),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: BorderSide(color: Colors.grey, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}

class _CommonButton extends StatelessWidget {
  Color color;
  String title;
  Color textcolor;
  Function onprss;
  _CommonButton({this.title, this.color, this.textcolor, this.onprss});
  // const _CommonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.055,
      // color: Colors.black,
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        // style:
        color: color,
        onPressed: onprss,
        child: Text(
          title,
          style: TextStyle(
              color: textcolor,
              letterSpacing: 1,
              height: 1,
              fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}


class DesktoploginScreen extends StatefulWidget {
  @override
  State<DesktoploginScreen> createState() =>
      _DesktoploginScreenState();
}

class _DesktoploginScreenState extends State<DesktoploginScreen> {
  bool checkbox = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                      Align(
                        // alignment: Alignment.topLeft,
                        child: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, '/homepage');
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Container(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.height * 0.43,
                  color: Colors.white,
                  child: Column(
                    children: [
                      commonTextField(
                          hint: 'Email Address', lable: 'Email Address'),
                      commonTextField(
                        hint: 'Password',
                        lable: 'Password',
                      ),
                     SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                      _CommonButton(
                        color: Colors.black,
                        title: 'LOGIN',
                        textcolor: Colors.white,
                        onprss: () {
                          Navigator.pushNamed(context, '/signuppage');
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Divider(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Checkbox(
                                    value: this.checkbox,
                                    onChanged: (bool checkbox) {
                                      setState(() {
                                        this.checkbox = checkbox;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                  'REMEMBER ME',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              'FORGET PASSWORDS?',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need new account? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signuppage');
                        },
                        child: Text(
                          'SIGNUP Here',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class MobileLoginScreen extends StatefulWidget {
  @override
  State<MobileLoginScreen> createState() =>
      _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  bool checkbox = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(

                  margin: EdgeInsets.symmetric(horizontal:20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/homepage');
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white,
                          )),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              'Clubhouse',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                      Text('         '),
                    ],
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  width: MediaQuery.of(context).size.width ,
                  height: MediaQuery.of(context).size.height * 0.41,

                  child: Column(
                    children: [
                      commonTextField(
                          hint: 'Email Address', lable: 'Email Address'),
                      commonTextField(
                        hint: 'Password',
                        lable: 'Password',
                      ),

                      _CommonButton(
                        color: Colors.black,
                        title: 'LOGIN NOW',
                        textcolor: Colors.white,
                        onprss: () {
                          // Navigator.pushNamed(context, SignUpPage.id);
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              // child: Row(
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(left: 5),
                              //       child: Checkbox(
                              //         value: this.checkbox,
                              //         onChanged: (bool checkbox) {
                              //           setState(() {
                              //             this.checkbox = checkbox;
                              //           });
                              //         },
                              //       ),
                              //     ),
                              //     // Text(
                              //     //   'REMEMBER ME',
                              //     //   style: TextStyle(fontSize: 10),
                              //     // )
                              //   ],
                              // ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                'FORGET PASSWORDS?',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Need new account? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signuppage');
                        },
                        child: Text(
                          'SIGNUP Here',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
