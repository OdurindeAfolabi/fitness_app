import 'package:fitness_app/main.dart';
import 'package:fitness_app/screens/sign_up.dart';
import 'package:fitness_app/widgets/slider.dart';
import 'package:flutter/material.dart';

import '../models/slider_model.dart';
class StoryBoard extends StatefulWidget {
  static String id='story_screen';
  @override
  State<StoryBoard> createState() => _StoryBoardState();
}

class _StoryBoardState extends State<StoryBoard> {
  List<SliderModel> slides=<SliderModel>[];
  int currentIndex=0;
  PageController _controller=PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=PageController(initialPage: currentIndex);
    slides=getSlides();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage('assets/images/board$currentIndex.png'),
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value){
                    setState(() {
                      currentIndex=value;
                    });
                  },
                  controller: _controller,
                  itemCount: slides.length,
                  itemBuilder: (context,index){
                    return Sliders(
                        title:slides[index].getTitle(),
                        description:slides[index].getDescription()
                    );
                  }
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 18,right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, SignUpScreen.id);
                    }, child:
                    const Text('Skip',style: TextStyle(color: Colors.white),)),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      List.generate(slides.length, (index) => buildDot(index,context)),
                    ),
                    TextButton(onPressed: (){
                      if(currentIndex==slides.length-1){
                        Navigator.pushReplacementNamed(context,SignUpScreen.id);
                      }
                      _controller.nextPage(duration:const Duration(milliseconds:100), curve: Curves.bounceIn);
                    }, child:
                    const Text('Next',style: TextStyle(color: Colors.white))),
                  ],
                ),
              ),
            ),
            // Container(
            //   height: 60,
            //   margin: EdgeInsets.all(40),
            //   width: double.infinity,
            //   color:Colors.green,
            //   child: MaterialButton(
            //     child: Text(currentIndex==slides.length-1?" Continue ":"Next"),
            //     onPressed: () {
            //       if(currentIndex==slides.length-1){
            //         Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>MyApp()));
            //       }
            //       _controller.nextPage(duration:const Duration(milliseconds:100), curve: Curves.bounceIn);
            //     },
            //     textColor: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(25),
            //     ),
            //     ),
            // )
          ],
        ),
      ),
    );
  }
  Container buildDot(int index,BuildContext context){
    return Container(
      height: 9,
      width: currentIndex==index?14:9,
      margin:EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(196, 196, 196, 1),
      ),
    );
  }

}
