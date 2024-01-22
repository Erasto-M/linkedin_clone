import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Authentication/Backend/AuthBackend.dart';
import '../../Authentication/Backend/SendDatatoFirebase.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
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
            ListTile(
              onTap: () {},
              title: const Text("Edit profile"),
            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
            ListTile(
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
}
