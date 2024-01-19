import 'package:flutter/material.dart';
import 'package:linkedin_clone/HomePage/Post/CreatePost.dart';
import 'package:linkedin_clone/HomePage/Post/MyPosts.dart';

class PostData extends StatefulWidget {
  const PostData({super.key});

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: const Text(
                "Post Data ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              bottom: const TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    icon: Icon(Icons.note_add),
                    text: "Create Post",
                  ),
                  Tab(
                    icon: Icon(Icons.file_copy),
                    text: "My Posts",
                  )
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                CreatePost(),
                MyPosts(),
              ],
            )));
  }
}
