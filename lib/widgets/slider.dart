import 'package:flutter/material.dart';
class Sliders extends StatelessWidget {
  String title , description;
  Sliders({
    required this.title,
    required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //SizedBox(height: 20,),
          Text(title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 31,fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 29.0,right: 29.0),
            child: Text(description,
                textAlign:TextAlign.justify,style: const TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.w400)),
          ),
          SizedBox(height: 25,)
        ],
      ),
    );
  }
}
