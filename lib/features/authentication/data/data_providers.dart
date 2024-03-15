import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_sugestions/features/authentication/data/repositories/authentication_repository_impl.dart';

import '../domain/repositories/authentication_repository.dart';

Provider<FirebaseAuth> get firebaseAuthProvider => Provider((ref) {
      return FirebaseAuth.instance;
    });

Provider<AuthenticationDataSource> get authenticationDatasourceProvider =>
   Provider ((ref) {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      return AuthenticationDataSource(firebaseAuth: firebaseAuth);
    });

StreamProvider<User?> get userStreamProvider => StreamProvider<User?>((ref) {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      return firebaseAuth.authStateChanges();
    });

Provider<AuthenticationRepository> get authRepositoryProvider =>
    Provider((ref) {
      final authenticationDatasource =
          ref.read(authenticationDatasourceProvider);

      return AuthenticationRepositoryImpl(
          authenticationDataSource: authenticationDatasource);
    });