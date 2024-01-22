import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/HomePage/Home/FetchAllPosts.dart';
import 'package:linkedin_clone/HomePage/Home/profileDetails.dart';
import '../Post/MyPosts.dart';

class HomeBarContent extends StatefulWidget {
  const HomeBarContent({super.key});

  @override
  State<HomeBarContent> createState() => _HomeBarContentState();
}

class _HomeBarContentState extends State<HomeBarContent> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar:AppBar(
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
                ),
                Tab(
                  icon: Icon(Icons.file_copy),
                  text: "Profile",
                ),
              ],
            ),
          ),
          // drawer: navigationDrawer(),
          body: const TabBarView(
            children: [
              AllPosts(),
              MyPosts(),
              ProfileInfo(),
            ],
          )),
    );
  }
}
