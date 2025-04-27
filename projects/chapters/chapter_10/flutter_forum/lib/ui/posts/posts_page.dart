import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forum/domain/model/post.dart';
import 'package:flutter_forum/ui/drawer/drawer.dart';
import 'package:flutter_forum/ui/posts/post_item.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final posts = FirebaseFirestore.instance.collection("posts");
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Forum Posts")),
      body: StreamBuilder<QuerySnapshot>(
        stream: posts.orderBy("time", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            debugPrint("snapshot error: ${snapshot.error}");
            return Center(child: Text("Something went wrong"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            debugPrint("loading");
            return Center(child: CircularProgressIndicator());
          }

          final items = List.from(
            snapshot.data!.docs
                .map(
                  (post) => Post.fromJson(post.data() as Map<String, dynamic>),
                )
                .toList(),
          );

          if (items.isEmpty) {
            return Center(
              child: Text(
                "Nothing to see here\n¯\\_(ツ)_/¯",
                textAlign: TextAlign.center,
              ),
            );
          }

          debugPrint("loaded");
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return PostItem(items[index]);
            },
          );
        },
      ),
      drawer: ForumDrawer(user!, context.read<FirebaseAnalytics>()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/create_post");
        },
        child: Icon(Icons.forum),
      ),
    );
  }
}
