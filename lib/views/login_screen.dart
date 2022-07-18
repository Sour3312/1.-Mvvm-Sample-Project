// ignore_for_file: prefer__ructors_in_immutables, prefer__literals_to_create_immutables, prefer__ructors, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, deprecated_member_use, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mvvm_with_map/resources/color.dart';
import 'package:mvvm_with_map/resources/components/round_btn.dart';
import 'package:mvvm_with_map/utills/Routes/routes_name.dart';
import 'package:mvvm_with_map/utills/utills.dart';
import 'package:mvvm_with_map/view_model/Auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//get focus on textfield
  FocusNode emailfn = FocusNode();

  FocusNode mobfn = FocusNode();
  FocusNode passfn = FocusNode();

  // var callUtills = Utills(); //when function is not defied static
  TextEditingController _email = TextEditingController();

  TextEditingController _mob = TextEditingController();
  //for hide & unhide password
  ValueNotifier<bool> _obsecurePasswrd = ValueNotifier<bool>(false);

  TextEditingController _passwrd = TextEditingController();

  @override
  //releases RAM when you get out of this page
  void dispose() {
    super.dispose();
    _email.dispose();
    _mob.dispose();
    _passwrd.dispose();
    emailfn.dispose();
    mobfn.dispose();
    passfn.dispose();
    _obsecurePasswrd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.btncolor,
          centerTitle: true,
          title: Text("Login Page im"),
        ),
        body: InkWell(
          onTap: () {
            Utills.toastMessage(
                "Hi Sourabh toastmsg"); //beacuse of method is static(global) so we donot need to import utills file here
            //if toastmessage() is not static(utills.dart) then we have to import utills class (line no 17.) and calls like
            // callUtills.toastMessage("hi sourabh")

            Navigator.pushNamed(context, RoutesName.home);
            // or  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('assets/ff-banner-desktop-2x.png')),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _email,
                    focusNode: emailfn,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      Utills.fieldFocusChange(context, emailfn,
                          mobfn); //or (next line) both are same
                      // FocusScope.of(context).requestFocus(passfn); //we are not going to repeat this again n again so we crete this on utills file
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email id as abc@gmail.com'),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       left: 15.0, right: 15.0, top: 15, bottom: 0),
                //   child: TextFormField(
                //     controller: _mob,
                //     focusNode: mobfn,
                //     keyboardType: TextInputType.number,
                //     onFieldSubmitted: (value) {
                //       Utills.fieldFocusChange(context, mobfn, passfn);
                //     },
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //         labelText: 'Mobile',
                //         hintText: 'Enter your 10 digit mobile no.'),
                //   ),
                // ),
                ValueListenableBuilder(
                    //for hide n unhide
                    valueListenable: _obsecurePasswrd, //for hide n unhide
                    builder: (context, value, child) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: TextFormField(
                          controller: _passwrd,
                          focusNode: passfn,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obsecurePasswrd.value,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              suffixIcon: InkWell(
                                  onTap: () {
                                    _obsecurePasswrd.value =
                                        !_obsecurePasswrd.value;
                                  },
                                  child: Icon(_obsecurePasswrd.value
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility)),
                              hintText: 'Enter secure password'),
                        ),
                      );
                    }),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                        // backgroundColor: AppColors.forgotbtn,
                        fontSize: 15,
                        color: AppColors.blackColour),
                  ),
                ),
                //
                RoundBtn(
                  title: "Pls Submit",
                  onPress: () {
                    if (_email.text.isEmpty) {
                      Utills.flushBarErrorMessage(
                          "Please enter your email first", context);
                    }
                    // else if (_mob.text.isEmpty) {
                    //   Utills.flushBarErrorMessage(
                    //       "Please Enter ur mobile no.", context);
                    // }
                    else if (_passwrd.text.isEmpty) {
                      Utills.flushBarErrorMessage(
                          "Please fill the Password ", context);
                    } else if (_passwrd.text.length < 4) {
                      Utills.flushBarErrorMessage(
                          "Password length must be 8", context);
                    } else {
                      Map data = {
                        'email': _email.text.toString(),
                        'password': _passwrd.text.toString()
                      };
                      authViewMode.loginApi(data, context);
                      print("Api hit $data $context");//
                      Utills.toastMessage("Api Hitted");
                    }
                  },
                ),
                SizedBox(
                  // height: 200,
                  height: height * .2,
                ),
                Text('New User? Create Account')
              ],
            ),
          ),
        ));
  }
}
