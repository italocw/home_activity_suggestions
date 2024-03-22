import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';

import '../../../../core/result.dart';

abstract class AuthenticationRepository {
  Future<Result<DomainUser>> signIn(
      {required String email, required String password});

  Future<Result<DomainUser>> createAccount(
      {required String email, required String password});

  Future<void> logout();

  DomainUser? get currentDomainUser;
}
