import 'package:fitness_app/screens/login.dart';
import 'package:fitness_app/screens/story_board.dart';
import 'package:fitness_app/widgets/custom_button.dart';
import 'package:fitness_app/widgets/custom_input_field.dart';
import 'package:fitness_app/widgets/custom_span_text.dart';
import 'package:fitness_app/widgets/height_dropdown_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/models/global_state.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/material.dart';
class SignUpScreen extends StatefulWidget {
  static String id='signUp_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSpinner=false;
  }
  bool showSpinner=false;
  final _auth=FirebaseAuth.instance;
  String? email;
  String? password;
  bool obscure=true;
  IconData icon1=Icons.remove_red_eye_rounded;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:ModalProgressHUD(
          dismissible: true,
          progressIndicator: const CircularProgressIndicator(
            color: Color.fromRGBO(251, 205, 79, 1),
          ),
          inAsyncCall: showSpinner,
          child:
          Padding(
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
                            onTap: (){Navigator.popAndPushNamed(context, StoryBoard.id);},
                            child: Image.asset('assets/images/back.png',width: 28.47,height: 24.0,)),
                        const SizedBox(height: 10,),
                        const Text('SIGN UP',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 19,color: Color.fromRGBO(251, 205, 79, 1)),),
                        const SizedBox(height: 3,),
                        const Text('Sign up to create your account',style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),),
                        const SizedBox(height: 10,),
                      ]),
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(child: Image.asset('assets/images/avatar1.png')),
                        const SizedBox(height: 22,),
                        InputField(hintText:'Enter first name', id: '',),
                        const SizedBox(height: 14,),
                        InputField(hintText:'Enter last name', id: '',),
                        const SizedBox(height: 14,),
                        InputField(hintText:'Enter email',id:'email'),
                        const SizedBox(height: 14,),
                        InputField(hintText:'Enter password',id:'password',),
                        const SizedBox(height: 14,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: HeightButton(' Height ')),
                            const SizedBox(width: 20),
                            Expanded(child: HeightButton('Age')),
                          ],
                        ),
                        const SizedBox(height: 26,),
                        InputButton(buttonText: 'Sign Up', navigate:() async{
                          email=store.get('email');
                          password=store.get('password');
                          setState(() {
                            showSpinner=true;
                          });
                          try{
                            final newUser= await _auth.createUserWithEmailAndPassword(email:email.toString(), password: password.toString());
                            Navigator.pushNamed(context, LoginScreen.id);
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
                                    title: const Text('Registration Error'),
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

                          }

                          //Navigator.pushNamed(context, LoginScreen.id);
                        },),
                        const SizedBox(height: 16,),
                        SpanText(textSpan1: 'Already have an account?', textSpan2: 'Click here to Login', navigate: (){Navigator.pushNamed(context, LoginScreen.id);},)
                      ]),
                ]),
          ),
        ));
  }
}
