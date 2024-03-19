import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

import '../features/authentication/data/data_providers.dart';
import '../features/authentication/presentation/components/screens/auth_screen.dart';
import '../features/suggestions/presentation/screens/categories_screen.dart';
import '../features/suggestions/presentation/screens/splash_screen.dart';

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
