import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_activity_suggestions/core/providers.dart';
import 'package:home_activity_suggestions/features/suggestions/domain/usecases/usecases_providers.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/organisms/categories_list.dart';

import '../../../../../core/components/organisms/custom_app_bar.dart';

class CategoriesTemplate extends ConsumerWidget {
  const CategoriesTemplate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listCategories = ref.read(listCategoriesProvider);
    final appTitle = ref.read(appLocalizationsProvider).app_title;
    return  Scaffold(
      appBar: CustomAppBar(
          titleText:appTitle),
      body: CategoriesList(categories: listCategories()),
    );
  }
}
