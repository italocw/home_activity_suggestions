import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/core/color_schemes.g.dart';
import 'package:home_activity_sugestions/features/authentication/presentation/screens/auth_screen.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/screens/categories_screen.dart';
import 'package:home_activity_sugestions/features/suggestions/presentation/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final navigatorKeyProvider = Provider((_) => navigatorKey);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }

          return snapshot.hasData
              ? const CategoriesScreen()
              : const AuthScreen();
        },
      ),
    );
  }
}
