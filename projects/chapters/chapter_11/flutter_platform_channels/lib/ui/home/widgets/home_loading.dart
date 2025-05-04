import 'package:flutter/material.dart';
import 'package:flutter_platform_channels/ui/utils/ui_keys.dart';

class HomeLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      key: UiKeys.homeLoadingWidget,
      child: CircularProgressIndicator(),
    );
  }
}
