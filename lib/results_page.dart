import 'package:bmicalc/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusablecard.dart';
import 'bottombutton.dart';
class ResultsPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation}){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft ,
              child: Text('Your Result', style: kTitleTextStyle,)),),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActivecolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(resultText, style: resultTextStyle,),
                    Text(bmiResult, style: kBMITextstyle,),
                    Text(interpretation, style: kBMIbodyTextStyle, textAlign: TextAlign.center,),
                  ],
                ),
                onPress: (){},
              )
          ),
          BottomButton(onTap: (){
            Navigator.pop(context);
          }, buttontitle: 'RE-CALCULATE')
        ],
      )
    );
  }
}
