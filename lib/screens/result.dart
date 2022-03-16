
import 'package:fitness_app/screens/routine.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/custom_circle_avatar.dart';
import 'package:fitness_app/widgets/custom_input_field.dart';
import 'package:fitness_app/widgets/navigation_drawer_widget.dart';
import 'package:fitness_app/widgets/reusable_card.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';

import '../models/global_state.dart';
class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);

  final int value=-10;
  double bmiInt=double.parse(store.get('bmi').toString());
  final String bmi=store.get('bmi').toString();

  @override
  Widget build(BuildContext context) {
    final String bmiValue=(18.5-bmiInt).toStringAsFixed(1);
    final now = DateTime.now();
    String currentDate =DateFormat.yMMMMd('en_US').format(now);
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        body: Builder(
            builder: (context) {
              return InkWell(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/black1.png'),fit: BoxFit.cover
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0,top: 18,right: 18),
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/link.png',width: 20,height: 17.46,),
                          ],
                        ),
                        const SizedBox(height: 50,),
                        Column(
                          children: [
                            const Text('TODAY',textAlign: TextAlign.center,style: TextStyle(
                                letterSpacing: 2,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(251, 205, 79, 1)
                            ),),
                            const SizedBox(height: 4,),
                            Text(currentDate.toUpperCase(),
                              textAlign: TextAlign.center,style: const TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(251, 205, 79, 1)
                              ),),
                            const SizedBox(height: 11,),
                            const Divider(
                              height: 1,
                              //thickness: 1,
                              color: Color.fromRGBO(251, 205, 79, 1),
                            ),
                            const SizedBox(height: 30,),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    const CircleAvatars(Color.fromRGBO(251, 205, 79, 1), 'CURRENT'),
                                    const SizedBox(height: 8,),
                                    Text(bmi,textAlign: TextAlign.center,style: const TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w700,color: Color.fromRGBO(255, 255, 255, 1)
                                    ),)
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(bmiValue,textAlign: TextAlign.center,style: const TextStyle(
                                        fontSize: 14,fontWeight: FontWeight.w700,color: Color.fromRGBO(214, 214, 214, 1)
                                    ),),
                                    SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        activeTrackColor: const Color.fromRGBO(251, 205, 79, 1),
                                        inactiveTrackColor: const Color.fromRGBO(196, 196, 196, 1),
                                        thumbColor: const Color.fromRGBO(237, 85, 0, 1),
                                        overlayColor: const Color(0x29EB1555),
                                        thumbShape:
                                        const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                                        overlayShape:
                                        const RoundSliderOverlayShape(overlayRadius: 20.0),
                                      ),
                                      child: Slider(
                                        value: bmiInt.toDouble(),
                                        min: 0,
                                        max: 50, onChanged: (double value) {},
                                      ),
                                    ),
                                    Text('You need $bmiValue points',
                                      style:
                                      const TextStyle(color: Color.fromRGBO(214, 214, 214, 1),fontSize: 11,fontWeight:FontWeight.w400),),
                                    const Text('to reach your goal',
                                      style:
                                      TextStyle(color: Color.fromRGBO(214, 214, 214, 1),fontSize: 11,fontWeight:FontWeight.w400),)
                                  ],
                                ),
                                Column(
                                  children: const [
                                    CircleAvatars(Color.fromRGBO(237, 85, 0, 1), 'GOAL'),
                                    SizedBox(height: 8,),
                                    Text('18.5',textAlign: TextAlign.center,style: TextStyle(
                                        fontSize: 18,fontWeight: FontWeight.w700,color: Color.fromRGBO(255, 255, 255, 1)
                                    ),)
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8,),
                            ReusableCard(colour: const Color.fromRGBO(251, 205, 79, 1),
                                cardChild: SizedBox(
                                  height:122,
                                  width: 135,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  [
                                      Image.asset('assets/images/heart.png',height: 60,width: 60,),
                                      const SizedBox(height:8,),
                                      Text(store.get('result').toString(),textAlign: TextAlign.center,style: const TextStyle(
                                          fontSize: 20,fontWeight: FontWeight.w600,color: Color.fromRGBO(0, 0, 0, 1)
                                      ),),
                                      const Text('Your Current BMI',textAlign: TextAlign.center,style: TextStyle(
                                          fontSize: 11,fontWeight: FontWeight.w600,color: Color.fromRGBO(0, 0, 0, 1)
                                      ),),
                                    ],
                                  ),
                                ),
                                onPress: (){}),
                            const SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Text('Daily Weight',textAlign: TextAlign.justify,style: TextStyle(
                                      color: Color.fromRGBO(214, 214, 214, 1),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14
                                  ),),
                                  const SizedBox(height: 5,),
                                  InputField(hintText:'Enter your daily weight'),
                                  const SizedBox(height: 22,),
                                  InputButton(buttonText: 'START ROUTINE', navigate:(){
                                    Navigator.pushNamed(context, RoutineScreen.id);
                                  })
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
        bottomNavigationBar:
        Container(
          //height: 70,
          constraints:  const BoxConstraints.expand(height: 70),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(251, 205, 79, 1)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/heart.png',width: 26.25,height: 23.59,),
                  const Text('BMI',textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromRGBO(0, 0, 0, 1)
                  ),),
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 58,
                      width: 58,
                      child: CircleAvatar(
                          backgroundColor: const Color.fromRGBO(243, 240, 240, 1),
                          child: Image.asset('assets/images/home.png',width: 25.55,height: 24,)),
                    ),
                  ),
                  const Text('Home',textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromRGBO(0, 0, 0, 1)
                  ),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/setting.png',width: 24,height: 24,),
                  const Text('Setting',textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromRGBO(0, 0, 0, 1)
                  ),),
                ],
              ),
            ],
          ),
        )
    );
  }
}
