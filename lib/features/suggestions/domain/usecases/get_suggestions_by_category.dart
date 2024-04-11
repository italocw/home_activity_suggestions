import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/repositories/suggestion_repository.dart';

import '../../presentation/selected_category_state.dart';

class GetSuggestionsByCategory {
  final SuggestionRepository _repository;
final SuggestionCategory _suggestionCategory;

  GetSuggestionsByCategory({required SuggestionRepository suggestionRepository, required SuggestionCategory suggestionCategory }) : _repository = suggestionRepository, _suggestionCategory = suggestionCategory;

  List<Suggestion> call() => _repository.getSuggestionsByCategory(categoryId: _suggestionCategory.id);
}
