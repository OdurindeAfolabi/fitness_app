import 'package:fitness_app/screens/bmi.dart';
import 'package:fitness_app/screens/exercise_content.dart';
import 'package:fitness_app/screens/login.dart';
import 'package:fitness_app/screens/play_exercise.dart';
import 'package:fitness_app/screens/routine.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:fitness_app/screens/side_drawer.dart';
import 'package:fitness_app/screens/sign_up.dart';
import 'package:fitness_app/screens/story_board.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return MaterialApp(
        title: 'Fitness App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),

        initialRoute:StoryBoard.id,
        routes:{
          StoryBoard.id:(context)=> StoryBoard(),
          SignUpScreen.id:(context)=>const SignUpScreen(),
          LoginScreen.id:(context)=>const LoginScreen(),
          BmiScreen.id:(context)=>BmiScreen(),
          RoutineScreen.id:(context)=>const RoutineScreen(),
          PlayExercise.id:(context)=>const PlayExercise(),
          ExerciseContent.id:(context)=>const ExerciseContent(),
        }

    );

  }
}

