import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/AuthBackend.dart';
import '../../HomePage/Home_nav.dart';
import 'LoginScreen.dart';
import 'ReusableWidgets.dart';
import 'package:image_picker/image_picker.dart';

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
  File? _image;
  Future getImage(bool isCamera) async {
    try {
      ImageSource source = isCamera ? ImageSource.camera : ImageSource.gallery;
      final pickedFile = await ImagePicker().pickImage(source: source);

      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {});
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
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
              const Text("Click to Upload Your Photo"),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        getImage(true);
                      },
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 30,
                      )),
                  const SizedBox(
                    width: 50,
                  ),
                  IconButton(
                      onPressed: () {
                        getImage(false);
                      },
                      icon: const Icon(
                        Icons.insert_drive_file,
                        size: 30,
                      )),
                ],
              ),
              _image == null
                  ? Container()
                  : Image.file(
                      _image!,
                      height: 200,
                      width: 200,
                    ),
              showHeight(),
              showHeight(),
              ShowButton(
                Colors.blue,
                () async {
                  String? validationError = ValidateFields(
                    fullName: FullNameController.text,
                    email: EmailController.text,
                    password: PassWordController.text,
                    confirmPassword: confirmPasswordController.text,
                    ImageUrl: _image?.path,
                  );
                  if (validationError != null) {
                    ShowerrorMessage(validationError);
                  } else {
                    await Authentication().createUser(
                        email: EmailController.text,
                        passWord: PassWordController.text,
                        context: context);
                  }
                },
                "Sign Up",
                BorderSide.none,
                FontWeight.bold,
              ),
              showHeight(),
              Row(
                children: [
                  SmallText("Already Have An Account?", Colors.black87),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
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
                    () async{
                  User? user =   await Authentication().GoogleSignIn(context);
                  if(user!=null){
                    await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeNavigation()));
                  }
                },
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

  void ShowerrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      message,
      style: TextStyle(color: Colors.red),
    )));
  }

  String? ValidateFields({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required String? ImageUrl,
  }) {
    if (fullName.isEmpty) {
      return "Please enter your fullName";
    }
    if (email.isEmpty) {
      return "please enter your email";
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "please enter a valid email";
    }
    if (password.isEmpty) {
      return "please enter your password";
    } else if (password.length < 6) {
      return "passwords should be atleast 6 characters";
    }
    if (confirmPassword.isEmpty) {
      return "please enter your password";
    } else if (confirmPassword != password) {
      return "passwords do not match";
    }
    if (ImageUrl == null || ImageUrl!.isEmpty) {
      return "please provide an Image";
    }
    return null;
  }
}
