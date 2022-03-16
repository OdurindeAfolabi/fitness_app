import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class SpanText extends StatelessWidget {
  final VoidCallback navigate;
  final String textSpan1;
  final String textSpan2;
  const SpanText({Key? key, required this.textSpan1,required this.textSpan2,required this.navigate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: RichText(
        text: TextSpan(
          text: textSpan1,
         style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 10,color: Color.fromRGBO(255, 255, 255, 1)),
          children: <TextSpan>[
            TextSpan(text: textSpan2, style: const TextStyle(fontSize:10,fontWeight:FontWeight.w400,color:Color.fromRGBO(
                251, 205, 79, 1.0))),
          ],
        ),
      ),);
  }
}
