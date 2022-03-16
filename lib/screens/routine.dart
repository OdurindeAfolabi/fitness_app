import 'package:fitness_app/screens/play_exercise.dart';
import 'package:fitness_app/widgets/custom_calendar_dropdown.dart';
import 'package:fitness_app/widgets/exercise_element.dart';
import 'package:flutter/material.dart';
class RoutineScreen extends StatefulWidget {
  static String id='routine_screen';
  const RoutineScreen({Key? key}) : super(key: key);

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body:SafeArea(child:Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/images/black2.png'),fit: BoxFit.contain
              )
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: [
              const SizedBox(height: 138,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'TIME',textAlign: TextAlign.center,style:
                      TextStyle(color: Color.fromRGBO(251, 205, 79, 1),
                          fontWeight: FontWeight.w500,fontSize: 16
                      ),
                      ),
                      const SizedBox(height: 5,),
                      CalendarDropDown()
                    ],
                  ),
                  SizedBox(
                    width: 65,
                    height: 65,
                    child: InkWell(
                      onTap:(){
                        Navigator.pushNamed(context,PlayExercise.id);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color.fromRGBO(251, 205, 79, 0.2),
                        child: Text('START',textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 13,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'DAY',textAlign: TextAlign.center,style:
                      TextStyle(color: Color.fromRGBO(251, 205, 79, 1),
                          fontWeight: FontWeight.w500,fontSize: 16
                      ),
                      ),
                      const SizedBox(height: 5,),
                      CalendarDropDown()
                    ],
                  )
                ],
              ),
              const SizedBox(height: 7),
              ExerciseElement(imgSrc: 'assets/images/mountain.png', exerciseText: 'Mountain climber'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/reverse.png', exerciseText: 'Reverse crunch'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/abs.png', exerciseText: 'Abs roll-out'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/hanging.png', exerciseText: 'Hanging knee raise'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/plank.png', exerciseText: 'Plank'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/kneetucks.png', exerciseText: 'Knee tucks'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/deadbug.png', exerciseText: 'Dead bug'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/legraise.png', exerciseText: 'Leg raise'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/russiantwist.png', exerciseText: 'Russian Twists'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/sideplank.png', exerciseText: 'Side plank'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/bird.png', exerciseText: 'Bird-dog'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),
              ExerciseElement(imgSrc: 'assets/images/crunches.png', exerciseText: 'Crunches'),
              const Divider(color: Color.fromRGBO(251, 205, 79, 0.5),thickness: 1,),
              const SizedBox(height: 16,),

            ],
          ),
        )
    ));
  }
}
