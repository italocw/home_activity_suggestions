import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_sugestions/features/authentication/data/repositories/authentication_repository_impl.dart';

Provider<FirebaseAuth> get firebaseAuthProvider => Provider((ref) {
      return FirebaseAuth.instance;
    });

Provider<AuthenticationDataSource> get authenticationDatasourceProvider =>
    Provider((ref) {
      final firebaseAuth = ref.read(firebaseAuthProvider);

      return AuthenticationDataSource(firebaseAuth: firebaseAuth);
    });

Provider<AuthenticationRepositoryImpl> get authenticationRepositoryProvider =>
    Provider((ref) {
      final authenticationDatasource =
          ref.read(authenticationDatasourceProvider);

      return AuthenticationRepositoryImpl(
          authenticationDataSource: authenticationDatasource);
    });
