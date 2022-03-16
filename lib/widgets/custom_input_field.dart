import 'package:flutter/material.dart';
import 'package:fitness_app/models/global_state.dart';
import 'package:flutter/services.dart';
class InputField extends StatelessWidget {
  final String? id;
  final String hintText;
  InputField({required this.hintText, this.id});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(103, 103, 103, 0.68),
          borderRadius: BorderRadius.all(Radius.circular(100))
      ),
      child: TextField(
        autocorrect: true,
        onChanged: (value){
          if(id=='email') {
            store.set('email', value);

        }
          else if(id=='password')  {
            store.set('password', value);
          }
          else if(id=='loginEmail')   {
            store.set('loginEmail', value);
          }
          else if(id=='loginPassword'){
            store.set('loginPassword', value);
          }
        },
        cursorColor: Colors.black,
        style: const TextStyle(color:Color.fromRGBO(214, 214, 214, 1) ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(214, 214, 214, 1),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
