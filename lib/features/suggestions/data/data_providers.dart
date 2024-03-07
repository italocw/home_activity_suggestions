import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';

import 'package:home_activity_sugestions/features/suggestions/data/datasource/suggestion_remote_datasource.dart';
import 'package:home_activity_sugestions/features/suggestions/data/firebase_auth_service.dart';
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

      return SuggestionRepositoryImpl(suggestionDatasource, firebaseAuth);
    });

Provider<FirebaseAuthService> get firebaseAuthServiceProvider =>
    Provider((ref) {
      final firebaseAuth = ref.read(firebaseAuthProvider);

      return FirebaseAuthService(firebaseAuth);
    });
