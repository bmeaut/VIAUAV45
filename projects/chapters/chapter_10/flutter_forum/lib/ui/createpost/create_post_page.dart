import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forum/domain/model/post.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _postTitleController = TextEditingController();
  final _postBodyController = TextEditingController();
  final posts = FirebaseFirestore.instance.collection("posts");

  Future<File>? _imageFuture;
  File? _selectedImage;
  String? _imageUrl;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    setState(() {
      if (pickedFile != null) {
        _imageFuture = Future.value(File(pickedFile.path));
      } else {
        debugPrint('No image selected.');
      }
    });
  }

  Future<void> _submitPost(BuildContext context) async {
    if (_selectedImage != null) {
      final storageRef = FirebaseStorage.instance.ref();
      final imageName = UriData.fromString(
        "${Uuid().v4()}.jpg",
        encoding: Encoding.getByName("UTF-8"),
      );
      final newImageRef = storageRef.child("images/$imageName");
      await newImageRef.putFile(_selectedImage!);
      _imageUrl = await newImageRef.getDownloadURL();

      if (context.mounted) {
        return uploadPost(context, _imageUrl);
      }
    } else {
      return uploadPost(context);
    }
  }

  Future<void> uploadPost(BuildContext context, [String? imageUrl]) {
    final newPost =
        Post(
          uid: Uuid().v4(),
          title: _postTitleController.text,
          time: DateTime.now(),
          body: _postBodyController.text,
          author: FirebaseAuth.instance.currentUser?.email ?? "Anonymous",
          imageUrl: imageUrl,
        ).toJson();

    return posts.add(newPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            TextField(
              controller: _postTitleController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Title",
              ),
            ),
            TextField(
              controller: _postBodyController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                labelText: "Write something nice here",
              ),
            ),
            FutureBuilder<File>(
              future: _imageFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  _selectedImage = snapshot.data!;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child:
                          !kIsWeb ? Image.file(_selectedImage!) : Container(),
                    ),
                  );
                }

                return Container();
              },
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage();
              },
              child: Text("Take a photo".toUpperCase()),
            ),
            ElevatedButton(
              onPressed: () async {
                await _submitPost(context);
                if (context.mounted) {
                  Provider.of<FirebaseAnalytics>(
                    context,
                    listen: false,
                  ).logEvent(name: "post_created");
                  Navigator.pop(context);
                }
              },
              child: Text("Post".toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
