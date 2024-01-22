import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/HomePage/Home/FetchAllPosts.dart';

import '../../Authentication/Backend/AuthBackend.dart';
import '../../Authentication/Backend/SendDatatoFirebase.dart';
import '../Post/CreatePost.dart';
import '../Post/MyPosts.dart';

class HomeBarContent extends StatefulWidget {
  const HomeBarContent({super.key});

  @override
  State<HomeBarContent> createState() => _HomeBarContentState();
}

class _HomeBarContentState extends State<HomeBarContent> {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  icon: Icon(Icons.note_add),
                  text: "All Posts",
                ),
                Tab(
                  icon: Icon(Icons.file_copy),
                  text: "Recent Posts",
                )
              ],
            ),
          ),
          drawer: navigationDrawer(),
          body: const TabBarView(
            children: [
              AllPosts(),
              MyPosts(),
            ],
          )),
    );
  }

  void openDrawer() {
    Scaffold.of(context).openDrawer();
  }

  Drawer navigationDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Column(
                children: [
                  const Text("My Profile"),
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                  ),
                  Text("$fullName"),
                  Text("$email"),
                ],
              )),
          const Divider(
            thickness: 1,
            color: Colors.black12,
          ),
          ListTile(
            onTap: () {
              showAlerDialog(context);
            },
            title: const Text("Log Out"),
          ),
          const Divider(
            thickness: 1,
            color: Colors.black12,
          ),
        ],
      ),
    );
  }

  void showAlerDialog(BuildContext context) {
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
                  )),
              TextButton(
                  onPressed: () async {
                    await Authentication().SignOutUser(context);
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          );
        });
  }
}
