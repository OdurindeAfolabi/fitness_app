import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ExerciseContent extends StatelessWidget {
  static String id='exercise_content_screen';
  const ExerciseContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String currentDate =DateFormat.yMMMMd('en_US').format(now);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Center(
                  child: Text('Mountain climber',textAlign: TextAlign.center,style: TextStyle(
                    letterSpacing: 1.5,
                    color: Color.fromRGBO(251, 205, 79, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),),
                ),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children:[
                        const Text('DATE',textAlign: TextAlign.center,style: TextStyle(
                          color: Color.fromRGBO(251, 205, 79, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),),
                        const SizedBox(height: 8,),
                        Text(currentDate.toUpperCase(),textAlign: TextAlign.center,style: const TextStyle(
                          color: Color.fromRGBO(251, 205, 79, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),),
                      ],

                    ),
                    Column(
                      children: const [
                        Text('TIME',textAlign: TextAlign.center,style: TextStyle(
                          color: Color.fromRGBO(251, 205, 79, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),),
                        SizedBox(height: 8,),
                        Text('1 hour',textAlign: TextAlign.center,style: TextStyle(
                          color: Color.fromRGBO(251, 205, 79, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),),

                      ],

                    )
                  ],
                ),
              ],
            ),
            Image.asset('assets/images/mountain-large.png',width: 250,height: 252,),
            Column(
              children: [
                const Text('SET',style: TextStyle(
                  color: Color.fromRGBO(251, 205, 79, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),),
                const SizedBox(height: 12,),
                Container(
                  width: 78,
                  height: 35,
                  decoration: const BoxDecoration(
                      color:Color.fromRGBO(252, 227,159, 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: const Center(
                    child: Text(
                      'START',textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 78,
                  height: 35,
                  decoration: const BoxDecoration(
                      color:Color.fromRGBO(252, 227, 159, 1),
                      borderRadius: BorderRadius.all(Radius.circular(4))
                  ),
                  child: const Center(
                    child: Text(
                      'COMPLETE',textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
