import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      //padding: EdgeInsets.all(2),
      elevation: 5.0,
      child: Center(child: Icon(icon,color: Color.fromRGBO(251, 205, 79, 1),size: 20,)),
      onPressed: onPressed,
      constraints: BoxConstraints.expand(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: Color.fromRGBO(0, 0, 0, 1),
    );
  }
}
