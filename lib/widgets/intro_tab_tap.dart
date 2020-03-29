import 'package:flutter/material.dart';
import 'package:strype/widgets/container_styles.dart';

class IntroTab extends StatelessWidget {
  final bool isSelected;
  final Function onTabTap;

  IntroTab({this.isSelected = false, this.onTabTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabTap,
      child: AnimatedContainer(
        margin: const EdgeInsets.only(right: 8.0),
        decoration: isSelected ? selectedTabStyle : defaultTabStyle,
        duration: const Duration(milliseconds: 300),
        child: isSelected ? selectedContainerStyle : defaultContainerStyle,
      ),
    );
  }
}