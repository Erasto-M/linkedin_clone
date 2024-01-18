import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkedin_clone/Authentication/Screens/LoginScreen.dart';
import 'package:linkedin_clone/Authentication/Screens/WelcomeScreen.dart';
import '../../HomePage/Home_nav.dart';

class Authentication {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<User?> createUser({
    required String email,
    required String passWord,
    required String displayName,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: passWord);
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(displayName);
        await user.sendEmailVerification();
        ShowSuccessMessage(
            context, "Account Successfully Created, check email to verify");
        return user;
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
    try {
      UserCredential userCredential = (await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: passWord));
      User? user = userCredential.user;
      if (user != null) {
        ShowSuccessMessage(context, "Login Succesfully");
        await Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeNavigation()));
      }
    } catch (e) {
      String errormessage = "$e";
      showOnFailuremessage(context, 'Error signing in : $errormessage');
    }
  }

  Future<void> SignOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => WelcomeScreen()));
    } catch (e) {
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
      backgroundColor: Colors.black87,
    ));
  }

  GoogleSignIn(BuildContext context) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    User? user;
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await firebaseAuth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      try {
        final GoogleSignInAccount? googleSignInAccount =
            await GoogleSignIn(context).signIn();

        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          final UserCredential userCredential =
              await firebaseAuth.signInWithCredential(credential);
          user = userCredential.user;
        }
      } catch (e) {
        // Print or log the error message for debugging purposes
        print("Google Sign-In Error: $e");
        return "Google Sign-In Error: $e";
      }

      return user;
    }
  }
}
