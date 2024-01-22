import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/HomePage/Home/Profile/EditProfile.dart';

import '../../../Authentication/Backend/AuthBackend.dart';
import '../../../Authentication/Backend/SendDatatoFirebase.dart';
import '../../../Authentication/Screens/ReusableWidgets.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
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
  String? fullName;
  String? email;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    User? user = await SendDataToFirebase().fetchCurrentUserProfile();
    if (user != null) {
      setState(() {
        fullName = user?.displayName;
        email = user?.email;
      });
      print("Full Name: $fullName, Email: $email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, left: 15, right: 15),
      child: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlue,
              ),
              accountName: Text(fullName ?? 'Full Name'),
              accountEmail: Text(email ?? 'Email'),
              currentAccountPicture: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                    image: AssetImage("images/browsingImage.png"),
                    fit: BoxFit.cover
                  ),
                ),
              )
            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: const Icon(Icons.edit,size: 25,color: Colors.blue,),
              onTap: (){ShowAlertDialogForUpdate();},
              title: const Text("Edit profile"),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined,size: 25,color: Colors.blue,),
              onTap: () {
                showAlertDialog(context);
              },
              title: const Text("Log Out"),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you Sure you want to Logout"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "No",
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                await Authentication().SignOutUser(context);
              },
              child: const Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
  AlertDialog? ShowAlertDialogForUpdate(){
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Edit Your Profile"),
        content: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
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
                    TextInputType.text,
                    const Icon(Icons.note),
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
                    TextInputType.text,
                    const Icon(Icons.note),
                    null,
                    4,
                    1,
                    50,
                    false,
                    "Enter Your Skills",
                    "Skills",
                    true,
                    Colors.white24,
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                showHeight(),
                textFormField(
                    technologiesController,
                    TextInputType.text,
                    const Icon(Icons.military_tech),
                    null,
                    4,
                    1,
                    50,
                    false,
                    "Enter the technologies you use",
                    "Technologies",
                    true,
                    Colors.white24,
                    OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                showHeight(),
                ShowButton(Colors.blue, () { }, "Update Your Profile", BorderSide.none, FontWeight.bold),
                const SizedBox(height: 40,),
              ],
            ),
          ),
        ),
      );
    });
  }
}
