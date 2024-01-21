import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Backend/AuthBackend.dart';
import 'package:linkedin_clone/Authentication/Screens/ReusableWidgets.dart';
import 'package:linkedin_clone/HomePage/Post/PostsBackend.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({super.key});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  String? postTitle;
  String? postBody;
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
          return const Text("No data found");
        } else if (snapshot.hasError) {
          return Text("Error found ${snapshot.error}");
        } else {
          List<Map<String, dynamic>> userPostList = snapshot.data ?? [];
          return ListView.builder(
              itemCount: userPostList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> userPosts = userPostList[index];
                postTitle = userPosts?["PostTitle"] as String? ?? "";
                postBody = userPosts?["PostBody"] as String? ?? "";
                print("postTitle: $postTitle postBody:$postBody");
                // return ListTile(
                //   title: Center(
                //     child: Text(
                //       postTitle,
                //       style: const TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.bold,
                //           fontSize: 25),
                //     ),
                //   ),
                //   subtitle: Text(
                //     postBody,
                //     style: const TextStyle(
                //         color: Colors.black87,
                //         fontWeight: FontWeight.normal,
                //         fontSize: 20),
                //   ),
                // );
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 10,
                    right: 10,
                  ),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            postTitle!,
                            style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          postBody!,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await PostDataToFirebase().deletePost(
                                      context: context, docId: postTitle);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  ShowBottomTextField();
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      },
    ));
  }

  void ShowBottomTextField() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          TextEditingController titleController =
              TextEditingController(text: postTitle ?? "");
          TextEditingController bodyController =
              TextEditingController(text: postBody ?? "");
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 10),
              child: Column(
                children: [
                  textFormField(
                      titleController,
                      TextInputType.text,
                      const Icon(Icons.title_outlined),
                      null,
                      2,
                      1,
                      50,
                      false,
                      "Update The Title of your Post",
                      "Update Title",
                      true,
                      Colors.white12,
                      OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  const SizedBox(
                    height: 20,
                  ),
                  textFormField(
                      bodyController,
                      TextInputType.text,
                      const Icon(Icons.note),
                      null,
                      50,
                      1,
                      2000,
                      false,
                      "Edit The Body of your Post",
                      "Edit Body",
                      true,
                      Colors.white12,
                      OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        String? validated = validatePost(
                            postTitle: titleController.text,
                            postBody: bodyController.text);
                        if (validated != null) {
                          ShowerrorMessage(validated, context);
                        } else {
                          await PostDataToFirebase()
                              .UpdatePostData(docId: postTitle!, updatedData: {
                            "PostTitle": titleController.text,
                            "PostBody": bodyController.text,
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        "Update",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                ],
              ),
            ),
          );
        });
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
