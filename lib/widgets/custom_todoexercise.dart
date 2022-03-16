import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class TodoWidget extends StatelessWidget {
  final String exercise;
  final String imgSrc;
  final bool? colored;
  final VoidCallback? navigate;
  const TodoWidget({required this.imgSrc, required this.exercise,this.colored=false,this.navigate});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String currentDate =DateFormat.yMMMMd('en_US').format(now);
    return Container(
      height: 86,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(251, 205, 79, 1),
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Row(
        children: [
          Container(
            width: 84,
            height: 86,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color.fromRGBO(70, 70, 70, 1),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              image: DecorationImage(image: AssetImage(imgSrc)),
            ),
          ),
          const SizedBox(width: 3,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exercise,textAlign: TextAlign.center,style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 15
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [
                  Text(currentDate,textAlign: TextAlign.center,style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 11
                  ),),
                  const SizedBox(width: 80,),
                  InkWell(
                    onTap: navigate,
                    child: Container(
                      width: 58,
                      height: 29,
                      decoration: BoxDecoration(
                          color: colored!?const Color.fromRGBO(235, 87, 87, 1):const Color.fromRGBO(196, 196, 196, 1),
                          borderRadius: const BorderRadius.all(Radius.circular(6))
                      ),
                      child: const Center(
                        child: Text(
                          'START',textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 11
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
