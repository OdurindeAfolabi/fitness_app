import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ExerciseElement extends StatefulWidget {
  final String imgSrc;
  final String exerciseText;
  ExerciseElement({Key? key, required this.imgSrc, required this.exerciseText}) : super(key: key);

  @override
  State<ExerciseElement> createState() => _ExerciseElementState();
}

class _ExerciseElementState extends State<ExerciseElement> {
  bool toggle=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Color colour=toggle?const Color.fromRGBO(196, 196, 196, 0.5):const Color.fromRGBO(251,205,79,1);
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width:double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 56,
              height: 57,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: const Color.fromRGBO(70, 70, 70, 1),
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(image: AssetImage(widget.imgSrc)),
              ),
            ),
            Text(widget.exerciseText,textAlign: TextAlign.center,style: const TextStyle(
              color: Color.fromRGBO(214, 214, 214, 1),
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),),
            InkWell(
              onTap:(){
                setState(() {
                  toggle=!toggle;
                });
              },
              child: Container(
                width: 61,
                height: 30,
                decoration: BoxDecoration(
                  color: colour,
                  borderRadius: const BorderRadius.all(Radius.circular(5))
                ),
                child: const Center(
                  child: Text(
                    'ADD',textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

