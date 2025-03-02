import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  late double _bmi;

  String calculateBMI(){
     _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'OVERWEIGHT';
    }
    else if(_bmi>18){
      return 'NORMAL';
    }
    else{
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'PLEASE EAT HEALTHY AND EXERCISE REGULARLY';
    }
    else if(_bmi>18){
      return 'YOU ARE ABSOLUTELY NORMAL. MAINTAIN THIS LIFESTYLE.';
    }
    else{
      return 'INCREASE YOUR FOOD INTAKE AND EAT HEALTHY.';
    }
  }

}
