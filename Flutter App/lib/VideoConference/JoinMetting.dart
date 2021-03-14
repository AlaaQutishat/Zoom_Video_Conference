import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zoommetting/Variables.dart';
class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController namecontroller =TextEditingController();
  TextEditingController roomcontroller =TextEditingController();
  String username='';
  bool isVideoMuted=true;
  bool isAudioMuted=true;
  bool dataisheere=false;
  Future<dynamic> getData() async {
    DocumentSnapshot userdoc= await userCollection
        .doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      username=userdoc.data()['username'];
      dataisheere=true;
    });
  }
  _joinMeeting() async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.HD_RESOLUTION; // Limit video resolution to 720dp

      var options = JitsiMeetingOptions()
        ..room = roomcontroller.text // Required, spaces will be trimmed
        ..subject = "Meeting with Alaa Qutishat"
        ..userDisplayName = namecontroller.text
        ..userEmail = "alaa@gmail.com"
        // ..userAvatarURL = "https://someimageurl.com/image.jpg" // or .png
        // ..audioOnly = true
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
    }
  }


 @override
  void initState() {
   getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return dataisheere ==false ? Center(child: CircularProgressIndicator()) :Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24,),
              Text("Room Code",style: myStyel(20,),),
              SizedBox(height: 20,),
              PinCodeTextField(
                controller: roomcontroller,
                length: 6,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.circle
                ),
                animationDuration: Duration(milliseconds: 300),
                autoDisposeControllers: false,
                onChanged: (value){

                }, appContext: context,
              ),
              SizedBox(height: 10,),
              TextField(
                controller: namecontroller,
                style: myStyel(20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name (Leave if you want your username)",
                  labelStyle: myStyel(15)
                ),
              ),
              SizedBox(height: 16,),
              CheckboxListTile(
                value: isVideoMuted,
                onChanged: (value){
                  setState(() {
                    isVideoMuted=value;
                  });
                },
              title: Text("Video Muted",style: myStyel(18,Colors.black),),),
              SizedBox(height: 16,),
              CheckboxListTile(
                value: isAudioMuted,
                onChanged: (value){
                  setState(() {
                    isAudioMuted=value;
                  });
                },
                title: Text("Audio Muted",style: myStyel(18,Colors.black),),),
              SizedBox(height: 16,),
              Text("Of Course ,you can customise your setting in the meeting",
                textAlign: TextAlign.center,
                style: myStyel(15),),
                 Divider(
                   height: 48,
                   thickness: 2.0,
                 ),
              InkWell(
                onTap: ()=>_joinMeeting(),
                child: Container(
                  width: double.maxFinite,
                  height: 64,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradientColors.facebookMessenger
                      )
                  ),
                  child: Center(
                    child: Text("Join Metting ",style: myStyel(20,Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
