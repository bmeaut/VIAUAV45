import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const ImageDownloaderApp());
}

class ImageDownloaderApp extends StatelessWidget {
  const ImageDownloaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Downloader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ImageDownloaderPage(title: 'Image Downloader Home Page'),
    );
  }
}

class ImageDownloaderPage extends StatefulWidget {
  const ImageDownloaderPage({super.key, required this.title});

  final String title;

  @override
  State<ImageDownloaderPage> createState() => _ImageDownloaderPageState();
}

class _ImageDownloaderPageState extends State<ImageDownloaderPage> {
  static const imagesDir = 'images';
  final Uuid uuidGenerator = const Uuid();
  late Future<List<File>> _imageFiles;

  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: false,
    );
    _imageFiles = _loadImages();
  }

  Future<Directory> _getImagesDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return Directory(path.join(directory.path, imagesDir)).create();
  }

  Future<void> _downloadNewImage() async {
    final response = await http.get(Uri.parse("https://picsum.photos/400"));
    final imagesDir = await _getImagesDirectory();
    final filePath = path.join(
      imagesDir.path,
      "${uuidGenerator.v4().toString()}.jpg",
    );
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    debugPrint("Image downloaded to: $filePath");

    setState(() {
      _imageFiles = _loadImages();
    });
  }

  Future<List<File>> _loadImages() async {
    final imagesDir = await _getImagesDirectory();
    return imagesDir
        .list()
        .where((element) => element.path.endsWith(".jpg"))
        .map((e) => File(e.path))
        .toList();
  }

  void _scrollToEnd() {
    if (_scrollController != null) {
      _scrollController!.animateTo(
        _scrollController!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.bounceOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<File>>(
          future: _imageFiles,
          initialData: const [],
          builder: (context, snapshot) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              _scrollToEnd();
            });
            if (snapshot.hasData) {
              final imageFiles = snapshot.data;
              return GridView.builder(
                controller: _scrollController,
                itemCount: imageFiles!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Image.file(imageFiles[index]);
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _downloadNewImage,
        tooltip: 'Download image',
        child: const Icon(Icons.file_download),
      ),
    );
  }
}
