import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/CreateAccount.dart';

import 'ReusableWidgets.dart';
class LoginScreen extends StatefulWidget  {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // late CameraDescription camera;
  final FullNameController = TextEditingController();
  final EmailController = TextEditingController();
  final PassWordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShowLinkedInImage(),
              BigText("LINKEDIN", FontWeight.bold, Colors.blue),
              showHeight(),
              BigText("Log in to your Account", FontWeight.bold, Colors.black),
              showHeight(),
              showHeight(),
              textFormField(
                EmailController,
                TextInputType.emailAddress,
                const Icon(Icons.email),
                null,
                false,
                "Enter Email",
                "Email",
              ),
              showHeight(),
              textFormField(
                PassWordController,
                TextInputType.visiblePassword,
                const Icon(Icons.key),
                const Icon(Icons.visibility_off),
                true,
                "Enter Password",
                "Password",
              ),
              showHeight(),
              showHeight(),
              ShowButton(
                Colors.blue,
                    () {},
                "Log in",
                BorderSide.none,
                FontWeight.bold,
              ),
              showHeight(),
              Row(
                children: [
                  SmallText("Don't Have An Account?", Colors.black87),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateAccount()));
                    },
                    child: SmallText("Sign Up", Colors.blue),
                  ),
                ],
              ),
              showHeight(),
              showHeight(),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.3),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: BigText("OR", FontWeight.normal, Colors.black87),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.3),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              showHeight(),
              ShowElevatedButton(
                Colors.white,
                    () {},
                "Log In With Google",
                const BorderSide(color: Colors.blue),
                FontWeight.normal,
                "images/google.png",
              ),
              showHeight(),
              ShowElevatedButton(
                Colors.white,
                    () {},
                "Log in With Apple",
                const BorderSide(color: Colors.blue),
                FontWeight.normal,
                "images/apple.png",
              ),
              showHeight(),
              ShowElevatedButton(
                Colors.white,
                    () {},
                "Log in With Facebook",
                const BorderSide(color: Colors.blue),
                FontWeight.normal,
                "images/facebook.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
