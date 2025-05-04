import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_channels/data/native/channel.dart';
import 'package:flutter_platform_channels/data/native/native_datasource.dart';
import 'package:flutter_platform_channels/domain/repository/repository.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';
import 'package:flutter_platform_channels/ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

MethodChannel getMethodChannel() => const MethodChannel(Channel.name);

NativeDataSource getNativeDataSource() =>
    NativeDataSourceImpl(methodChannel: getMethodChannel());

Repository getRepository() =>
    RepositoryImpl(nativeDataSource: getNativeDataSource());

HomeBloc getHomeBloc() {
  return HomeBloc(repository: getRepository());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => getHomeBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
