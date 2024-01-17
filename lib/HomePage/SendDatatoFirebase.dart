 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:linkedin_clone/Authentication/Screens/AuthBackend.dart';

class SendDataToFirebase{

  Future<void> sendProfileDataToFirebase(
     {
       required String fullName,
       required String email,
       required BuildContext context,
 }
      )async{
    try{
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      CollectionReference collectionReference = firebaseFirestore.collection("Users");
      await collectionReference.add({
        "FullName": fullName,
        "Email": email,
      });
      Authentication().ShowSuccessMessage(context,"User Data send Successfully");
    }catch(e){
      Authentication().showOnFailuremessage(context, "$e");
    }

  }
 }