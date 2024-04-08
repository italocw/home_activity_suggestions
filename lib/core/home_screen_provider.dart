import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/authentication/data/data_providers.dart';
import '../features/authentication/presentation/components/screens/auth_screen.dart';
import '../features/suggestions/presentation/components/screens/categories_screen.dart';
import 'components/splash_screen.dart';

final StateProvider<Widget> homeScreenProvider = StateProvider((ref) {
  return StreamBuilder(
      stream: ref.read(firebaseAuthProvider).authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen();
        } else {
          return snapshot.hasData
              ? const CategoriesScreen()
              : const AuthScreen();
        }
      });
});
