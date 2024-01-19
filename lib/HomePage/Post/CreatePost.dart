import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/ReusableWidgets.dart';
import 'package:linkedin_clone/HomePage/Post/PostsBackend.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  bool isSending = false;
  final postTitleController = TextEditingController();
  final postBodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: BigText(
                      "Create The Post", FontWeight.bold, Colors.black87)),
              showHeight(),
              textFormField(
                postTitleController,
                TextInputType.text,
                const Icon(Icons.title_outlined),
                null,
                2,
                1,
                30,
                false,
                " Title of your post",
                "Title",
                true,
                Colors.white12,
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              showHeight(),
              textFormField(
                postBodyController,
                TextInputType.text,
                const Icon(Icons.note),
                null,
                20,
                1,
                2000,
                false,
                " Content of your post",
                "Body",
                true,
                Colors.white12,
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              showHeight(),
              Visibility(
                visible: !isSending,
                child: ShowButton(
                    Colors.blue, () async {
                  String? validated = validatePost(
                      postTitle: postTitleController.text,
                      postBody: postBodyController.text);
                  if (validated != null) {
                    ShowerrorMessage(validated, context);
                  } else {
                    await PostDataToFirebase().SendPostToFirebase(
                        postTitle: postTitleController.text,
                        postBody: postBodyController.text,
                        context: context);
                  }
                }, "Post", BorderSide.none, FontWeight.bold),
              ),
              showHeight(),
            ],
          ),
        ),
      ),
    );
  }

  String? validatePost({
    required String postTitle,
    required String postBody,
  }) {
    if (postTitle == null || postTitle.isEmpty) {
      return "please Write A Title for your Post";
    } else if (postTitle.length > 30) {
      return "Length limited to 2000";
    }
    if (postBody == null || postBody.isEmpty) {
      return "Please write the body of your post";
    } else if (postBody.length > 2000) {
      return "Length limited to 2000";
    }
    return null;
  }
}
