import 'package:flutter/material.dart';

class HomeBarContent extends StatefulWidget {
  const HomeBarContent({super.key});

  @override
  State<HomeBarContent> createState() => _HomeBarContentState();
}

class _HomeBarContentState extends State<HomeBarContent> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              Text("hello there"),
            ],
          ),
        ),
      ),
    );
  }
}
