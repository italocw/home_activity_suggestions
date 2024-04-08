import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/entities/suggestion_category.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/category_icon.dart';

import '../atoms/category_name.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key,
    required this.category,
  });

  final SuggestionCategory category;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Color(category.color)),
      ),
      child:  ListTile(contentPadding: const EdgeInsets.all(16.0),
        leading: CategoryIcon(iconData: category.iconData),
        title: CategoryName(name: category.name,),
      ),

    );
  }
}
