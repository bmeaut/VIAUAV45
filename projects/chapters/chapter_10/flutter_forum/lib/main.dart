import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'ui/createpost/create_post_page.dart';
import 'ui/login/login_page.dart';
import 'ui/posts/posts_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FlutterForumApp());
}

class FlutterForumApp extends StatelessWidget {
  const FlutterForumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => FirebaseAnalytics.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Forum',
          theme: ThemeData(primarySwatch: Colors.amber),
          home: HomeScreenRenderer(),
          routes: {
            "/login": (context) => LoginPage(),
            "/posts": (context) => PostsPage(),
            "/create_post": (context) => CreatePostPage(),
          },
          navigatorObservers: [
            FirebaseAnalyticsObserver(
              analytics: Provider.of<FirebaseAnalytics>(context),
            ),
          ],
        );
      },
    );
  }
}

class HomeScreenRenderer extends StatelessWidget {
  const HomeScreenRenderer({super.key});

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
