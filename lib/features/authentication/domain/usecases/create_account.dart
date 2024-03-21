import 'package:home_activity_suggestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/result.dart';

class CreateAccount {
  final AuthenticationRepository _authenticationRepository;

  CreateAccount({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  Future<Result<DomainUser>> call(
          {required String email, required String password})  =>
       _authenticationRepository.createAccount(email: email, password: password);
}
