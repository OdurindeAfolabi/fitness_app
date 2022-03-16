import 'package:flutter/material.dart';
class InputButton extends StatelessWidget {
  final VoidCallback navigate;
  final String buttonText;
  const InputButton({required this.buttonText,required this.navigate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(251, 205, 79, 1),
          borderRadius: BorderRadius.all(Radius.circular(100))
      ),
      child:TextButton(onPressed: navigate, child: Text(buttonText,textAlign:TextAlign.center,style: const TextStyle(
        fontSize: 14,fontWeight: FontWeight.w700,color: Color.fromRGBO(0, 0, 0, 1)
      ),),

    ) ,
    );
  }
}
