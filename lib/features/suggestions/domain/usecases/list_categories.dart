

import '../entities/suggestion_category.dart';

class ListCategories {
final List<SuggestionCategory> _categories;

ListCategories({required List<SuggestionCategory> categories}) : _categories = categories;
List<SuggestionCategory> call() => _categories;
}
