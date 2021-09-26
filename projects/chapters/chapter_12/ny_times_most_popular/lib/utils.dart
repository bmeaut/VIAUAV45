import 'package:flutter/material.dart';

extension BuildContextHelpers on BuildContext {
  void showSnackBar({required Widget content}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: content),
    );
  }
}
