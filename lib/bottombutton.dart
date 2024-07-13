import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttontitle;

  BottomButton({required this.onTap, required this.buttontitle}){

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>onTap(),
      child: Container(
        child: Center(child: Text(buttontitle, style: kLargeButtonTextStyle,)),
        color: Color(0xFFEB1555),
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomconatinerheight,
      ),
    );
  }
}