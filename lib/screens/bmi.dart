import 'package:fitness_app/screens/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitness_app/widgets/icon_content.dart';
import 'package:fitness_app/widgets/reusable_card.dart';
import 'package:fitness_app/constants.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/round_icon_button.dart';
import 'package:fitness_app/calculator_brain.dart';

import '../models/global_state.dart';

enum Gender {
  male,
  female,
}

class BmiScreen extends StatefulWidget {
  static String id='Bmi_Screen';
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  Gender selectedGender=Gender.male;
  int height = 187;
  int weight = 64;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('BMI CALCULATOR'),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/black.png'),fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0,left: 16,right: 16,bottom: 10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('BODY PROFILE',textAlign:TextAlign.center,style: TextStyle(
                  color: Color.fromRGBO(251, 205, 79, 1),fontSize: 29,fontWeight: FontWeight.w700
              ),

              ),
              SizedBox(height: 20,),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: Colors.transparent,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          color: Color.fromRGBO(251, 201, 79, 1),
                        ),
                      ),
                      SizedBox(height: 6,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: TextStyle(
                              color: Color.fromRGBO(255, 116, 37, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 26
                            ),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              color: Color.fromRGBO(255, 116, 37, 1),
                            ),
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Color.fromRGBO(255, 116, 37, 1),
                          inactiveTrackColor: Color.fromRGBO(227, 217, 217, 1),
                          thumbColor: Color.fromRGBO(237, 85, 0, 1),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 20.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 250.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                              store.set('height',height);
                            });
                          },
                        ),
                      ),
                    ],
                  ), onPress: () {  },
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                        store.set('weight',weight);

                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                      store.set('weight', weight);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ), onPress: () {  },
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'AGE',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(
                                            () {
                                          age--;
                                          store.set('age', age);
                                        },
                                      );
                                    },
                                  ),
                                ),
                                // SizedBox(
                                //   width: 10.0,
                                // ),
                                Expanded(
                                  child: RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                          store.set('age', age);
                                        });
                                      }),
                                )
                              ],
                            )
                          ],
                        ), onPress: () {  },
                      ),
                    ),
                  ],
                ),
              ),
              InputButton(
                buttonText: 'CALCULATE',
                navigate: () {
                  CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
                  String bmi=calc.calculateBMI();
                  store.set('bmi',bmi);
                  String result=calc.getResult();
                  store.set('result',result);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ResultPage(
                        // bmiResult: calc.calculateBMI(),
                        // resultText: calc.getResult(),
                        // interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
