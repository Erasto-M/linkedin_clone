import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/LoginScreen.dart';
import 'package:linkedin_clone/Authentication/Screens/ReusableWidgets.dart';

import 'CreateAccount.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 15, left: 15, right: 15, bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShowLinkedInImage(),
             const  Spacer(),
              BigText("LINKEDIN", FontWeight.bold, Colors.blue),
              const Spacer(),
              WelcomeImage(),
              const Spacer(),
              BigText("Welcome!", FontWeight.bold, Colors.black87),
              const Spacer(),
              SmallText(""
                  "Thrilled to have you embark on this journey of Exploration , Learning and Connection(Networking)",
                  Colors.black,
              ),
              const Spacer(),
              ShowButton(Colors.blue,
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>CreateAccount()));
                      },
                  "Sign Up",
                BorderSide.none,
                  FontWeight.normal,

              ),
              const Spacer(),
              ShowButton(Colors.white,
                      () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                  "Log In",
                  const BorderSide(color: Colors.blue),
                  FontWeight.normal
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
