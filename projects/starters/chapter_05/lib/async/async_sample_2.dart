Future<String> myLongRunningFunction() => Future.delayed(
      Duration(seconds: 3),
      () {
        print("Inside the future");
        throw Exception("No internet connection!");
        return "Hello in the future!";
      },
    );

Future<String> myAsyncFunction() async {
  await Future.delayed(Duration(seconds: 3));
  print("Inside the future");
  throw Exception("No internet connection");
  return "Hello in the future";
}

void asyncVoidFunction() async {
  print("Starting async void function!");
  await Future.delayed(Duration(seconds: 1));
  print("Ending async void function!");
}

void myAsyncTestFunction() async {
  print("Starting async func");
  asyncVoidFunction();
  //await asyncVoidFunction(); //!ERROR! Cannot await void function
  print("Calling long running function!");
  try {
    var result = await myLongRunningFunction();
    print("Immediate result: $result");
  } catch (e) {
    print("Caught error: $e");
  } finally {
    print("Inside finally");
  }
}

void main() {
  print("Starting main function!");
  myAsyncTestFunction();
  print("Ending main function!");
}
