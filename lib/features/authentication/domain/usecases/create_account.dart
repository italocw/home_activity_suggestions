import 'package:home_activity_sugestions/features/authentication/domain/repositories/authentication_repository.dart';

class CreateAccount {
  final AuthenticationRepository _authenticationRepository;

  CreateAccount({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  Future<void> call(String email, String password) async => throw Exception;
}
