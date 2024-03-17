import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({required this.titleText, super.key});

  final String titleText;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleText),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
