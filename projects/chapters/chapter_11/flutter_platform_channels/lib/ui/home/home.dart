import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_channels/ui/home/bloc/home_bloc.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeStateLoading) {
          //Fetch the platform-specific data:
          context.read<HomeBloc>().add(HomeEventGetTemperature());
          return HomeLoading();
        }

        if (state is HomeStateLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Flutter Platform Channels demo - updated"),
            ),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Received data from native:\n${state.temperature}',
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      context.read<HomeBloc>().add(HomeEventGetTemperature());
                    },
                    child: Text(
                      "Refresh",
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is HomeStateError) {
          return HomeError();
        }

        return Container();
      },
    );
  }
}

class HomeLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Platform Channels demo - updated"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class HomeError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Platform Channels demo - updated"),
      ),
      body: Center(
        child: Text(
          "Something went wrong while fetching platform-specific data",
        ),
      ),
    );
  }
}
