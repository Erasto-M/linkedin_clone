import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:linkedin_clone/Authentication/Screens/AuthBackend.dart';

class SendDataToFirebase {
  Future<User?> sendProfileDataToFirebase({
    required String fullName,
    required String email,
    required BuildContext context,
  }) async {
    try {
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      CollectionReference collectionReference =
          firebaseFirestore.collection("Users");
      User? user = FirebaseAuth.instance.currentUser;
      if(user!=null){
        String uid = user.uid;
        await collectionReference.doc(uid).set({
          "FullName": fullName,
          "Email": email,
          "UId": uid,
        });
        Authentication()
            .ShowSuccessMessage(context, "User Data send Successfully");
      }
    } catch (e) {
      Authentication().showOnFailuremessage(context, "$e");
    }
  }

  Future<User?> fetchCurrentUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      print("Current User: $user");
      if (user != null) {
        final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

        // Get the UID of the current user
        String uid = user.uid;

        DocumentSnapshot<Map<String, dynamic>> documentSnapshot = await firebaseFirestore
            .collection("Users")
            .doc(uid) // Use .doc(uid) to directly reference the document with the UID
            .get();

        if (documentSnapshot.exists) {
          // Document exists, retrieve data
          var userData = documentSnapshot.data();
          String fullName = userData?["FullName"] as String? ?? "";
          String email = userData?['Email'] as String? ?? "";

          print("FullName: $fullName, Email: $email, UID: $uid");
          return user;
        } else {
          // Handle the case when the document doesn't exist
          print("Error: Document does not exist for UID: $uid");
        }
      }
    } catch (e) {
      // Handle exceptions
      print("Error: $e");
    }
  }


}
