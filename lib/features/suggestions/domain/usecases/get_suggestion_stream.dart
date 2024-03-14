import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_activity_sugestions/features/suggestions/domain/repositories/suggestion_repository.dart';

class GetSuggestionStream {
  final SuggestionRepository repository;

  GetSuggestionStream(this.repository);

  Stream<QuerySnapshot<Object?>> call() => repository.snapshots;
}
