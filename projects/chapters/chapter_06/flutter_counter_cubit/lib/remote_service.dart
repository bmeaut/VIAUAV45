class RemoteService {
  Future<int> incrementCounter(int currentValue) async {
    await Future.delayed(Duration(seconds: 3));
    throw "No network found!";
    return currentValue + 1;
  }
}

final remoteService = RemoteService();
