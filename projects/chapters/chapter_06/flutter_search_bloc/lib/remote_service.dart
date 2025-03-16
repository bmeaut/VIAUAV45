import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:username_gen/username_gen.dart';

class User extends Equatable {
  final String name;
  final String imageUrl;

  const User(this.name, this.imageUrl);

  @override
  List<Object?> get props => [name, imageUrl];
}

class RemoteService {
  Future<List<User>> searchUsers(String name) async {
    await Future.delayed(
      Duration(seconds: max(0, 4 - name.length), milliseconds: 100),
    );
    if (name == "error") {
      throw "No network connection!";
    }
    return [
      for (int i = 0; i < max(0, 4 - name.length) * 10 + 2; i++)
        User(
          '$name${UsernameGen.generateWith()}',
          'https://picsum.photos/id/${Random().nextInt(600)}/90/90.jpg',
        ),
    ];
  }
}

final remoteService = RemoteService();
