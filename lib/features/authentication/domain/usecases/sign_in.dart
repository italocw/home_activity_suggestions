import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/data/result.dart';
import '../entities/domain_user.dart';

class SignIn {
  final AuthenticationRepository _authenticationRepository;

  SignIn({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  Future<Result<DomainUser>> call(
          {required String email, required String password}) =>
      _authenticationRepository.signIn(email: email, password: password);
}
