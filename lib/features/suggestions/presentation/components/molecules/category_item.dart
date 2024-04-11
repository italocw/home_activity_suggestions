import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/categories_state.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/category_icon.dart';

import '../atoms/category_name.dart';

class CategoryItem extends ConsumerWidget {
  const CategoryItem({super.key,
    required this.category,
  });

  final SuggestionCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: ()   => ref.read(categoriesNotifierProvider).openCategory(category: category, context: context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Color(category.color)),
        ),
        child:  ListTile(contentPadding: const EdgeInsets.all(16.0),
          leading: CategoryIcon(iconData: category.iconData),
          title: CategoryName(name: category.name,),
        ),
      
      ),
    );
  }
}
