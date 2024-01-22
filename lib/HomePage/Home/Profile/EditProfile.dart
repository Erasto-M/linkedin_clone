import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/ReusableWidgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final SkillsController = TextEditingController();
  final profilePicController = TextEditingController();
  final aboutMeController = TextEditingController();
  final experiencesController = TextEditingController();
  final projectsController = TextEditingController();
  final technologiesController = TextEditingController();
  final educationController = TextEditingController();
  final licencesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShowAlertDialogForUpdate(),
    );
  }
  AlertDialog? ShowAlertDialogForUpdate(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Edit Your Profile"),
        content: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              textFormField(
                  fullNameController,
                  TextInputType.text,
                  const Icon(Icons.person),
                  null,
                  4,
                  1,
                  50,
                  false,
                  "your FullName",
                  "FullName",
                  true,
                  Colors.white24,
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              showHeight(),
              textFormField(
                  emailController,
                  TextInputType.emailAddress,
                  const Icon(Icons.email_outlined),
                  null,
                  4,
                  1,
                  50,
                  false,
                  "Enter Email",
                  "Email",
                  true,
                  Colors.white24,
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              showHeight(),
              textFormField(
                  aboutMeController,
                  TextInputType.text,
                  const Icon(Icons.email_outlined),
                  null,
                  50,
                  1,
                  1000,
                  false,
                  "Tell us about Yourself",
                  "About",
                  true,
                  Colors.white24,
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              showHeight(),
              textFormField(
                  experiencesController,
                  TextInputType.emailAddress,
                  const Icon(Icons.email_outlined),
                  null,
                  50,
                  1,
                  1000,
                  false,
                  "Which are your Experiences",
                  "Experiences",
                  true,
                  Colors.white24,
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              showHeight(),
              textFormField(
                  emailController,
                  TextInputType.emailAddress,
                  const Icon(Icons.email_outlined),
                  null,
                  4,
                  1,
                  50,
                  false,
                  "Enter Email",
                  "Email",
                  true,
                  Colors.white24,
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ],
          ),
        ),
      );
    });
  }
}
