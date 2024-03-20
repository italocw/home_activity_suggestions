import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_suggestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_suggestions/features/authentication/data/user_mappers.dart';
import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';

import '../../domain/entities/domain_user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _dataSource;

  AuthenticationRepositoryImpl(
      {required AuthenticationDataSource authenticationDataSource})
      : _dataSource = authenticationDataSource;

  @override
  Future<DomainUser> signIn(
      {required String email, required String password}) async {
    final signedInUserCredential =
        await _dataSource.signIn(email: email, password: password);

    return signedInUserCredential.toDomainUser();
  }

  @override
  Future<DomainUser> createAccount(
      {required String email, required String password}) async {
    final createAccountCredential =
        await _dataSource.createAccount(email: email, password: password);
    return createAccountCredential.toDomainUser();
  }

  @override
  Future<void> logout() async {
    await _dataSource.logout();
  }
}
