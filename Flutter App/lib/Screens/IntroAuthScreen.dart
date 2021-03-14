import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:zoommetting/Authentication/navigateauthscreen.dart';

import '../Variables.dart';
class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome",
          body: "Welcome to Zoom , the best video conference app",
          image: Center(
            child: Image.asset('images/welcome.png',height: 175,),
          ),
          decoration: PageDecoration(
            bodyTextStyle: myStyel(20,Colors.black),
             titleTextStyle: myStyel(20,Colors.black)
          ),
        ),
        PageViewModel(
          title: "Join or start meeting",
          body: "Easy to use interface ,join or start meetings in a fast time ",
          image: Center(
            child: Image.asset('images/conference.png',height: 175,),
          ),
          decoration: PageDecoration(
              bodyTextStyle: myStyel(20,Colors.black),
              titleTextStyle: myStyel(20,Colors.black)
          ),
        ),
        PageViewModel(
          title: "Security",
          body: "Your Security is important for us .our services are secure and reliable",
          image: Center(
            child: Image.asset('images/secure.jpg',height: 175,),
          ),
          decoration: PageDecoration(
              bodyTextStyle: myStyel(20,Colors.black),
              titleTextStyle: myStyel(20,Colors.black)
          ),
        ),
      ],
      onDone: (){
   Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigateAuthScreen()));
      },
      onSkip: (){

      },
      showSkipButton: true,
      showNextButton: true,
      skip: const Icon(Icons.skip_next,size: 45,),
      next:const Icon(Icons.arrow_forward_ios),
      done:Text("Done",style: myStyel(20,Colors.black),),
    );
  }
}
