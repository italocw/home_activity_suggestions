import 'package:home_activity_sugestions/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

class Logout {
  final AuthenticationRepository repository;

  Logout(this.repository);

  Future<void> call() async => throw Exception;
}
