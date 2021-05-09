import 'package:flutter/services.dart';
import 'package:flutter_platform_channels/data/native/native_datasource.dart';
import 'package:flutter_platform_channels/domain/repository/repository.dart';
import 'package:mockito/mockito.dart';

class MethodChannelMock extends Mock implements MethodChannel {}

class NativeDataSourceMock extends Mock implements NativeDataSource {}

class RepositoryMock extends Mock implements Repository {}
