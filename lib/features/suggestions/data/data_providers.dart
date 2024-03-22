import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/data/data_providers.dart';

import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:home_activity_suggestions/features/suggestions/data/repositories/suggestion_repository_impl.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/suggestion_converter.dart';

final Provider<FirebaseFirestore> firebaseFirestoreProvider = Provider((ref) {
      return FirebaseFirestore.instance;
    });

final Provider<FirebaseAuth>  firebaseAuthProvider = Provider((ref) {
      return FirebaseAuth.instance;
    });

final Provider<SuggestionDataSource> suggestionDatasourceProvider =
    Provider((ref) {
      final firebaseFirestore = ref.read(firebaseFirestoreProvider);
      return SuggestionDataSource(firebaseFirestore: firebaseFirestore);
    });

final Provider<SuggestionConverter> suggestionConverterProvider =
Provider ((ref) {
  return SuggestionConverter();
});


final Provider<SuggestionRepositoryImpl> suggestionRepositoryProvider =
    Provider((ref) {
      final domainUserConverter = ref.read(domainUserConverterProvider);
      final domainUser = domainUserConverter.fromFirebaseUser(firebaseUser: firebaseAuth.currentUser!);
      final suggestionDatasource = ref.read(suggestionDatasourceProvider);
final  suggestionConverter = ref
      return SuggestionRepositoryImpl(
          suggestionDatasource, domainUser);
    });


