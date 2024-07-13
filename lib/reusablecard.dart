import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget cardchild;
  final Function onPress;

  ReusableCard({required this.colour,required this.cardchild,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=> onPress(),
      child: Container(
        child: cardchild,
        decoration: BoxDecoration(
          color: kBottomcontainercolour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}