import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/data/repositories/suggestion_repository_impl.dart';

Provider<FirebaseFirestore> get firebaseFirestoreProvider => Provider((ref) {
      return FirebaseFirestore.instance;
    });

Provider<FirebaseAuth> get firebaseAuthProvider => Provider((ref) {
      return FirebaseAuth.instance;
    });

Provider<SuggestionDataSource> get suggestionDatasourceProvider =>
    Provider((ref) {
      final firebaseFirestore = ref.read(firebaseFirestoreProvider);
      return SuggestionDataSource(firebaseFirestore: firebaseFirestore);
    });

Provider<SuggestionRepositoryImpl> get suggestionRepositoryProvider =>
    Provider((ref) {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final suggestionDatasource = ref.read(suggestionDatasourceProvider);

      return SuggestionRepositoryImpl(
          suggestionDatasource, firebaseAuth.currentUser);
    });
