import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/screens/bmi.dart';
import 'package:fitness_app/screens/sign_up.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/custom_input_field.dart';
import 'package:fitness_app/widgets/custom_span_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../models/global_state.dart';
class LoginScreen extends StatefulWidget {
  static String id='login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth=FirebaseAuth.instance;
  bool showSpinner=false;
  late String email;
  late String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner=false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:ModalProgressHUD(
          inAsyncCall: showSpinner,
          child:Padding(
            padding: const EdgeInsets.only(left: 20.0,right:20),
            child: ListView( //I can use a ListView widget here instead
              //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //SizedBox(height: 16,),
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/back.png',width: 28.47,height: 24.0,)),
                        const SizedBox(height: 10,),
                        const Text('LOGIN',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19,color: Color.fromRGBO(251, 205, 79, 1)),),
                        const SizedBox(height: 3,),
                        const Text('to your account',style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                        const SizedBox(height: 30,),
                      ]),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(child: Image.asset('assets/images/avatar2.png')),
                        const SizedBox(height: 14,),
                        InputField(hintText:'Enter email ',id: 'loginEmail',),
                        const SizedBox(height: 14,),
                        InputField(hintText:'Enter password', id: 'loginPassword',),
                        const SizedBox(height: 50,),
                        InputButton(buttonText: 'Login', navigate:() async{
                          email=store.get('loginEmail');
                          password=store.get('loginPassword');
                          setState(() {
                            showSpinner=true;
                          });
                          try{
                            final newUser= await _auth.signInWithEmailAndPassword(email: email.toString(), password: password.toString());
                            Navigator.pushNamed(context, BmiScreen.id);
                            setState(() {
                              showSpinner=false;
                            });
                          }
                          catch(e){
                            setState(() {
                              showSpinner=false;

                            });
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context)=>
                                  AlertDialog(
                                    title: const Text('Login Error'),
                                    content: Text(e.toString()),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                            );
                            print(e);

                          }// Navigator.pushNamed(context, BmiScreen.id);
                        },),
                        const SizedBox(height: 16,),
                        SpanText(textSpan1: 'Don\'t have an account?', textSpan2: 'Click here', navigate: (){Navigator.pushNamed(context, SignUpScreen.id);},)
                      ]),
                ]),
          ),
        ));
  }
}
