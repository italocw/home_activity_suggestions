import 'package:home_activity_sugestions/features/authentication/domain/entities/domain_user.dart';

abstract class AuthenticationRepository {
  Future<DomainUser> signIn({required String email, required String password});
  Future<DomainUser> createAccount({required String email, required String password});
  Future<void> logout();
}
