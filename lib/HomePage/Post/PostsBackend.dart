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
        /*Fetch the Name and Email of the current user and send them to firebase collection Posts*/
        DocumentSnapshot usersSnapshot =
            await firebaseFirestore.collection("Users").doc(uid).get();
        if (usersSnapshot.exists) {
          String? userName = usersSnapshot['FullName'];
          String? userEmail = usersSnapshot['Email'];
          /*Send the Posts details to firebase including the name and email of the sender*/
          CollectionReference collectionReference =
              firebaseFirestore.collection("Posts");
          collectionReference.doc(docID).set({
            "PostTitle": postTitle,
            "PostBody": postBody,
            "UID": uid,
            "Email": userEmail,
            "FullName": userName,
          });
        }
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

  Future<List<Map<String, dynamic>>?> FetchAllPosts() async {
    try {
      CollectionReference collectionReference =
          await firebaseFirestore.collection("Posts");
      QuerySnapshot querySnapshot = await collectionReference.get();
      List<Map<String, dynamic>>? AllPostlist = [];
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        // Access the data of each document using documentSnapshot.data()
        Map<String, dynamic> postData =
            documentSnapshot.data() as Map<String, dynamic>;
        // Now, you can use postData to access fields of each document
        String postTitle = postData["PostTitle"];
        String postBody = postData["PostBody"];
        String userName = postData["FullName"];
        String userEmail = postData["Email"];
        AllPostlist.add(postData);
        // Do something with the retrieved data
        print(
          "Post Title: $postTitle, Post Body: $postBody,posterName :$userName,posterEmail :$userEmail",
        );
      }
      return AllPostlist;
    } catch (e) {}
  }

  Future<void> deletePost(
      {required BuildContext context, required String? docId}) async {
    try {
      User? user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;
        DocumentReference documentReference =
            await firebaseFirestore.collection("Posts").doc(docId);
        DocumentSnapshot documentSnapshot = await documentReference.get();
        documentReference.delete();
        Authentication()
            .ShowSuccessMessage(context, "Post deleted Successfully");
      }
    } catch (e) {
      Authentication().showOnFailuremessage(context, "Error deleting post: $e");
    }
  }

  Future<void> UpdatePostData({
    required String docId,
    required Map<String, dynamic> updatedData,
  }) async {
    try {
      CollectionReference collectionReference =
          await firebaseFirestore.collection("Posts");
      DocumentReference documentReference =
          await collectionReference.doc(docId);
      documentReference.update(updatedData);
    } catch (e) {}
  }
}
