import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/CreateAccount.dart';
import 'package:linkedin_clone/Authentication/Screens/WelcomeScreen.dart';
void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // final cameras = await availableCameras();
  // final firstCamera = cameras.first;
  runApp( const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:Home(),
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
    return WelcomeScreen();
  }
}
