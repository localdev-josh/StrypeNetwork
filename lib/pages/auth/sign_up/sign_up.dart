import 'package:flutter/material.dart';
import 'package:strype/pages/auth/sign_up/face_id.dart';
import 'package:strype/pages/general/intro/intro_page.dart';
import 'package:strype/widgets/page_transitions.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // form-key for the password-less verification
  final _formKey = GlobalKey<FormState>();

  // email variable store
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraint) {
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;

        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height),
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
              ),
              Positioned(
                width: width / 2,
                left: -20.0,
                top: 120.0,
                child: Image.asset(
                  "assets/images/logo/logo_icon.png",
                  fit: BoxFit.contain,
                  height: 50,
                  width: 50,
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 50.0, top: 170.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Sign up",
                          style: TextStyle(
                              color: Color(0XFF001A3E),
                              fontSize: 45.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "to start working",
                          style: TextStyle(
                              color: Color(0XFFA9B4C0),
                              fontFamily: 'Poppins',
                              fontSize: 25.0),
                        ),
                        SizedBox(
                          height: height / 5.5,
                        ),
                        Form(key: _formKey,child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
//                              controller: email,
                            ),
                            Container(
                              child: TextFormField(
                                style: TextStyle(
                                  decorationColor: Colors.grey,
                                ),
                                decoration: InputDecoration(
                                    labelText: "Enter email address",
                                    border: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.deepOrange))),
//                                validator: ,
                              ),
                            ),
                            SizedBox(
                              height: 100.0,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, FadeRoute(page: FaceIdPage()));
//                            _checkValidation();
                              },
                              child: Material(
                                color: Color(0XFF002143),
                                elevation: 4.0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45.0, vertical: 15.0),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: 60.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context, FadeRoute(page: IntroPage()));
                          },
                          child: Text(
                            "Back to intro page",
                            style: TextStyle(
                                color: Color(0XFF5B6F84),
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  void _checkValidation() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0XFF737373),
            height: 220.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0))),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.deepOrange,
                    child: PinEntryTextField(
                      fontSize: 30.0,
                      fieldWidth: 60,
                      onSubmit: (String pin) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Pin"),
                                content: Text('Pin entered is $pin'),
                              );
                            }); //end showDialog()
                      }, // end onSubmit
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "assets/images/sentmail.png",
                      fit: BoxFit.contain,
                      width: 65.0,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: Text(
                      "A verification link has been sent to your Gmail",
                      style:
                          TextStyle(color: Color(0xFF6A7D91), fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
