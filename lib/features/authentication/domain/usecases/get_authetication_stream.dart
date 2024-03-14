import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_sugestions/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetAuthenticationStream {
  final AuthenticationRepositoryImpl repository;

  GetAuthenticationStream(this.repository);

  Stream<QuerySnapshot<Object?>> call() => throw Exception();
}
