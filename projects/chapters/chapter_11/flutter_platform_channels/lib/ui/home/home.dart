import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';
import 'package:flutter_platform_channels/ui/home/widgets/home_error.dart';
import 'package:flutter_platform_channels/ui/home/widgets/home_loading.dart';
import 'package:flutter_platform_channels/ui/utils/ui_keys.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
    //_dispatch(HomeEventGetTemperature());
  }

  void _dispatch(HomeEvent event) {
    bloc.add(event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UiKeys.homePage,
      appBar: AppBar(
        title: Text("Flutter Platform Channels demo - updated"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeStateLoading) {
            return HomeLoading();
          }
          if (state is HomeStateError) {
            return HomeError();
          }
          if (state is HomeStateInitial) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tap the button to get sensor data!',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    key: UiKeys.homeRefreshButton,
                    onPressed: () async {
                      _dispatch(HomeEventGetTemperature());
                    },
                    child: Text(
                      "Refresh",
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is HomeStateLoaded) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Received data from native:\n${state.temperature}',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    key: UiKeys.homeRefreshButton,
                    onPressed: () async {
                      _dispatch(HomeEventGetTemperature());
                    },
                    child: Text(
                      "Refresh again",
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
