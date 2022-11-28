import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ny_times_most_popular/di/injectable_di.config.dart';

final injector = GetIt.instance;

@InjectableInit()
Future configureDependencies() => injector.init();