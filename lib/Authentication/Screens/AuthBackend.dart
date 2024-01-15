import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:linkedin_clone/Authentication/Screens/LoginScreen.dart';

import '../../HomePage/Home_nav.dart';

class Authentication {
  Future<void> createUser({
    required String Email,
    required String passWord,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: passWord);
      User? user = userCredential.user;
      if (user != null) {
        await user.sendEmailVerification();
        ShowSuccessMessage(
            context, "Account Successfully Created, check email to verify");
        await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } catch (e) {
      String errormessage = "$e";
      showOnFailuremessage(context, 'Error creating account : $errormessage');
    }
  }

  Future<void> LoginUser({
    required String email,
    required String passWord,
    required BuildContext context,
  }) async {
    try{
      User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: passWord)) as User;
      if(user!=null){
        if(user.emailVerified){
          ShowSuccessMessage(context, "Login Succesfully");
          await Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeNavigation()));
        } else{
          showOnFailuremessage(context, 'Please verify your email');
          await FirebaseAuth.instance.signOut();
        }
      }
    }catch(e){
      String errormessage = "$e";
      showOnFailuremessage(context, 'Error signing in : $errormessage');
    }
  }
  Future<void> SignOutUser(BuildContext context)async{
    try{
      await FirebaseAuth.instance.signOut();
    }catch(e){
      showOnFailuremessage(context, 'Error signing out: $e');
    }
  }
  void ShowSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }

  void showOnFailuremessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.red, fontSize: 18),
      ),
      backgroundColor: Colors.red,
    ));
  }
}
