import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_forum/ui/login/login_page.dart';

class ForumDrawer extends StatelessWidget {
  final User user;
  final FirebaseAnalytics analytics;

  const ForumDrawer(this.user, this.analytics, {super.key});

  Future<void> _logOut() {
    return FirebaseAuth.instance.signOut();
  }

  void _apocalypse() async {
    FirebaseCrashlytics.instance.crash();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Material(
            child: UserAccountsDrawerHeader(
              accountName: Text(
                user.email!.substring(0, user.email!.indexOf("@")),
              ),
              accountEmail: Text(user.email!),
            ),
          ),
          DrawerMenuItem(
            icon: Icon(Icons.exit_to_app),
            text: Text("Logout"),
            onTap: () {
              _logOut();
              analytics.logEvent(name: "log_out");
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          Conditional.single(
            context: context,
            conditionBuilder: (context) => !kIsWeb,
            widgetBuilder:
                (context) => DrawerMenuItem(
                  icon: Icon(Icons.cancel, color: Colors.red),
                  text: Text("Crash the app :("),
                  onTap: () {
                    _apocalypse();
                  },
                ),
            fallbackBuilder: (context) => Container(),
          ),
        ],
      ),
    );
  }
}

class DrawerMenuItem extends StatelessWidget {
  final Icon icon;
  final Text text;
  final Function() onTap;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.only(right: 4.0), child: icon),
            text,
          ],
        ),
      ),
    );
  }
}
