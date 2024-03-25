
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/authentication/data/data_providers.dart';

import 'package:home_activity_suggestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:home_activity_suggestions/features/suggestions/data/repositories/suggestion_repository_impl.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/suggestion_converter.dart';

final Provider<FirebaseFirestore> firebaseFirestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});

final Provider<FirebaseAuth> firebaseAuthProvider = Provider((ref) {
  return FirebaseAuth.instance;
});

final Provider<SuggestionDataSource> suggestionDatasourceProvider =
    Provider((ref) {
  final firebaseFirestore = ref.read(firebaseFirestoreProvider);
  return SuggestionDataSource(firebaseFirestore: firebaseFirestore);
});


final Provider<SuggestionConverter> suggestionConverterProvider =
    Provider((ref) {
      final suggestionCategoryLocator= ref.read(suggestionCategoryLocatorProvider);
  return SuggestionConverter(categoryLocator:suggestionCategoryLocator);
});

final Provider<SuggestionRepositoryImpl> suggestionRepositoryProvider =
    Provider((ref) {
  final suggestionConverter = ref.read(suggestionConverterProvider);
  final currentDomainUser = ref.read(authRepositoryProvider).currentDomainUser!;
  final suggestionDatasource = ref.read(suggestionDatasourceProvider);
  return SuggestionRepositoryImpl(
      dataSource: suggestionDatasource,
      currentUser: currentDomainUser,
      suggestionConverter: suggestionConverter);
});
