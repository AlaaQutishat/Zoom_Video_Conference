import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/HomePage.dart';
import 'Screens/IntroAuthScreen.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  debugShowCheckedModeBanner: false,
      home: NavigationPage(),

    );
  }
}


class NavigationPage  extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned=false;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if(user!=null){
        setState(() {
          isSigned=true;
        });

      }
      else{
        setState(() {
          isSigned=false;
        });
      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSigned==true?  HomePage():IntroAuthScreen(),
    );
  }
}


