import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';

import '../entities/domain_user.dart';

class SignIn {
  final AuthenticationRepository _authenticationRepository;

  SignIn({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  Future<DomainUser> call(
      {required String email, required String password})  =>
       _authenticationRepository.signIn(email: email, password: password);

}
