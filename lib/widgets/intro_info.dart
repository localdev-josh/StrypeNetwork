import 'package:flutter/material.dart';
import 'intro_info_details.dart';

class IntroInfo extends StatelessWidget {
  final Info info;

  IntroInfo({this.info});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
            child: Image.asset(
              info.imagePath,
              width: 230,
            )),
        Container(
          padding: const EdgeInsets.only(left: 45.0, top: 60.0),
          child: Text(
            info.title,
            style: TextStyle(
                color: Color(0XFFA9B4C0), fontSize: 25.0),
          ),
        ),
        Container(
            padding:
            const EdgeInsets.only(left: 45.0, top: 1.0),
            child: Text(
              info.subTitle,
              style: TextStyle(
                  color: Color(0XFF001A3E),
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            )),
        Container(
            padding: const EdgeInsets.only(
                left: 45.0, top: 18.0, right: 40.0),
            child: Text(
              info.story,
              style: TextStyle(
                  color: Color(0XFFB7C0CA),
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}