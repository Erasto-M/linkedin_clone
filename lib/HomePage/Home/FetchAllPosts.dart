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
        child: FutureBuilder<List<Map<String, dynamic>>?>(
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
                    String userName =
                        fetchedPosts?["FullName"] as String? ?? "";
                    String userEmail = fetchedPosts?["Email"] as String? ?? "";
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "images/browsingImage.png"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(userName),
                                    Text(userEmail),
                                    const Text("Software engineer"),
                                    const Text("Safaricom PLC"),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
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
                            const Divider(
                              thickness: 1,
                              color: Colors.black12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.heart_broken,
                                            color: Colors.blue,
                                            size: 25,
                                          )),
                                      const Text(
                                        "Like",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.comment,
                                            color: Colors.blue,
                                            size: 25,
                                          )),
                                      const Text(
                                        "Comment",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_circle_right_outlined,
                                            color: Colors.blue,
                                            size: 25,
                                          )),
                                      const Text(
                                        "Repost",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.send,
                                            color: Colors.blue,
                                            size: 25,
                                          )),
                                      const Text(
                                        "Send",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
