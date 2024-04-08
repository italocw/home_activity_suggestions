import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SuggestionCategory {
  final String id;
  final String name;
  final IconData iconData;
  final int color;

  SuggestionCategory({
    required this.id,
    required this.name,
    required this.iconData,
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
    iconData: Icons.book,
    color: 0xFF3498DB,
  ),
  SuggestionCategory(
    id: '2',
    name: 'Movies & TV Shows',
    iconData: Icons.movie,
    color: 0xFFE74C3C,
  ),
  SuggestionCategory(
    id: '3',
    name: 'Recipes',
    iconData: Icons.restaurant_menu,
    color: 0xFF2ECC71,
  ),
  SuggestionCategory(
    id: '4',
    name: 'Board Games',
    iconData: Icons.games,
    color: 0xFFF39C12,
  ),
  SuggestionCategory(
    id: '5',
    name: 'Music',
    iconData: Icons.music_note,
    color: 0xFF9B59B6,
  ),
  SuggestionCategory(
    id: '6',
    name: 'Video Games',
    iconData: Icons.videogame_asset,
    color: 0xFFF1C40F,
  ),
  SuggestionCategory(
    id: '7',
    name: 'Online Channels & Profiles',
    iconData: Icons.language,
    color: 0xFFE91E63,
  ),
  SuggestionCategory(
    id: '8',
    name: 'Outras',
    iconData: Icons.more_horiz,
    color: 0xFFCCCCCC,
  ),
];


