import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_sugestions/core/result.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/entities/suggestion.dart';

abstract class AuthenticationRepository {
  Future<void> signIn(String email, String password);
  Future<void> createAccount(String email, String password);
  Future<void> logout();
}
