import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/CreateAccount.dart';
import 'package:linkedin_clone/Authentication/Screens/SplashScreen.dart';
import 'package:linkedin_clone/Authentication/Screens/WelcomeScreen.dart';
import 'package:linkedin_clone/HomePage/Home_nav.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:const Home(),
    theme: ThemeData(
      primaryColor:const  Color.fromRGBO(225, 220, 220, 10),
    ),
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
    return SplashScreen();
  }
}
