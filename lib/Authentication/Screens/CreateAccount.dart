import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
            child: Padding(
              padding:  EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text("hello world"),
                ],
              ),
            ),
      ),
    );
  }
}
