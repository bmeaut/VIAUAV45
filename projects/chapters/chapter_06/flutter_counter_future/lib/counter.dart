import 'package:flutter/cupertino.dart';
import 'package:flutter_counter_future/remote_service.dart';

class Counter extends ChangeNotifier {
  int count = 0;
  bool isLoading = false;
  String? error;

  void incrementCounter() async {
    if (isLoading) return;
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      count = await remoteService.incrementCounter(count);
    } on Exception catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  String get counterText => error ?? (isLoading ? "Loading" : count.toString());
}
