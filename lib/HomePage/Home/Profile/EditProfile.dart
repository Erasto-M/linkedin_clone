import 'package:flutter/material.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text("Edit Your Profile"),
      content: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
