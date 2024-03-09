import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'BottomButton.dart';
import 'RoundIconButton.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

 Gender ? selectedGender;
 int height=180;
 int weight=60;

 int age=18;

  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender= Gender.male;
                      });
                    },
                      colour: selectedGender == Gender.male ? kactiveCardColour: kinactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'male'
                      ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender= Gender.female;
                      });
                    },
                      colour: selectedGender == Gender.female ? kactiveCardColour: kinactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE'
                      ),
                  ),
                ),
            ]
            ),
          ),
          Expanded(
            child:ReusableCard(
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('Height',style: klabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      height.toString(),
                        style: knumberTextStyle,
                      ),
                      Text('cm',
                      style: klabelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTickMarkColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),


                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged:  (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      }

                    ),
                  )
                ],
              )
            ),
          ),
          Expanded(child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: klabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: knumberTextStyle,
                        ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           RoundIconButton(
                             icon: FontAwesomeIcons.minus,
                           onPressed: (){
                               setState(() {
                                 weight--;
                               });
                           },),
                           SizedBox(
                             width: 10.0,
                           ),
                           RoundIconButton(
                             icon: FontAwesomeIcons.plus,
                             onPressed: () {
                               setState(() {
                                 weight++;
                               });
                             },
                           )
                         ],
                       )
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: kactiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',
                        style: klabelTextStyle),
                        Text(age.toString(),
                        style: knumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus,
                                onPressed: (){
                              setState(() {
                                age--;
                              });
                                }
                                ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState((){
                                  age++;
                                }
                                );
                                }
                                  )
    ],
                        )
                      ],
                    )
                  ),
                ),
              ]
          ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',onTap:(){
              CalculatorBrain calc= CalculatorBrain(height: height, weight: weight);


            Navigator.push(context,MaterialPageRoute(builder: (context){
              return ResultPage(
                bmiResult: calc.calculatorBMI(),
                  resultText: calc.getResults(),
                  interpretation: calc.getInterpretation(),
              );
            }
            )
            );
          },)
        ],
      )
    );
  }
}












