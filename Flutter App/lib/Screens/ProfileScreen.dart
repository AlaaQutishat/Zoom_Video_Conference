import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:zoommetting/Variables.dart';
bool dataisheere=false;
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController namecontroller =TextEditingController();
  TextEditingController newusernamecontroller =TextEditingController();
  Future<dynamic> getData() async {
  DocumentSnapshot userdoc= await userCollection
      .doc(FirebaseAuth.instance.currentUser.uid).get();
  setState(() {
    namecontroller.text=userdoc.data()['username'];
    dataisheere=true;
  });
  }
  editprofile()async{
    await userCollection
        .doc(FirebaseAuth.instance.currentUser.uid).update({
      'username':newusernamecontroller.text.trim()
    });
      setState(() {
        namecontroller.text=newusernamecontroller.text;
        newusernamecontroller.text="";

      });
    Navigator.pop(context);
  }


  openeditprofileeditdialog() async{
    return showDialog(context: context,
        builder: (context){
      return Dialog(
        child: Container(
          height: 200,
          child: Column(
            children: [
              SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: 30,right: 30),
              child: TextField(
                controller: newusernamecontroller,
                style: myStyel(18,Colors.black),
                decoration: InputDecoration(
                  labelText: "Update Username",
                  labelStyle: myStyel(16,Colors.grey)

                ),
              ),
            ),
              SizedBox(height: 40,),
              InkWell(
                onTap:()=>editprofile(),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  height: 40,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: GradientColors.cherry
                      )
                  ),
                  child: Center(
                    child: Text("Update now!",style: myStyel(17,Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      );
        });
  }
  @override
  Future<void> initState()  {
  getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      body: dataisheere ==false  ?Center(child:
        CircularProgressIndicator(),) :Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: GradientColors.facebookMessenger,
                )
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/2-64,
            top: MediaQuery.of(context).size.height/3.1 ),
             child: CircleAvatar(
               radius: 64,
               backgroundImage: NetworkImage('https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png'),
             ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300,),
                Text(namecontroller.text,style: myStyel(40,Colors.black ),textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                InkWell(
                  onTap:()=>openeditprofileeditdialog(),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: GradientColors.cherry
                      )
                    ),
                    child: Center(
                      child: Text("Edit Profile",style: myStyel(17,Colors.white),),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
