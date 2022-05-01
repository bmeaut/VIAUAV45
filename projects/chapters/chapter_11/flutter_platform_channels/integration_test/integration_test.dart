import 'package:flutter_platform_channels/ui/utils/ui_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_platform_channels/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Happy scenario', () {
    testWidgets(
      'User is able to fetch the data of the Temp. sensor',
      (WidgetTester tester) async {
        /// Given the main page
        await clearSharedPrefsBeforeTest();
        app.main();

        /// And we see the refresh button of the home screen,
        final homeScreenFinder = find.byKey(UiKeys.homePage);
        final homeRefreshButtonFinder = find.byKey(UiKeys.homeRefreshButton);
        await tester.pumpAndSettle();
        expect(homeScreenFinder, findsOneWidget);
        expect(homeRefreshButtonFinder, findsOneWidget);

        /// When we tap the refresh button of home page
        await tester.ensureVisible(homeRefreshButtonFinder);
        await tester.tap(homeRefreshButtonFinder);
        await tester.pumpAndSettle();

        /// Then we should see the received data
        final resultTextFinder = find.textContaining('Received data');
        expect(resultTextFinder, findsOneWidget);
      },
    );
  });
}

Future clearSharedPrefsBeforeTest() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}
