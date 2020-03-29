import 'package:flutter/material.dart';
import 'package:strype/pages/auth/sign_up/sign_up.dart';
import 'package:strype/widgets/intro_info.dart';
import 'package:strype/widgets/intro_info_details.dart';
import 'package:strype/widgets/intro_tab_tap.dart';
import 'package:strype/widgets/page_transitions.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int selectedTabIndex = 0;

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
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/logo/logo2.png",
                      fit: BoxFit.contain,
                      height: 200,
                      width: 180,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 45.0, right: 50.0, bottom: 67.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            IntroTab(
                              isSelected: selectedTabIndex == 0,
                              onTabTap: () {
                                onTabTap(0);
                              },
                            ),
                            IntroTab(
                              isSelected: selectedTabIndex == 1,
                              onTabTap: () {
                                onTabTap(1);
                              },
                            ),
                            IntroTab(
                              isSelected: selectedTabIndex == 2,
                              onTabTap: () {
                                onTabTap(2);
                              },
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                SlideRightRoute(page : SignUp()
                            ));
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Skip",
                                style: TextStyle(
                                    color: Color(0XFF6E8094),
                                    fontSize: 19.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                top: height / 4.4,
                left: 0,
                width: width,
                child: Container(
                  child: ListView(
                      shrinkWrap: true, children: getList(selectedTabIndex)),
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  List<Widget> getList(index) {
    return [
      [
        IntroInfo(info: explorePeeps),
      ],
      [
        IntroInfo(info: personalizedChatRoom),
      ],
      [
        IntroInfo(info: personalizedChatRoom),
      ]
    ][index];
  }

  onTabTap(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
}
