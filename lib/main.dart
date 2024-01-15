import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/CreateAccount.dart';
import 'package:linkedin_clone/Authentication/Screens/WelcomeScreen.dart';
void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const  WelcomeScreen();
  }
}
