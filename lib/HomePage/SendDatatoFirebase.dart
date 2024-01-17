import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:linkedin_clone/Authentication/Screens/AuthBackend.dart';

class SendDataToFirebase {
  Future<void> sendProfileDataToFirebase({
    required String fullName,
    required String email,
    required BuildContext context,
  }) async {
    try {
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      CollectionReference collectionReference =
          firebaseFirestore.collection("Users");
      await collectionReference.doc().set({
        "FullName": fullName,
        "Email": email,
      });
      Authentication()
          .ShowSuccessMessage(context, "User Data send Successfully");
    } catch (e) {
      Authentication().showOnFailuremessage(context, "$e");
    }
  }

  Future<void> FetchCurrentUserprofile({
  }) {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if(user!=null){
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      DocumentReference document = await firebaseFirestore.collection("Users").doc(user.uid).get();
      if(document.exists) {
        var userData = document.data();
       String  fullname = userData["FullName"];
        String email = userData['Email'];
        print("FullName: $fullname , Email: $email");
      }
      else{

      }
      }
    } catch (e) {
    }
  }
}
