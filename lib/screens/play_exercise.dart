import 'package:fitness_app/screens/exercise_content.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_todoexercise.dart';
class PlayExercise extends StatelessWidget {
  static String id='play_exercise_screen';
  const PlayExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String currentDate =DateFormat.yMMMMd('en_US').format(now);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/black3.png'),fit: BoxFit.contain
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,),
          child: ListView(
            children: [
              const SizedBox(height: 181,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  const Text('Exercise To Do',textAlign: TextAlign.center,style: TextStyle(
                    color: Color.fromRGBO(251, 205, 79, 1),
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                  ),),
                  const SizedBox(height: 15,),
                  const Text('Today',textAlign: TextAlign.center,style: TextStyle(
                    color: Color.fromRGBO(251, 205, 79, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),),
                  Text(currentDate,textAlign: TextAlign.center,style: const TextStyle(
                    color: Color.fromRGBO(251, 205, 79, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
              const SizedBox(height: 6,),
              const Divider(height: 1,color:Color.fromRGBO(251, 205, 79, 1),),
              const SizedBox(height: 44,),
              Column(
                children: [
                  TodoWidget(imgSrc: 'assets/images/mountain.png', exercise: 'Mountain climber',
                    colored: true,
                    navigate: (){
                    Navigator.pushNamed(context, ExerciseContent.id);
                    },
                  ),
                  const SizedBox(height: 12,),
                  const TodoWidget(imgSrc: 'assets/images/reverse.png', exercise: 'Reverse Crunch'),
                  const SizedBox(height: 12,),
                  const TodoWidget(imgSrc: 'assets/images/hanging.png', exercise: 'Hanging Knee Raise'),
                  const SizedBox(height: 12,),
                  const TodoWidget(imgSrc: 'assets/images/abs.png', exercise: 'Abs Roll-out'),
                  const SizedBox(height: 12,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
