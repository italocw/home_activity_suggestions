import 'package:home_activity_sugestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

class CreateAccount {
  final AuthenticationRepository repository;

  CreateAccount(this.repository);

  Future<void> call(String email, String password) async => throw Exception;
}
