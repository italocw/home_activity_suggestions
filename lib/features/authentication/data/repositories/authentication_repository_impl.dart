import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_activity_suggestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_suggestions/features/authentication/domain/domain_user_converter.dart';
import 'package:home_activity_suggestions/features/authentication/domain/repositories/authentication_repository.dart';

import '../../../../core/result.dart';
import '../../domain/entities/domain_user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _dataSource;
  final DomainUserConverter _domainUserConverter;

  AuthenticationRepositoryImpl(
      {required AuthenticationDataSource authenticationDataSource,
      required DomainUserConverter domainUserConverter})
      : _dataSource = authenticationDataSource,
        _domainUserConverter = domainUserConverter;

  @override
  Future<Result<DomainUser>> signIn(
      {required String email, required String password})  async {
    late Result<DomainUser> result;
    try {
     final userCredential = await   _dataSource.signIn(email: email, password: password);
     result = Success(_domainUserConverter.fromUserCredential(userCredential: userCredential));
    } on Exception catch (exception) {
      result = Failure(exception);
    }
    return Future.value(result);
  }

  @override
  Future<Result<DomainUser>> createAccount(
      {required String email, required String password}) async {
    late Result<DomainUser> result;
    try {
      final userCredential = await   _dataSource.createAccount(email: email, password: password);
      result = Success(_domainUserConverter.fromUserCredential(userCredential: userCredential));
    } on Exception catch (exception) {
      result = Failure(exception);
    }
    return Future.value(result);
  }

  @override
  Future<void> logout() async {
    await _dataSource.logout();
  }
}
