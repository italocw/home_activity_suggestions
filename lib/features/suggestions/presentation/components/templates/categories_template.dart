import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/organisms/categories_list.dart';

class CategoriesTemplate extends ConsumerWidget {
  const CategoriesTemplate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.read(categoriesProvider);
    return Container(child: CategoriesList(categories: categories));
  }
}
