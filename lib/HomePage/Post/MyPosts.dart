import 'package:flutter/material.dart';
import 'package:linkedin_clone/HomePage/Post/PostsBackend.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({super.key});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Map<String, dynamic>>?>(
      future: PostDataToFirebase().FetchCurrentUserPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: Colors.blue,
          );
        } else if (!snapshot.hasData) {
          return Text("No data found");
        } else if (snapshot.hasError) {
          return Text("Error found ${snapshot.error}");
        } else {
          List<Map<String, dynamic>> userPostList = snapshot.data ?? [];
          return ListView.builder(
              itemCount: userPostList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> userPosts = userPostList[index];
                String postTitle = userPosts?["PostTitle"] as String? ?? "";
                String postBody = userPosts?["PostBody" ]as String? ?? "";
                print("postTitle: $postTitle postBody:$postBody");
                return ListTile(
                  title: Center(
                    child: Text(
                      postTitle,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  subtitle: Text(
                    postBody,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                );
              });
        }
      },
    ));
  }
}
