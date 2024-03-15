import 'package:home_activity_sugestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

class SignIn {
  final AuthenticationRepository _authenticationRepository;

  SignIn({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  Future<void> call(String email, String password) async => throw Exception;
}
