import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Backend/AuthBackend.dart';

class PostDataToFirebase {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<User?> SendPostToFirebase({
    required String postTitle,
    required String postBody,
    required String docID,
    required BuildContext context,
  }) async {
    try {
      User? currentUser = await FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String uid = currentUser.uid;
        CollectionReference collectionReference =
            firebaseFirestore.collection("Posts");
        collectionReference.doc(docID).set({
          "PostTitle": postTitle,
          "PostBody": postBody,
          "UID": uid,
        });
        Authentication().ShowSuccessMessage(context, "Post Send successFully");
      }
    } catch (e) {
      Authentication().showOnFailuremessage(context, "$e");
    }
  }

  Future<List<Map<String, dynamic>>?> FetchCurrentUserPosts() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;
        QuerySnapshot<Map<String, dynamic>> querySnapshot =
            await firebaseFirestore
                .collection("Posts")
                .where("UID", isEqualTo: uid)
                .get();
        List<Map<String, dynamic>> userPostsList = [];
        for (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot
            in querySnapshot.docs) {
          Map<String, dynamic> userPosts = documentSnapshot.data();
          userPostsList.add(userPosts);
        }
        return userPostsList;
      }
      return [];
    } catch (e) {
      print("Error fetching user posts: $e");
      return [];
    }
  }
  Future<void> deletePost({
    required BuildContext context,required String? docId})async{
    try{
      User? user = await FirebaseAuth.instance.currentUser;
      if(user!=null){
        String uid = user.uid;
        DocumentReference documentReference= await firebaseFirestore.collection("Posts").doc(docId);
        DocumentSnapshot documentSnapshot = await documentReference.get();
        documentReference.delete();
        Authentication().ShowSuccessMessage(context,"Post deleted Successfully");
      }
    }catch(e){
      Authentication().showOnFailuremessage(context, "Error deleting post: $e");
    }
  }
  Future<void> UpdatePostData()async{
    try{
      CollectionReference collectionReference = await firebaseFirestore.collection("posts");
    }catch(e){

    }
  }
}
