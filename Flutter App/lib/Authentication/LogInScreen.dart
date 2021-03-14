import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

import '../Variables.dart';
class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailcontroller =TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors:GradientColors.blue
              ),
            ),
            child: Center(
              child: Image.asset('images/logo.png',height: 100,),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.6,
              margin: EdgeInsets.only(left: 30,right: 30),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0,3),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      SizedBox(height: 50,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.7,
                    child: TextField(
                      controller: emailcontroller,
                      style: myStyel(18,Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Email",
                       prefixIcon: Icon(Icons.email),
                        hintStyle: myStyel(20,Colors.grey,FontWeight.w700)
                      ),
                    ),
                  ),
                  SizedBox(height:20 ,),
                  Container(
                    width: MediaQuery.of(context).size.width/1.7,
                    child: TextField(
                      controller: passwordcontroller,
                      style: myStyel(18,Colors.black),
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          hintStyle: myStyel(20,Colors.grey,FontWeight.w700)
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  InkWell(
                    onTap:(){
                      try{
                        int count=0;
                 FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text.trim(),
                            password: passwordcontroller.text.trim());
                        //
                        //     .then((user) {
                        //   if(user!=null &&user.user.uid!=null){
                        //     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        //   }
                        //
                        // }
                        //
                        // );

                        Navigator.popUntil(context,(route){
                          return count++==2;
                        });
                      }catch(e){
                        var snackbar =SnackBar(content: Text(e.toString(),style: myStyel(20,),));
                        Scaffold.of(context).showSnackBar(snackbar);
                        print("exception"+e.toString());
                      }


                    } ,
                    child: Container(
                      width:  MediaQuery.of(context).size.width/2 ,
                      height: 45,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: GradientColors.beautifulGreen),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text("Sign In",style: myStyel(25,Colors.white),),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
