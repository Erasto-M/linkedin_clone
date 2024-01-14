import 'package:flutter/material.dart';

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
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ShowLinkedInImage(),
                const Spacer(),
                BigText("LINKEDIN", FontWeight.bold, Colors.blue),
                const Spacer(),
                BigText("Create   Account", FontWeight.bold, Colors.black),
                const Spacer(),
                textFormField(
                  FullNameController,
                  TextInputType.text,
                  const Icon(Icons.person),
                  null,
                  false,
                  "Enter FullName",
                  "FullName",
                ),
                const Spacer(),
                textFormField(
                  EmailController,
                  TextInputType.emailAddress,
                  const Icon(Icons.email),
                  null,
                  false,
                  "Enter Email",
                  "Email",
                ),
                const Spacer(),
                textFormField(
                  PassWordController,
                  TextInputType.visiblePassword,
                  const Icon(Icons.key),
                  const Icon(Icons.visibility_off),
                  true,
                  "Enter Password",
                  "Password",
                ),
                const Spacer(),
                textFormField(
                  confirmPasswordController,
                  TextInputType.visiblePassword,
                  const Icon(Icons.key),
                  const Icon(Icons.visibility_off),
                  true,
                  "please confirm password",
                  "Confirm password",
                ),
                const Spacer(),
                ShowButton(
                  Colors.blue,
                      () {},
                  "Sign Up",
                  BorderSide.none,
                  FontWeight.bold,
                ),
                const Spacer(),
                Row(
                  children: [
                    SmallText("Already Have An Account?", Colors.black87),
                    const SizedBox(width: 5,),
                    TextButton(
                      onPressed: () {},
                      child: SmallText("Log In", Colors.blue),
                    ),
                  ],
                ),
                const Spacer(),
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
                const Spacer(),
                ShowElevatedButton(
                  Colors.white,
                      () {},
                  "Sign Up With Google",
                  const BorderSide(color: Colors.black87),
                  FontWeight.normal,
                  "images/google.png",
                ),
                const Spacer(),
                ShowElevatedButton(color, () { }, text, borderSide, fontWeight, imagePath)
              ],
            ),
          ),
      ),
    );
  }
}
