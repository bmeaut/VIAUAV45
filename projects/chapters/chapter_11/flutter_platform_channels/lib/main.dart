import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_channels/data/native/channel.dart';
import 'package:flutter_platform_channels/data/native/native_datasource.dart';
import 'package:flutter_platform_channels/domain/repository/repository.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';
import 'package:flutter_platform_channels/ui/home/home.dart';

void main() {
  runApp(MyApp());
}

MethodChannel getMethodChannel() {
  return const MethodChannel(Channel.name);
}

NativeDataSource getNativeDataSource() {
  return NativeDataSourceImpl(methodChannel: getMethodChannel());
}

Repository getRepository() {
  return RepositoryImpl(
    nativeDataSource: getNativeDataSource(),
  );
}

HomeBloc getHomeBloc() {
  return HomeBloc(
    repository: getRepository(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => getHomeBloc(),
        child: MyHomePage(),
      ),
    );
  }
}
