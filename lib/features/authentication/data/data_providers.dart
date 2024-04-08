import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';
import 'package:home_activity_suggestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_suggestions/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:home_activity_suggestions/features/authentication/domain/domain_user_converter.dart';

import '../domain/repositories/authentication_repository.dart';
import '../presentation/providers/auth_screen_error_message_builder.dart';

final Provider<FirebaseAuth> firebaseAuthProvider = Provider((ref) {
      return FirebaseAuth.instance;
    });

final Provider<AuthenticationDataSource> authenticationDatasourceProvider =
   Provider ((ref) {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      return AuthenticationDataSource(firebaseAuth: firebaseAuth);
    });

final Provider<DomainUserConverter> domainUserConverterProvider =
Provider ((ref) {
  return DomainUserConverter();
});

final StreamProvider<User?>  userStreamProvider = StreamProvider<User?>((ref) {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      return firebaseAuth.authStateChanges();
    });

final Provider<AuthenticationRepository> authRepositoryProvider =
    Provider((ref) {
      final authenticationDatasource =
          ref.read(authenticationDatasourceProvider);
      final domainUserConverter =
      ref.read(domainUserConverterProvider);

      return AuthenticationRepositoryImpl(
          authenticationDataSource: authenticationDatasource, domainUserConverter: domainUserConverter);
    });

final Provider<AuthScreenErrorMessageBuilder> authScreenErrorMessageBuilderProvider =
Provider ((ref) {
  final appLocalizations =  ref.read(appLocalizationsProvider);
  return AuthScreenErrorMessageBuilder(appLocalizations: appLocalizations);
});
