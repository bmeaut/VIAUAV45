import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_forum/domain/model/post.dart';
import 'package:flutter_forum/ui/createpost/create_post_page.dart';
import 'package:flutter_forum/ui/drawer/drawer.dart';
import 'package:flutter_forum/ui/login/login_page.dart';
import 'package:flutter_forum/ui/posts/post_item.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final posts = FirebaseFirestore.instance.collection("posts");
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Forum Posts"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: posts.orderBy("time", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            print("snapshot error: ${snapshot.error}");
            return Center(child: Text("Something went wrong"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            print("loading");
            return Center(child: CircularProgressIndicator());
          }

          final items = List.from(
            snapshot.data!.docs
                .map((post) => Post.fromJson(post.data() as Map<String, dynamic>))
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

          print("loaded");
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
