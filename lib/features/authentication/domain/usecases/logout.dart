import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';

class Logout {
  final AuthenticationRepository _authenticationRepository;

  Logout({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository;

  Future<void> call()  => _authenticationRepository.logout();
}
