import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';

import '../molecules/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});

  final List<SuggestionCategory> categories;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(8),
      children: categories
          .map(
            (category) => CategoryItem(
              category: category,
            ),
          )
          .toList(),
    );
  }
}
