import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';
import 'package:flutter_platform_channels/ui/home/widgets/home_error.dart';
import 'package:flutter_platform_channels/ui/home/widgets/home_loading.dart';
import 'package:flutter_platform_channels/ui/utils/ui_keys.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      appBar: AppBar(title: Text("Flutter Platform Channels demo")),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeStateLoading() => HomeLoadingWidget(),
            HomeStateError() => HomeErrorWidget(),
            HomeStateInitial() => SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Text(
                      'Tap the button to get sensor data!',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      key: UiKeys.homeRefreshButton,
                      onPressed: () async {
                        _dispatch(HomeEventGetTemperature());
                      },
                      child: Text("Refresh"),
                    ),
                  ],
                ),
              ),
            HomeStateLoaded() => Container(
                width: double.infinity,
                child: Column(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Received data from native:\n${state.temperature}',
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      key: UiKeys.homeRefreshButton,
                      onPressed: () async {
                        _dispatch(HomeEventGetTemperature());
                      },
                      child: Text("Refresh again"),
                    ),
                  ],
                ),
              ),
            HomeState() => throw UnimplementedError(),
          };
        },
      ),
    );
  }
}
