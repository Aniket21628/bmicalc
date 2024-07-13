import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusablecard.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottombutton.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female,
  initial,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedgender = Gender.initial;
  int height = 180;
  int weight = 60;
  int age=18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: new ReusableCard(
                        colour: Gender.male == selectedgender
                            ? kActivecolor
                            : kInactivecolor,
                        cardchild: iconcontent(
                            icon: FontAwesomeIcons.mars, label: 'MALE'),
                        onPress: () {
                          setState(() {
                            selectedgender = Gender.male;
                          });
                        },
                      )
                  ),
                  Expanded(
                    child: new ReusableCard(
                      colour: Gender.female == selectedgender
                          ? kActivecolor
                          : kInactivecolor,
                      cardchild: iconcontent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      onPress: () {
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: new ReusableCard(colour: kActivecolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT', style: kLabeltextstyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kHeavyText,),
                          Text('cm', style: kLabeltextstyle,),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          overlayColor: Color(0x15EB1555),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        child: Slider(value: height.toDouble(), min: 120.0, max: 220.0,
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newvalue){
                                setState(() {
                                  height = newvalue.round();
                                });
                            }),
                      )
                    ],
                  ),
                  onPress: () {},)
            ),
            Expanded(child: Row(
              children: <Widget>[
                Expanded(
                  child: new ReusableCard(colour: kActivecolor,
                    cardchild : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: kLabeltextstyle,),
                        Text(weight.toString(), style: kHeavyText,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(Icons.remove, color: Colors.white,),
                                onPressed: (){
                              setState(() {
                                weight--;
                              });
                            }),
                            FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(Icons.add, color: Colors.white,),
                                onPressed: (){
                              setState(() {
                                weight++;
                              });
                            })
                          ],
                        )
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                    child: new ReusableCard(colour: kActivecolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',style: kLabeltextstyle,),
                          Text(age.toString(), style: kHeavyText,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FloatingActionButton(
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(Icons.remove, color: Colors.white,),
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              FloatingActionButton(
                                  backgroundColor: Color(0xFF4C4F5E),
                                  child: Icon(Icons.add, color: Colors.white,),
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                      onPress: () {},
                    )
                ),
              ],
            ),),
            BottomButton(onTap: (){
              CalculatorBrain calc = new CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            }, buttontitle: 'CALCULATE',)
          ],
        )
    );
  }
}


