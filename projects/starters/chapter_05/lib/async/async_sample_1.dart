import "dart:async";

Future<String> myLongRunningFunction() => Future.delayed(
      Duration(seconds: 3),
      () {
        print("Inside the future");
        throw Exception("No internet connection!");
        return "Hello in the future!";
      },
    );

void main() {
  print("Starting main");
  var futureResult = myLongRunningFunction();
  print("Immediate result: $futureResult");
  futureResult
      .then(
        (result) {
          print("Result of function: $result");
        },
      )
      .timeout(
        Duration(
          seconds: 1,
        ),
      )
      .catchError(
        (error) {
          print("Caught TimeoutException error: $error");
        },
        test: (e) => e is TimeoutException,
      )
      .catchError(
        (error) {
          print("Caught String error: $error");
        },
        test: (e) => e is String,
      )
      .whenComplete(() {
        print("Inside whenComplete");
      });
  var i = 0;
  /*while(true){
    for (int j = 0; j < 1000; j++)
      print("${i++}");
  } !!FREEZES!!*/
  print("Ending main");
}
