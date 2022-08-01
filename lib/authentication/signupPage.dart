import 'package:animate_do/animate_do.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:paidlance/authentication/loginPage.dart';
import 'package:paidlance/homepage/landingPage.dart';

class SignUpPage extends StatefulWidget {
  static const String route = '/signuppage';
  static const id = 'signuppage';
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController controller = TextEditingController();
  bool checkbox = false;
  // const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopScreenLandingPage();
      } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
        return DesktopScreenLandingPage();
      } else {
        return MobileScreenLandingPage();
      }
    });

  }
}

class MobileScreenLandingPage extends StatefulWidget {
  @override
  State<MobileScreenLandingPage> createState() =>
      _MobileScreenLandingPageState();
}

class _MobileScreenLandingPageState extends State<MobileScreenLandingPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,

                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.45,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: commonTextField(
                            hint: 'First Name',
                            lable: 'First Name',
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width *0.45,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: commonTextField(
                            hint: 'Last Name',
                            lable: 'Last Name',
                          ),
                        )
                      ],
                    ),
                    commonTextField(
                      hint: 'Email Address',
                      lable: 'Email Address',
                    ),
                    //
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            textFieldController: controller,
                            formatInput: false,
                            // maxLength: 9,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            cursorColor: Colors.black,
                            inputDecoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(bottom: 15, left: 0),
                              border: InputBorder.none,
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 16),
                            ),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    commonTextField(
                      hint: 'Password',
                      lable: 'Password',
                    ),
                    SizedBox(height: 10,),
                    _CommonButton(
                      color: Colors.black,
                      title: 'SIGNUP',
                      textcolor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'By signing up I agree to share my personal details publicly to receive contact'
                        'and messages calls emails or even sms anytime by other professionals and platform members',
                        textAlign: TextAlign.justify,
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
                    'Already have account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/loginpage');
                      },
                      child: Text(
                        'Login Here',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DesktopScreenLandingPage extends StatelessWidget {
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
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'SIGNUP',
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
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height * 0.82,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: commonTextField(
                            hint: 'First Name',
                            lable: 'First Name',
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height * 0.12,
                          child: commonTextField(
                            hint: 'Last Name',
                            lable: 'Last Name',
                          ),
                        )
                      ],
                    ),
                    commonTextField(
                      hint: 'Email Address',
                      lable: 'Email Address',
                    ),
                    //
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 7),
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);
                            },
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle: TextStyle(color: Colors.black),
                            textFieldController: controller,
                            formatInput: false,
                            // maxLength: 9,
                            keyboardType: TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            cursorColor: Colors.black,
                            inputDecoration: InputDecoration(

                              contentPadding:
                                  EdgeInsets.only(bottom: 15, left: 0),
                              border: OutlineInputBorder(),
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 16),
                            ),
                            onSaved: (PhoneNumber number) {
                              print('On Saved: $number');
                            },
                          ),
                        ),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 40,
                            width: 1,
                            color: Colors.black.withOpacity(0.13),
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    commonTextField(
                      hint: 'Password',
                      lable: 'Password',
                    ),
                    _CommonButton(
                      color: Colors.black,
                      title: 'SIGNUP',
                      textcolor: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'By signing up I agree to share my personal details publicly to receive contact'
                        'and messages calls emails or even sms anytime by other professionals and platform members',
                        textAlign: TextAlign.justify,
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
                    'Already have account? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/loginpage');
                      },
                      child: Text(
                        'Login Here',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
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
  _CommonButton({this.title, this.color, this.textcolor});
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
        onPressed: () {},
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
