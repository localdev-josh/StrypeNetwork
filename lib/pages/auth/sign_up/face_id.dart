import 'package:flutter/material.dart';
import 'package:strype/pages/auth/sign_up/finger_print.dart';
import 'package:strype/pages/general/intro/intro_page.dart';
import 'package:strype/widgets/page_transitions.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class FaceIdPage extends StatefulWidget {
  @override
  _FaceIdPageState createState() => _FaceIdPageState();
}

class _FaceIdPageState extends State<FaceIdPage> {
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
                    margin: const EdgeInsets.only(top: 170.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(
                            left: 50.0,
                          ),
                          child: Text(
                            "Face Id",
                            style: TextStyle(
                                color: Color(0XFF001A3E),
                                fontSize: 45.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 50.0,
                          ),
                          child: Text(
                            "Enable it?",
                            style: TextStyle(
                                color: Color(0XFFA9B4C0),
                                fontFamily: 'Poppins',
                                fontSize: 25.0),
                          ),
                        ),
                        Stack(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 80),
                              height: height / 3.5,
                              width: width,
                            ),
                            Positioned(
                              top: 20,
                              height: 350,
                              width: width,
                              left: 20,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 20.0, top: 90.0),
                                height: 20,
                                decoration:
                                    BoxDecoration(color: Color(0XFFF5F6F7)),
                              ),
                            ),
                            Positioned(
                              left: 45.0,
                              top: 70.0,
                              child: Image.asset(
                                "assets/images/faceId.png",
                                height: 80,
                              ),
                            ),
                            Positioned(
                              left: 55,
                              top: 190,
                              child: Container(
                                width: width,
                                padding: const EdgeInsets.only(right: 180.0),
                                child: Text(
                                  "Face Id wil allow you login with just a scan of your face",
                                  style: TextStyle(
                                    color: Color(0XFF7A8C9D),
                                    fontSize: 16,
                                    fontFamily: 'Poppins'
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 50.0,
                          ),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5.0, right: 45.0),
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 30.0,
                                    color: Color(0XFFA5B1BD),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context, FadeRoute(page: FingerPrintPage()));
//                                  _checkValidation();
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
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            left: 50.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context, FadeRoute(page: IntroPage()));
                            },
                            child: Text(
                              "Skip Face ID",
                              style: TextStyle(
                                  color: Color(0XFF5B6F84),
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1),
                            ),
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
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0),
                    child: Text(
                      "A verification link has been sent to your Gmail",
                      style:
                          TextStyle(color: Color(0xFF6A7D91), fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      "assets/images/sentmail.png",
                      fit: BoxFit.contain,
                      width: 65.0,
                      alignment: Alignment.bottomCenter,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
