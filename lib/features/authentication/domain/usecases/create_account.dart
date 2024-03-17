import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_sugestions/features/authentication/domain/entities/domain_user.dart';
import 'package:home_activity_sugestions/features/authentication/domain/repositories/authentication_repository.dart';

class CreateAccount {
  final AuthenticationRepository _authenticationRepository;

  CreateAccount({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  Future<DomainUser> call(
          {required String email, required String password})  =>
       _authenticationRepository.createAccount(email: email, password: password);
}
