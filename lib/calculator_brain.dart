import 'dart:math';
class CalculatorBrain{

  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi=0;

  String calculatorBMI() {
    _bmi = weight / pow(height / 100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi>=  25){
      return 'Overweight';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }
  String getInterpretation(){
    if(_bmi>25){
      return 'You are a bit fluffy, excercising can be fun';
    }
    else if(_bmi>18.5){
      return 'Normal';
    }
    else{
      return 'Few more clories a day keeps the doctor away!';
    }
  }
}


