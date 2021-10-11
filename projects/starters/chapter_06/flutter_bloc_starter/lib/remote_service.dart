import 'dart:math';

import 'package:username_gen/username_gen.dart';

class User{
  final String name;
  final String imageUrl;

  User(this.name, this.imageUrl);
}

class RemoteService {
  Future<List<User>> searchUsers(String name) async {
    await Future.delayed(Duration(seconds: max(0, 4 - name.length), milliseconds: 100));
    return [
      for (int i = 0; i < max(0, 4 - name.length) * 10 + 2; i++)
        User(
          '$name${UsernameGen.generateWith()}',
          'https://source.unsplash.com/user/filipp_roman_photography/90x90?${Random().nextInt(1024)}'
        ),
    ];
  }
}

final remoteService = RemoteService();