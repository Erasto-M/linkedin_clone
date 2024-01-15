import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/LoginScreen.dart';

import 'ReusableWidgets.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
              BigText("Create   Account", FontWeight.bold, Colors.black),
              showHeight(),
              textFormField(
                FullNameController,
                TextInputType.text,
                const Icon(Icons.person),
                null,
                false,
                "Enter FullName",
                "FullName",
              ),
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
              textFormField(
                confirmPasswordController,
                TextInputType.visiblePassword,
                const Icon(Icons.key),
                const Icon(Icons.visibility_off),
                true,
                "please confirm password",
                "Confirm password",
              ),
              showHeight(),
              showHeight(),
              ShowButton(
                Colors.blue,
                    () {},
                "Sign Up",
                BorderSide.none,
                FontWeight.bold,
              ),
              showHeight(),
              Row(
                children: [
                  SmallText("Already Have An Account?", Colors.black87),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                    child: SmallText("Log In", Colors.blue),
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
                "Sign Up With Google",
                const BorderSide(color: Colors.blue),
                FontWeight.normal,
                "images/google.png",
              ),
              showHeight(),
              ShowElevatedButton(
                Colors.white,
                    () {},
                "Sign Up With Apple",
                const BorderSide(color: Colors.blue),
                FontWeight.normal,
                "images/apple.png",
              ),
              showHeight(),
              ShowElevatedButton(
                Colors.white,
                    () {},
                "Sign Up With Facebook",
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
