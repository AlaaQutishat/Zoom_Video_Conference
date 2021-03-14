import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:uuid/uuid.dart';
import 'package:zoommetting/Variables.dart';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  createcode(){
    setState(() {
      code=Uuid().v1().substring(0,6);
    });
  }
  String code='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20,),
            child: Text("Create a code and share it with your friend ",
              style: myStyel(20),textAlign: TextAlign.center,),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Code: ",style: myStyel(30),),
              Text(code,style: myStyel(30,Colors.purple,FontWeight.w700),),
            ],
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: ()=>createcode(),
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.facebookMessenger
                )
              ),
              child: Center(
                child: Text("Create Code ",style: myStyel(20,Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
