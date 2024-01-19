import 'package:flutter/material.dart';
import 'package:linkedin_clone/Authentication/Screens/ReusableWidgets.dart';
import 'package:linkedin_clone/HomePage/Post/PostsBackend.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({super.key});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  final updateTitleController = TextEditingController();
  final updateBodyController = TextEditingController();
  String? postTitle;
  String? postBody;
  @override
  void initState(){
    super.initState();
    updateTitleController.text = "$postTitle";
    updateBodyController.text = "$postBody";
  }
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
                                onPressed: () {},
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
          return Container(
            child: Column(
              children: [
                textFormField(
                    (updateTitleController.text = postTitle ?? ""  ) as TextEditingController,
                    TextInputType.text,
                    const Icon(Icons.note),
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
                const Spacer(),
                textFormField(
                    (updateBodyController.text = postBody ?? "") as TextEditingController,
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
                const Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Update",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
              ],
            ),
          );
        });
  }
}
