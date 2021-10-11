class RemoteService {
  Future<int> incrementCounter(int currentValue) =>
      Future.delayed(Duration(seconds: 3), () => currentValue + 1);
}

final remoteService = RemoteService();
