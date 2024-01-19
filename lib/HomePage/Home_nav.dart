import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Backend/AuthBackend.dart';
import 'package:linkedin_clone/HomePage/Home/Home.dart';
import 'package:linkedin_clone/HomePage/Post/postData.dart';
import 'package:linkedin_clone/Authentication/Backend/SendDatatoFirebase.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _CurrentState = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        //Homepage
        const HomeBarContent(),
        const Card(
            margin: EdgeInsets.all(20),
            child: SizedBox.expand(
              child: Center(
                child: Text("Network with like minded"),
              ),
            )),
        const PostData(),
        const Card(
            margin: EdgeInsets.all(20),
            child: SizedBox.expand(
              child: Center(
                child: Text("see your notifications"),
              ),
            )),
        const Card(
            margin: EdgeInsets.all(20),
            child: SizedBox.expand(
              child: Center(
                child: Text("See the available jobs"),
              ),
            )),
      ][_CurrentState],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _CurrentState = index;
          });
        },
        selectedIndex: _CurrentState,
        indicatorColor: Colors.blue,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home),
              label: "Home"),
          NavigationDestination(
              icon: Badge(
                label: Text("3"),
                child: Icon(Icons.person_2_sharp),
              ),
              label: "My Network"),
          NavigationDestination(
              icon: Badge(
                child: Icon(Icons.add_box),
              ),
              label: "Post"),
          NavigationDestination(
              icon: Badge(
                label: Text("3"),
                child: Icon(Icons.notifications_sharp),
              ),
              label: "Notifications"),
          NavigationDestination(
            icon: Badge(
              label: Text("10"),
              child: Icon(Icons.shopping_bag_rounded),
            ),
            label: "Jobs",
          ),
        ],
      ),
    );
  }
}
