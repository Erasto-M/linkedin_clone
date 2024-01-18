import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/AuthBackend.dart';
import 'package:linkedin_clone/HomePage/SendDatatoFirebase.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _CurrentState = 0;
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to Network"),
        centerTitle: true,
      ),
      drawer: navigationDrawer(),
      body: [
        //Homepage
        Card(
            margin: EdgeInsets.all(20),
            child: SizedBox.expand(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Full Name: ${fullName ?? "Erastus Munyao"}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Email : ${email ?? "erastusmunya@gmail.com"}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            )),
        const Card(
            margin: EdgeInsets.all(20),
            child: SizedBox.expand(
              child: Center(
                child: Text("Network with like minded"),
              ),
            )),
        const Card(
            margin: EdgeInsets.all(20),
            child: SizedBox.expand(
              child: Center(
                child: Text("post your content"),
              ),
            )),
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
