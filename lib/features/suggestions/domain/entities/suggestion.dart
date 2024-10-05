import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:equatable/equatable.dart';

class Suggestion extends Equatable {
  final String title;
  final String description;
  final SuggestionCategory category;

  const Suggestion(
      {required this.title, required this.description, required this.category});

  @override
  List<Object> get props => [title, description, category];

  @override
  bool get stringify => true;
}
