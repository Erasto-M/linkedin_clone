import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/ReusableWidgets.dart';
import 'package:linkedin_clone/Authentication/Screens/WelcomeScreen.dart';
import 'package:linkedin_clone/HomePage/Home_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    navigateToNextScreen();

  }
  Future<void> navigateToNextScreen()async{
    await Future.delayed(Duration(seconds: 3));
    try{
      User? user = await FirebaseAuth.instance.currentUser;
      if(user!=null){
        await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeNavigation()));
      } else{
        await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>WelcomeScreen()));
      }
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ShowLinkedInImage(),
              const SizedBox(
                height: 20,
              ),
              BigText(
                  "Welcome To Linkedin Clone", FontWeight.normal, Colors.black),
              const SizedBox(
                height: 40,
              ),
              CircularProgressIndicator(
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
