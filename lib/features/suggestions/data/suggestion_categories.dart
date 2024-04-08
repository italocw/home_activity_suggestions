import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';

import '../domain/entities/suggestion_category.dart';

final Provider<List<SuggestionCategory>> categoriesProvider = Provider((ref) {
  final appLocalizations = ref.read(appLocalizationsProvider);
  final categories = [
    SuggestionCategory(
      id: '1',
      name: appLocalizations.books,
      iconData: Icons.book,
      color: 0xFF3498DB,
    ),
    SuggestionCategory(
      id: '2',
      name: appLocalizations.movie_and_tv_shows,
      iconData: Icons.movie,
      color: 0xFFE74C3C,
    ),
    SuggestionCategory(
      id: '3',
      name: appLocalizations.recipes,
      iconData: Icons.restaurant_menu,
      color: 0xFF2ECC71,
    ),
    SuggestionCategory(
      id: '4',
      name: appLocalizations.board_games,
      iconData: Icons.deck,
      color: 0xFFF39C12,
    ),
    SuggestionCategory(
      id: '5',
      name: appLocalizations.music,
      iconData: Icons.music_note,
      color: 0xFF9B59B6,
    ),
    SuggestionCategory(
      id: '6',
      name: appLocalizations.video_games,
      iconData: Icons.videogame_asset,
      color: 0xFFF1C40F,
    ),
    SuggestionCategory(
      id: '7',
      name: appLocalizations.online_channels_and_profiles,
      iconData: Icons.language,
      color: 0xFFE91E63,
    ),
    SuggestionCategory(
      id: '8',
      name: appLocalizations.others,
      iconData: Icons.more_horiz,
      color: 0xFFCCCCCC,
    ),
  ];
  
  
  return categories;
});
