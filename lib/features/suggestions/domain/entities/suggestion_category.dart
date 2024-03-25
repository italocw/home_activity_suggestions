import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuggestionCategory {
  final String id;
  final String name;
  final IconData icon;
  final String color;

  SuggestionCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

class SuggestionCategoryLocator {
  final List<SuggestionCategory> _categories;

  SuggestionCategoryLocator({required List<SuggestionCategory> categories}) : _categories = categories;

  SuggestionCategory locateCategoryById({required String id}) =>
      _categories.firstWhere((category) => id == category.id);
}

final Provider<SuggestionCategoryLocator> suggestionCategoryLocatorProvider =
Provider ((ref)  => SuggestionCategoryLocator(categories: _categories));

final Provider<List<SuggestionCategory>> categoriesProvider =
Provider ((ref)  => _categories);

final _categories = [
  SuggestionCategory(
    id: '1',
    name: 'Books',
    icon: Icons.book,
    color: '#3498db',
  ),
  SuggestionCategory(
    id: '2',
    name: 'Movies & TV Shows',
    icon: Icons.movie,
    color: '#e74c3c',
  ),
  SuggestionCategory(
    id: '3',
    name: 'Recipes',
    icon: Icons.restaurant_menu,
    color: '#2ecc71',
  ),
  SuggestionCategory(
    id: '4',
    name: 'Board Games',
    icon: Icons.games,
    color: '#f39c12',
  ),
  SuggestionCategory(
    id: '5',
    name: 'Music',
    icon: Icons.music_note,
    color: '#9b59b6',
  ),
  SuggestionCategory(
    id: '6',
    name: 'Video Games',
    icon: Icons.videogame_asset,
    color: '#f1c40f',
  ),
  SuggestionCategory(
    id: '7',
    name: 'Online Channels & Profiles',
    icon: Icons.language,
    color: '#e91e63',
  ),
  SuggestionCategory(
    id: '8',
    name: 'Outras',
    icon: Icons.more_horiz,
    color: '#CCCCCC',
  )
];
