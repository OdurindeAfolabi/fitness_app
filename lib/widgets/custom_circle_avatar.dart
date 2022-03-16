import 'package:flutter/material.dart';
class CircleAvatars extends StatelessWidget {
  final Color colour;
  final String hintText;
  const CircleAvatars(this.colour, this.hintText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: CircleAvatar(
        backgroundColor: colour,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(hintText,textAlign:TextAlign.center,style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 1),fontWeight: FontWeight.w500,fontSize: 11),),
            const SizedBox(height: 2,),
            Image.asset('assets/images/weight.png',width: 24,height: 24,)
          ],
        ),
      ),
    );
  }
}
