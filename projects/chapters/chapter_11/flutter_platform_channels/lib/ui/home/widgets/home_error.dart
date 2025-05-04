import 'package:flutter/material.dart';
import 'package:flutter_platform_channels/ui/utils/ui_keys.dart';

class HomeErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      key: UiKeys.homeErrorWidget,
      child: Text(
        "Something went wrong while fetching platform-specific data",
      ),
    );
  }
}
