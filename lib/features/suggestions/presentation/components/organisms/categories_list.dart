import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/category_icon.dart';

import '../atoms/category_name.dart';
import '../molecules/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categories});

  final List<SuggestionCategory> categories;

  @override
  Widget build(BuildContext context) {
    return ListView(
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
