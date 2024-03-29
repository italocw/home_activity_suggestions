import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/data/data_providers.dart';
import 'package:home_activity_suggestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_suggestions/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/create_account.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/sign_in.dart';
import 'package:home_activity_suggestions/features/authentication/domain/usecases/switch_auth_screen_mode.dart';

import '../../presentation/providers/auth_screen_mode_provider.dart';
import 'logout.dart';

final Provider<SwitchAuthScreenMode>  switchAuthScreenModeProvider =
    Provider((ref) {
      final authScreenModeNotifier = ref.read(authModeNotifierProvider.notifier);
      return SwitchAuthScreenMode(authScreenModeNotifier: authScreenModeNotifier);
    });

final Provider<CreateAccount>  createAccountProvider = Provider((ref) {
      final authenticationRepository =
          ref.read(authRepositoryProvider);
      return CreateAccount(authenticationRepository: authenticationRepository);
    });

final Provider<SignIn>  signInProvider = Provider((ref) {
      final authenticationRepository =
          ref.read(authRepositoryProvider);
      return SignIn(authenticationRepository: authenticationRepository);
    });

final Provider<Logout>  logoutProvider = Provider((ref) {
      final authenticationRepository =
          ref.read(authRepositoryProvider);
      return Logout(authenticationRepository: authenticationRepository);
    });
