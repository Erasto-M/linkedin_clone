import 'package:flutter/material.dart';
import 'package:linkedin_clone/HomePage/Post/PostsBackend.dart';

class AllPosts extends StatefulWidget {
  const AllPosts({super.key});

  @override
  State<AllPosts> createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Search For A post",
                  labelText: "Search Post",
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 25,
                      )),
                ),
              ),
            ),
            FutureBuilder<List<Map<String, dynamic>>?>(
              future: PostDataToFirebase().FetchAllPosts(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                } else if (snapShot.hasError) {
                  return Text("There is an error : ${snapShot.error}");
                } else if (!snapShot.hasData) {
                  return const Text("There is an error");
                } else {
                  List<Map<String, dynamic>>? AllPosts = snapShot.data ?? [];
                  return ListView.builder(
                      itemCount: AllPosts.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> fetchedPosts = AllPosts[index];
                        String postTitle =
                            fetchedPosts?["PostTitle"] as String? ?? "";
                        String postBody =
                            fetchedPosts?["PostBody"] as String? ?? "";
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Card(
                            child: Column(
                              children: [
                                Center(
                                    child: Text(
                                  postTitle,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Text(
                                  postBody,
                                  style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal),
                                )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.heart_broken,
                                          color: Colors.blue,
                                          size: 25,
                                        )),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.share,
                                          color: Colors.blue,
                                          size: 25,
                                        )),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.post_add,
                                          color: Colors.blue,
                                          size: 25,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}