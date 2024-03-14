import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_sugestions/features/authentication/data/datasource/authentication_datasource.dart';
import 'package:home_activity_sugestions/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource _dataSource;

  AuthenticationRepositoryImpl(
      {required AuthenticationDataSource authenticationDataSource})
      : _dataSource = authenticationDataSource;

  @override
  Future<void> createAccount(String email, String password) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  // TODO: implement snapshots
  Stream<QuerySnapshot<Object?>> get snapshots => throw UnimplementedError();
}
