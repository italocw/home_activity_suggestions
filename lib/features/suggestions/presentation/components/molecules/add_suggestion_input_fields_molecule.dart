import 'package:flutter/material.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/description_input.dart';
import 'package:home_activity_suggestions/features/suggestions/presentation/components/atoms/title_input.dart';

class AddSuggestionInputFieldsMolecule extends StatelessWidget {
  const AddSuggestionInputFieldsMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [TitleInput(), DescriptionInput()],
    );
  }
}
