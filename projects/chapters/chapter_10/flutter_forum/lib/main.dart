import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';

import 'ui/createpost/create_post_page.dart';
import 'ui/login/login_page.dart';
import 'ui/posts/posts_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FirebaseInitializer());
}

class FirebaseInitializer extends StatefulWidget {
  @override
  _FirebaseInitializerState createState() => _FirebaseInitializerState();
}

class _FirebaseInitializerState extends State<FirebaseInitializer> {
  late Future<FirebaseApp> _initialization;

  Future<FirebaseApp> initFirebase() async {
    // Initialize FlutterFire (Firebase)
    final firebaseApp = await Firebase.initializeApp();
    if (kDebugMode && !kIsWeb) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }
    return firebaseApp;
  }

  @override
  void initState() {
    super.initState();
    _initialization = initFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => FirebaseAnalytics.instance,
      child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Failed to initialize Firebase. :(",
                  textDirection: TextDirection.ltr,
                ),
              );
            }

            if (snapshot.hasData) {
              return FlutterForumApp();
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class FlutterForumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Forum',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreenRenderer(),
      routes: {
        "/login": (context) => LoginPage(),
        "/posts": (context) => PostsPage(),
        "/create_post": (context) => CreatePostPage(),
      },
      navigatorObservers: [
        FirebaseAnalyticsObserver(
            analytics: Provider.of<FirebaseAnalytics>(context)),
      ],
    );
  }
}

class HomeScreenRenderer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Conditional.single(
      context: context,
      conditionBuilder: (context) {
        return FirebaseAuth.instance.currentUser != null;
      },
      widgetBuilder: (context) => PostsPage(),
      fallbackBuilder: (context) => LoginPage(),
    );
  }
}
