import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_most_popular/main.dart';

void main() {
  testWidgets('Basic widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(NytApp());

    // Verification.
    expect(find.text('UNEXPECTED_STRING'), findsNothing);
  });
}
