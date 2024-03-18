import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_sugestions/features/authentication/data/data_providers.dart';
import 'package:home_activity_sugestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_sugestions/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:home_activity_sugestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/create_account.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/sign_in.dart';
import 'package:home_activity_sugestions/features/authentication/domain/usecases/switch_auth_screen_mode.dart';

import '../../presentation/providers/auth_screen_mode_provider.dart';
import 'logout.dart';

Provider<SwitchAuthScreenMode> get switchAuthScreenModeProvider =>
    Provider((ref) {
      final authScreenModeNotifier = ref.read(authScreenModeNotifierProvider.notifier);
      return SwitchAuthScreenMode(authScreenModeNotifier: authScreenModeNotifier);
    });

Provider<AuthenticationDataSource> get authenticationDataSourceProvider =>
    Provider((ref) {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      return AuthenticationDataSource(firebaseAuth: firebaseAuth);
    });

Provider<AuthenticationRepository> get authenticationRepositoryProvider =>
    Provider((ref) {
      final authenticationDataSource =
          ref.read(authenticationDataSourceProvider);
      return AuthenticationRepositoryImpl(
          authenticationDataSource: authenticationDataSource);
    });

Provider<CreateAccount> get createAccountProvider => Provider((ref) {
      final authenticationRepository =
          ref.read(authenticationRepositoryProvider);
      return CreateAccount(authenticationRepository: authenticationRepository);
    });

Provider<SignIn> get signInProvider => Provider((ref) {
      final authenticationRepository =
          ref.read(authenticationRepositoryProvider);
      return SignIn(authenticationRepository: authenticationRepository);
    });

Provider<Logout> get logoutProvider => Provider((ref) {
      final authenticationRepository =
          ref.read(authenticationRepositoryProvider);
      return Logout(authenticationRepository: authenticationRepository);
    });
